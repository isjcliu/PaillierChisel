package operator
import chisel3._

class ModSubInput(width:Input) extends Module{
    val in1 = UInt()
    val in2 = UInt()
    val in3 = UInt()
}
class ModSubOutput extends Module{
    val res = UInt()
}
class BinaryModSub(width:UInt) extends Module{
    val din = IO(Flipped(Decoupled(new ModSubInput())))
    val dout = IO
    val sum = RegInit(0.U((width + 1).W))
    val z1 = RegInit(0.U((width + 1).W))
    val z2 = RegInit(0.U((width + 1).W))
    val c1 = RegInit(0.U((width + 1).W))
    when(en){
        z1 := io.in1 + io.in2
        z2 := 

        c1 := z1 << width
        c2 := z2 << width

        when((c1 === 0)&(c2 === 0)){
            end := true.B
        }.otherwise{
            val modAdd3 = new ModAdd
            end := true.B
        }
    }
}