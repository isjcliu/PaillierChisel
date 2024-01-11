package operator

import chisel3._
import chisel3.util._


class ModInvertInput(base_width: Int, mod_width: Int) extends Bundle{
    val base = UInt(base_width.W)
    val mod = UInt(mod_width.W)
}
class ModInvertOutput(res_width: Int) extends Bundle{
    val res = UInt(res_width.W)
}


class ModInvert(val base_width: Int, val mod_width: Int) extends Module{
    val din = IO(Flipped(Decoupled(new ModInvertInput(base_width, mod_width))))
    val dout = IO(Decoupled(new ModInvertOutput(mod_width)))

    val u = RegInit(0.U(base_width.W))
    val v = RegInit(0.U(mod_width.W))
    val x = RegInit(0.U((mod_width + 1).W))
    val y = RegInit(0.U((mod_width + 1).W))
    val res = RegInit(0.U(mod_width.W))
    val mod = RegInit(0.U(mod_width.W))

    object ModInvertSel extends ChiselEnum{
    val IDLE, INIT, S1, S2, S3, END = Value
    }
    import ModInvertSel._
    val status = RegInit(IDLE)

    din.ready := true.B
    dout.bits.res := DontCare
    dout.valid := false.B

    switch(status){
        is(IDLE){
            when(din.ready && din.valid){
                status := INIT
            }.otherwise{
                status := IDLE
            }
        }
        is(INIT){
            u := din.bits.base
            v := din.bits.mod
            mod := din.bits.mod
            x := 1.U
            y := 0.U
            status := S1
        }
        is(S1){
            when(u =/= 0.U){
                status := S2
            }.otherwise{
                status := END
            }
        }
        is(S2){
            when(u(0) === 0.U && v(0) === 0.U){
                u := u >> 1.U
                v := v >> 1.U
                when(x(0) === 0.U){
                    x := x >> 1.U
                }.otherwise{
                    x := (x + mod) >> 1.U
                }
                when(y(0) === 0.U){
                    y := y >> 1.U
                }.otherwise{
                    y := (y + mod) >> 1.U
                }
                status := S3
            }.elsewhen(u(0) === 0.U && v(0) === 1.U){
                u := u >> 1
                when(x(0) === 0.U){
                    x := x >> 1.U
                }.otherwise{
                    x := (x + mod) >> 1.U
                }
                status := S3
            }.elsewhen(u(0) === 1.U && v(0) === 0.U){
                v := v >> 1
                 when(y(0) === 0.U){
                    y := y >> 1.U
                }.otherwise{
                    y := (y + mod) >> 1.U
                }
            }.otherwise{
                status := S3
            }
        }
        is(S3){
            when(u >= v){
                u := u - v
                when(x >= y){
                    x := x - y
                }.otherwise{
                    x := (x + mod) - y
                }
                status := S1
            }.otherwise{
                v := v - u
                when(y >= x){
                    y := y - x
                }.otherwise{
                    y := (y + mod) - x
                }
                status := S1
            }
        }
        is(END){
            res := Mux(y > mod, y - mod, y)
            dout.valid := true.B
        }
    }
    when(dout.valid && dout.ready){
        dout.bits.res := res
    }
}