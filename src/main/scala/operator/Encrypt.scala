// package paillier
// import chisel3._

// class EncryptParam(width: Int) extends Module{
//     val expk  = UInt(width.W)
//     val exp2k = UInt(width.W)
//     val Rmodk = UInt(width.W)
// }

// class EncryptInput(width: Int) extends Module{
//     val g     = UInt(width.W)
//     val m     = UInt(width.W)
//     val r     = UInt(width.W)
//     val n     = UInt(width.W)
//     val mod   = UInt(width.W)
//     val param = new EncryptParam
// }

// class PaillierEnc extends Module{
//     val din = IO(Flipped(Decoupled(new EncryptInput(, ))))
//     val dout = IO(ValidIO())

//     val g = RegInit()
//     val m = RegInit()
//     val r = RegInit()
//     val n = RegInit()
//     val mod = RegInit()
//     val expk = RegInit()
//     val exp2k = RegInit()
//     val r_mod_k = RegInit()


// }