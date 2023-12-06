package paillier
import chisel3._

class EncryptParam(mod_width: Int) extends Module{
    val expk  = UInt(width.W)
    val exp2k = UInt(width.W)
    val Rmodk = UInt(width.W)
}

class EncryptInput(g_width: Int, m_width: Int, r_width: Int, n_width: Int, mod_width: Int) extends Module{
    val g     = UInt(g_width.W)
    val m     = UInt(m_width.W)
    val r     = UInt(r_width.W)
    val n     = UInt(n_width.W)
    val mod   = UInt(mod_width.W)
    val param = new EncryptParam(mod_width)
}

class EncryptOutput(mod_width: Int) extends Module{
    val res = UInt(mod_width.W)
}
class PaillierEnc(val g_width: Int, val m_width: Int, val r_width: Int, val n_width: Int, val mod_width: Int) extends Module{
    val din = IO(Flipped(Decoupled(new EncryptInput(g_width, m_width, r_width, n_width, mod_width))))
    val dout = IO(ValidIO(new EncryptOutput(mod_width)))

    val g       = RegInit(0.U(g_width.W))
    val m       = RegInit(0.U(m_width.W))
    val r       = RegInit(0.U(r_width.W))
    val n       = RegInit(0.U(n_width.W))
    val mod     = RegInit(0.U(mod_width.W))
    val expk    = RegInit(0.U(mod_width.W))
    val exp2k   = RegInit(0.U(mod_width.W))
    val r_mod_k = RegInit(0.U(mod_width.W))

    val pm1_din_valid_reg = RegInit(false.B)
    val pm1 = Module(new Powmod(1024, 256, 2048))
    pm1.din.valid      := pm1_din_valid_reg
    pm1.din.bits.base  := g
    pm1.din.bits.exp   := m
    pm1.din.bits.mod   := mod
    pm1.din.bits.expk  := expk
    pm1.din.bits.exp2k := exp2k

    val pm2_din_valid_reg = RegInit(false.B)
    val pm2 = Module(new Powmod(1024, 1024, 2048))
    pm2.din.valid      := pm2_din_valid_reg
    pm2.din.bits.base  := r
    pm2.din.bits.exp   := n
    pm2.din.bits.mod   := mod
    pm2.din.bits.expk  := expk
    pm2.din.bits.exp2k := exp2k

    val mp_din_valid_reg = RegInit(false.B)
    val mp_mult          = RegInit(0.U(mod_width.W))
    val mp_multcand      = RegInit(0.U(mod_width.W))
    val mp = Module(new ModMul(2048, 2048, 2048))
    mp.din.valid         := mp_din_valid_reg
    mp.din.bits.mult     := mp_mult
    mp.din.bits.multcand := mp_multcand
    mp.din.bits.mod      := mod

    
}