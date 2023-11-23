package operator

import chisel3._
import chisel3.util._

class ModMulInput(width: Int) extends Bundle {
    val mult     = UInt(width.W)
    val multcand = UInt(width.W)
    val mod      = UInt(width.W)
}

class ModMulOutput(width: Int) extends Bundle {
    val res      = UInt(width.W)
}

class ModMul(width: Int) extends Module {
    val din  = IO(Flipped(Decoupled(new ModMulInput(width))))
    val dout = IO(ValidIO(new ModMulOutput(width)))

    val p   = RegInit(0.U((width + 2).W))
    val a   = RegInit(0.U((width + 2).W))
    val x   = RegInit(0.U(width.W))
    val y   = RegInit(0.U(width.W))
    val m   = RegInit(0.U(width.W))
    val res = RegInit(0.U(width.W))

    val din_ready_reg  = RegInit(true.B)
    val dout_valid_reg = RegInit(false.B)
    val zero_reg       = RegInit(0.U(1.W))

    val count     = RegInit(0.U(log2Ceil(width + 1).W))
    val count_max = RegInit((width).U(log2Ceil(width + 1).W))
    
    val s0 :: s1 :: s2 :: s3 :: s4 :: s5 :: Nil = Enum(6)
    val status = RegInit(s0)

    din.ready     := din_ready_reg
    dout.valid    := dout_valid_reg
    dout.bits.res := res

    switch(status){
        is(s0){
            dout_valid_reg := false.B
            when(din.ready && din.valid){
                status := s1
            }.otherwise{
                status := s0
            }
        }
        is(s1){
            x          := din.bits.mult
            y          := din.bits.multcand
            m          := din.bits.mod
            p          := zero_reg
            count      := zero_reg
            status     := s2
        }
        is(s2){
            a      := p + Mux(x(count), y, 0.U)
            status := s3
        }
        is(s3){
            p      := Mux(a(0), (a + m) >> 1.U, a >> 1.U)
            count  := count + 1.U
            status := s4
        }
        is(s4){
            when(count === count_max){
                res    := Mux(p > m, p - m, p)
                status := s5
            }.otherwise{
                status := s2
            }  
        }
        is(s5){
            dout_valid_reg := true.B
            status := s0
        }
    }
}