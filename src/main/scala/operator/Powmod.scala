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
    
    val x     = RegInit(0.U(mod_width.W))
    val e     = RegInit(0.U(mod_width.W))
    val ty    = RegInit(0.U(mod_width.W))
    val exp2k = RegInit(0.U(mod_width.W))
    val res   = RegInit(0.U(mod_width.W))
    
    val count    = RegInit(0.U((log2Ceil(mod_width) + 1).W))
    val countMax = RegInit(mod_width.U((log2Ceil(mod_width) + 1).W))
    
    val idle :: init :: conv :: s1 :: g1 :: s2 :: g2 :: s3 :: g3 :: end :: Nil = Enum(9)
    
    din.ready     := false.B
    dout.valid    := false.B
    dout.bits.res := DontCare
    
    val modMul = Module(new ModMul(mod_width))
    modMul.din.bits.mult     := 0.U
    modMul.din.bits.multcand := 0.U
    modMul.din.bits.mod      := din.bits.mod
    modMul.din.valid         := false.B
    modMul.dout.ready        := false.B
    
    switch(status){
        is(idle){
            when(din.ready && din.valid){
                status           := init
                modMul.din.ready := true.B
            }.otherwise{
                status := idle
            }
        }
        is(init){
            x                        := din.bits.exp
            e                        := din.bits.expk
            modMul.din.bits.mult     := din.bits.base
            modMul.din.bits.multcand := din.bits.exp2k
            modMul.din.bits.mod      := din.bits.mod

            when(modMul.dout.valid === true.B){
                ty     := modmul.dout.bits.res
                status := s1
            }.otherwise{
                status := init
            }
        }
        is(S1){
            ty := modMul.dout.bits.res
            dout.bits.res := ty
        }
    }
    // switch(status){
    //     is(IDLE){//0
    //         when(din.ready && din.valid){
    //             status := INIT
    //         }.otherwise{
    //             status := IDLE
    //         }
    //     }
    //     is(INIT){//1
    //         exp2k := din.bits.exp2k
    //         y := din.bits.base
    //         x := din.bits.exp
    //         m := din.bits.mod
    //         e := din.bits.expk
    //         count := 0.U
    //         status := CONV
    //     }
    //     is(CONV){//2
    //         modMul.din.valid := true.B
    //         status := SA1
    //     }
    //     is(SA1){//3
    //         modMul.din.bits.mult := y
    //         modMul.din.bits.multcand := exp2k
    //         modMul.din.bits.mod := m
    //         when(modMul.dout.valid === true.B){
    //             status := GA1
    //         }
    //     }
    //     is(GA1){//5
  
    //         y := modMul.dout.bits.res
    //         status := S1
    //     }
    //     is(S1){//6
    //         when(x(count) === 1.U){
    //             modMul.din.valid := true.B
    //             status := SA2
    //         }.otherwise{
    //             status := S2
    //         }
    //     }
    //     is(SA2){//7
    //         modMul.din.bits.mult := e
    //         modMul.din.bits.multcand := y
    //         modMul.din.bits.mod := m
    //         modMul.dout.ready := true.B    
    //         status := GA2
    //     }
    //     is(GA2){//8
    //         e := modMul.dout.bits.res
    //         status := S2
    //     }
    //     is(S2){//9
    //         modMul.din.bits.mult := y
    //         modMul.din.bits.multcand := y
    //         modMul.din.bits.mod := m
    //         modMul.din.valid := true.B
    //         modMul.dout.ready := true.B
    //         status := S3
    //     }
    //     is(S3){//10
    //         y := modMul.dout.bits.res
    //         when(count === countMax){
    //             modMul.din.bits.mult := 1.U
    //             modMul.din.bits.multcand := e
    //             modMul.din.bits.mod := m
    //             modMul.din.valid := true.B
    //             modMul.dout.ready := true.B
    //             status := END
    //         }.otherwise{
    //             count := count + 1.U
    //             status := S1
    //         }
    //     }
    //     is(END){//11
    //         res := modMul.dout.bits.res 
    //         dout.valid := true.B
    //         status := IDLE
    //     }
    // }
    // when(dout.ready && dout.valid){
    //     dout.bits.res := res
    // }
}