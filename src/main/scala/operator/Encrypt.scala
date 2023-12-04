// package paillier
// import chisel3._

// class EncryptParam(width: Int) extends Module{
//     val expk  = UInt(width.W)
//     val exp2k = UInt(width.W)
//     val Rmodk = UInt(width.W)
// }

// class EncryptInput(data_width: Int, mod_width: Int, random_width: Int) extends Module{
//     val g     = UInt(width.W)
//     val m     = UInt(width.W)
//     val r     = UInt(width.W)
//     val n     = UInt(width.W)
//     val mod   = UInt(width.W)
//     val param = new EncryptParam
// }

// class PaillierEnc extends Module{
//     val din = IO(Flipped(Decoupled(new EncryptInput(, ))))
//     val dout = IO(ValidIO(new EncryptOutput()))

//     val g = RegInit()
//     val m = RegInit()
//     val r = RegInit()
//     val n = RegInit()
//     val mod = RegInit()
//     val expk = RegInit()
//     val exp2k = RegInit()
//     val r_mod_k = RegInit()

//     val pm1_din_valid_reg = RegInit()
//     val pm2_din_valid_reg = RegInit()

//     val pm1 = Module(new Powmod(, , ,))
//     pm1.din.valid      := pm1_din_valid_reg
//     pm1.din.bits.base  := pm1_din_base_reg
//     pm1.din.bits.exp   := pm1_din_base_reg
//     pm1.din.bits.mod   := mod
//     pm1.din.bits.expk  := expk
//     pm1.din.bits.exp2k := exp2k

//     val pm2_din_valid_reg = RegInit(false.B)
//     val pm2_din_base_reg  = RegInit()
//     val pm2_din_exp_reg   = RegInit()
//     val pm2 = Module(new Powmod(, , ,))
//     pm2.din.valid      := pm2_din_valid_reg
//     pm2.din.bits.base  := pm2_din_base_reg
//     pm2.din.bits.exp   := pm2_din_exp_reg
//     pm2.din.bits.mod   := mod
//     pm2.din.bits.expk  := expk
//     pm2.din.bits.exp2k := exp2k

//     val mp_din_valid_reg = RegInit(false.B)
//     val mp_mult          = RegInit()
//     val mp_multcand      = RegInit()
//     val mp = Module(new ModMul(, , ,))
//     mp.din.valid         := mp_din_valid_reg
//     mp.din.bits.mult     := mp_mult
//     mp.din.bits.multcand := mp_multcand
//     mp.din.bits.mod      := mod


// }