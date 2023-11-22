package operator
import chisel3._
import chisel3.util._

class PowmodInput(exp_width: Int, mod_width: Int) extends Bundle{
    val base  = UInt(mod_width.W)
    val exp   = UInt(mod_width.W)
    val mod   = UInt(mod_width.W)
    val expk  = UInt(mod_width.W)
    val exp2k = UInt(mod_width.W)
}
class PowmodOutput(mod_width: Int) extends Bundle{
    val res = UInt(mod_width.W)
}
// res = y^x mod m
class Powmod(val exp_width: Int, val mod_width: Int) extends Module{
    val din  = IO(Flipped(Decoupled(new PowmodInput(exp_width, mod_width))))
    val dout = IO(Decoupled(new PowmodOutput(mod_width)))
    
    val y     = RegInit(0.U(mod_width.W))
    val x     = RegInit(0.U(mod_width.W))
    val m     = RegInit(0.U(mod_width.W))
    val e     = RegInit(0.U(mod_width.W))
    val ty    = RegInit(0.U(mod_width.W))
    val exp2k = RegInit(0.U(mod_width.W))
    val res   = RegInit(0.U(mod_width.W))
    
    val i = RegInit(0.U((log2Ceil(mod_width) + 1).W))
    val k = RegInit(mod_width.U((log2Ceil(mod_width) + 1).W))
    
    val idle :: init :: s1 :: s2 :: s3 :: s4 :: s5 :: s6 :: end :: Nil = Enum(9)
    val status = RegInit(idle)

    din.ready     := false.B
    dout.valid    := false.B
    dout.bits.res := DontCare
    
    val mp = Module(new ModMul(mod_width))
    mp.din.bits.mult     := 0.U
    mp.din.bits.multcand := 0.U
    mp.din.bits.mod      := 0.U
    mp.din.valid         := false.B
    mp.dout.ready        := false.B

    switch(status){
        is(init){
            x                    := din.bits.exp
            e                    := din.bits.expk
            mp.din.bits.mult     := din.bits.base
            mp.din.bits.multcand := din.bits.exp2k
            mp.din.bits.mod      := din.bits.mod
            mp.din.valid         := true.B
            status               := s1
        }
        is(s1){
            when(mp.dout.ready === true.B){
                ty     := mp.dout.bits.res
                status := s2
            }.otherwise{
                status := init
            }

        }
        is(s2){
            when(x(i) === 1.U){
                mp.din.bits.mult     := e
                mp.din.bits.multcand := ty
                mp.din.valid         := true.B
                status               := s3
            }.otherwise{
                status := s4
            }
        }
        is(s3){
            when(mp.dout.ready === true.B){
                e      := mp.dout.bits.res
                status := s4
            }.otherwise{
                status := s2
            }
        }
        is(s4){
            mp.din.bits.mult     := ty
            mp.din.bits.multcand := ty
            mp.din.valid         := true.B
        }
        is(s5){
            when(mp.dout.ready === true.B){
                ty := mp.dout.bits.res
                when(i =/= k){
                    i >> 1.U
                    status := s2
                }.otherwise{
                    status := s6
                }
            }
        }
        is(s6){
            mp.din.bits.mult     := 1.U
            mp.din.bits.multcand := e
            mp.din.valid         := true.B
            status               := end 
        }
        is(end){
            when(mp.dout.valid === true.B){
                res := mp.dout.bits.res
            }
        }
    }
}