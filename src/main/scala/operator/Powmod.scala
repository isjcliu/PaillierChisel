package operator
import chisel3._
import chisel3.util._

class PowmodInput(base_width: Int, exp_width: Int, mod_width: Int) extends Bundle{
    val base  = UInt(base_width.W)
    val exp   = UInt(exp_width.W)
    val mod   = UInt(mod_width.W)
    val expk  = UInt(mod_width.W)
    val exp2k = UInt(mod_width.W)
}
class PowmodOutput(mod_width: Int) extends Bundle{
    val res = UInt(mod_width.W)
}
// res = y^x mod m
class Powmod(val base_width: Int, val exp_width: Int, val mod_width: Int) extends Module{
    val din  = IO(Flipped(Decoupled(new PowmodInput(base_width, exp_width, mod_width))))
    val dout = IO(ValidIO(new PowmodOutput(mod_width)))
    
    val x            = RegInit(0.U(exp_width.W))
    val e            = RegInit(0.U(mod_width.W))
    val ty           = RegInit(0.U(mod_width.W))
    val res          = RegInit(0.U(mod_width.W))

    val mp_mult           = RegInit(0.U(mod_width.W))
    val mp_multcand       = RegInit(0.U(mod_width.W))
    val mp_mod            = RegInit(0.U(mod_width.W))
    val mp_din_valid_reg  = RegInit(false.B)

    val zero_reg          = RegInit(0.U(1.W))
    val one_reg           = RegInit(1.U(1.W))
    val din_ready_reg     = RegInit(true.B)
    val dout_valid_reg    = RegInit(false.B)
    

    val count = RegInit(0.U((log2Ceil(mod_width) + 1).W))
    val count_max = RegInit((mod_width).U((log2Ceil(mod_width) + 1).W))
    
    val s0 :: s1 :: s2 :: s3 :: s4 :: s5 :: s6 :: s7 :: s8 :: s9:: Nil = Enum(10)
    val status  = RegInit(s0)

    din.ready     := din_ready_reg
    dout.valid    := dout_valid_reg
    dout.bits.res := res
    
    val mp = Module(new ModMul(mod_width, mod_width, mod_width))
    mp.din.valid         := mp_din_valid_reg
    mp.din.bits.mult     := mp_mult
    mp.din.bits.multcand := mp_multcand
    mp.din.bits.mod      := mp_mod

    switch(status){
        is(s0){
            when(din.ready && din.valid){
                status := s1
            }.otherwise{
                status := s0
            }
        }
        is(s1){
            mp_din_valid_reg := true.B
            x                := din.bits.exp
            e                := din.bits.expk
            mp_mult          := din.bits.base
            mp_multcand      := din.bits.exp2k
            mp_mod           := din.bits.mod
            count            := zero_reg
            status           := s2
        }
        is(s2){
            when(mp.dout.valid === true.B){
                ty     := mp.dout.bits.res
                status := s3
            }.otherwise{
                mp_din_valid_reg := false.B
                status           := s2
            }
        }
        is(s3){
            when(count === count_max){
                status := s8
            }.otherwise{
                when(x(count) === 1.U){
                    status := s4
                }.otherwise{
                    status := s6
                }
            }
        }
        is(s4){
            mp_din_valid_reg := true.B
            mp_mult          := e
            mp_multcand      := ty
            status           := s5
        }
        is(s5){
            when(mp.dout.valid === true.B){
                e      := mp.dout.bits.res
                status := s6
            }.otherwise{
                mp_din_valid_reg := false.B
                status           := s5
            }
        }
        is(s6){
            mp_mult              := ty
            mp_multcand          := ty
            mp_din_valid_reg     := true.B
            status               := s7
        }
        is(s7){
            when(mp.dout.valid === true.B){
                ty     := mp.dout.bits.res
                count  := count + 1.U
                status := s3
            }.otherwise{
                mp_din_valid_reg := false.B
                status           := s7
            }
        }
        is(s8){
            mp_mult          := e
            mp_multcand      := one_reg
            mp_din_valid_reg := true.B
            status           := s9
        }
        is(s9){
            when(mp.dout.valid === true.B){
                res            := mp.dout.bits.res
                dout_valid_reg := true.B
                status         := s0
            }.otherwise{
                mp_din_valid_reg := false.B
                status           := s9
            }
        }
    }
}
