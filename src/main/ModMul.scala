package operator
import chisel3._

class ModMulInput extends Module{
    val in1 = UInt(2048.W)
    val in2 = UInt(2048.W)
    val in3 = UInt(2048.W)
}

class ModMulOutput extends Module{
    val res = UInt(2048.W)
}

class ModMul extends Module{
    val din = IO(Flipped(Decoupled(new ModMulInput)))
    val dout = IO(Decoupled(new ModMulOutput))

    val p = RegInit(0.U(width.W))
    val x = Reg(UInt(2048.W))
    val y = Reg(UInt(2048.W))
    val m = Reg(UInt(2048.W))
    val a = Reg(UInt())
    val z = Reg(UInt())
    val count = Reg(Uint())
    val busy = RegInit(false.B)
    din.ready := !busy

    when(busy){
        when(count !== 0){
            a := p + x(count) * y
            p := Mux(a(0), (a + m) >> 1.U, a >> 1.U)
            count := count - 1.U
        }
        dout.bits.res := Mux(p > m, p  - m, p)
        dout.valid := true.B
        when(dout.ready && dout.valid){
            p := 0.U
            busy := false.B
            count := log2Ceil(width.W)
        }
    }.otherwise{
        when(din.valid){
            x := din.bits.in1
            y := din.bits.in2
            m := din.bits.in3
            busy := true.B
            count := log2Ceil(width.W)
        }
    }
}
