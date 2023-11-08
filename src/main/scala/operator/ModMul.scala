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
    val dout = IO(Decoupled(new ModMulOutput(width)))

    val p   = RegInit(0.U((width + 2).W))
    val a   = RegInit(0.U((width + 2).W))
    val x   = RegInit(0.U(width.W))
    val y   = RegInit(0.U(width.W))
    val m   = RegInit(0.U(width.W))
    val res = RegInit(0.U(width.W))

    val count    = RegInit(0.U(log2Ceil(width + 1).W))
    val countMax = RegInit((width).U(log2Ceil(width + 1).W))
    
    val idle :: init :: s1 :: s2 :: s3 :: end :: Nil = Enum(6)
    val status = RegInit(idle)

    din.ready     := true.B
    dout.valid    := false.B
    dout.bits.res := DontCare

    switch(status){
        is(idle){
            when(din.ready && din.valid){ 
                status := init
            }.otherwise{
                status := idle
            }
        }
        is(init){
            x          := din.bits.mult
            y          := din.bits.multcand
            m          := din.bits.mod
            p          := 0.U
            count      := 0.U
            status     := s1
        }
        is(s1){
            a      := p + Mux(x(count), y, 0.U)
            status := s2
        }
        is(s2){
            p      := Mux(a(0), (a + m) >> 1.U, a >> 1.U)
            count  := count + 1.U
            status := s3
        }
        is(s3){
            when(count === countMax){
                res    := Mux(p > m, p - m, p)
                status := end
            }.otherwise{
                status := s1
            }  
        }
        is(end){
            dout.bits.res := res
            dout.valid    := true.B
            status        := idle
        }
    }
}