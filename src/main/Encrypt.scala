package operator
import chisel3._

class Encrypt extends Module{
    val io = IO(new Bundle{
        val pubKey = new PubKey
        val prikey = new prikey
        val in = Input(UInt(256.W))
        val out = Output(UInt(2048.W))
    })
    val temp = RegInit(0.U(2048.W))
    val montModMul1 = new MontgomeryModMul
    montModMul1.io.in1 := io.pubKey.g
    montModMul1.io.in2 := io.in
    montModMul1.io.in3 := io.pubKey.nSq
    temp := montModMul1.io.out


}
