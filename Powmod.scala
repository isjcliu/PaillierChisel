package operator
import chisel3._
import chisel3.util._

class PowmodInput extends Module{
    val in1 = UInt(2048.W)
    val in2 = UInt(320.W)
    val in3 = UInt(2048.W)
}

class PowmodOutput(val width: UInt) extends Module{
    val res = UInt(2048.W)
}

class Powmodextends Module{
    val din = IO(Flipped(Decoupled(PowmodInput)))
    val dout = IO(Decoupled(PowmodOutput))
    
    val modMul = new ModMul
    val k = RegInit("".U(2049.W))
    val e = Reg(UInt())
    val ty = Reg(UInt())
    val x = Reg(UInt())
    val y = Reg(UInt())
    val m = Reg(UInt())

    val busy = RegInit(false.B)
    val count = RegInit(0.U(12.W))

    val resValid = RegInit(false.B)

    din.ready := !busy
    when(busy){
        when(count <= k){
            modMul.din.bits.in1 := e
            modMul.din.bits.in2 := e
            modMul.din.bits.in3 := m
            modMul.din.ready := true.B
            modMul.dout.ready := true.B
            e := modMul.dout.res
            when(x(k - count)){
                modMul.din.bits.in1 := temp
                modMul.din.bits.in2 := ty
                modMul.din.bits.in3 := m
                modMul.din.ready := true.B
                modMul.dout.ready := true.B
                e := modMul.dout.bits.res
            }
            count := count + 1.U
        }
        modMul.din.bits.in1 := e
        modMul.din.bits.in2 := 1
        modMul.din.bits.in3 := m
        modMul.din.ready := true.B
        modMul.dout.ready := true.B

        dout.bits.res := modMul.dout.bits.res
        dout.valid := true.B
    }.otherwise{
        when(din.valid){
            x := din.bits.in1
            y := din.bits.in2
            m := din.bits.in3
            e := 
            modMul.din.bits.in1 := y
            modMul.din.bits.in2 := k
            modMul.din.bits.in3 := m
            modMul.din.valid := true.B
            modMul.dout.ready := true.B

            ty := modMul.dout.bits.res
            
            
            busy := true.B
            count := 0
        }
    }
}