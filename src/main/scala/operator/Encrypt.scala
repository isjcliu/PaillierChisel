package paillier

import chisel3._
import chisel3.util._
import operator._

class EncryptParam(mod_width: Int) extends Bundle{
    val expkm  = UInt(mod_width.W)
    val exp2km = UInt(mod_width.W)
}

class EncryptInput(g_width: Int, m_width: Int, r_width: Int, n_width: Int, mod_width: Int) extends Bundle{
    val g     = UInt(g_width.W)
    val m     = UInt(m_width.W)
    val r     = UInt(r_width.W)
    val n     = UInt(n_width.W)
    val mod   = UInt(mod_width.W)
    val param = new EncryptParam(mod_width)
}

class EncryptOutput(mod_width: Int) extends Bundle{
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
    val expkm   = RegInit(0.U(mod_width.W))
    val exp2km  = RegInit(0.U(mod_width.W))
    val res     = RegInit(0.U(mod_width.W))

    val pm1_din_valid_reg = RegInit(false.B)
    val pm1 = Module(new Powmod(g_width, m_width, mod_width))
    pm1.din.valid       := pm1_din_valid_reg
    pm1.din.bits.base   := g
    pm1.din.bits.exp    := m
    pm1.din.bits.mod    := mod
    pm1.din.bits.expkm  := expkm
    pm1.din.bits.exp2km := exp2km

    val pm2_din_valid_reg = RegInit(false.B)
    val pm2 = Module(new Powmod(r_width, n_width, mod_width))
    pm2.din.valid       := pm2_din_valid_reg
    pm2.din.bits.base   := r
    pm2.din.bits.exp    := n
    pm2.din.bits.mod    := mod
    pm2.din.bits.expkm  := expkm
    pm2.din.bits.exp2km := exp2km

    val mp_din_valid_reg = RegInit(false.B)
    val mp_mult          = RegInit(0.U(mod_width.W))
    val mp_multcand      = RegInit(0.U(mod_width.W))
    val mp = Module(new ModMul(mod_width, mod_width, mod_width))
    mp.din.valid         := mp_din_valid_reg
    mp.din.bits.mult     := mp_mult
    mp.din.bits.multcand := mp_multcand
    mp.din.bits.mod      := mod
    
    val running        = RegInit(false.B)
    val mp_valid_1     = RegInit(false.B)
    val mp_valid_2     = RegInit(false.B)
    val convert        = RegInit(false.B)
    val din_ready_reg  = RegInit(true.B)
    val dout_valid_reg = RegInit(false.B)
    din.ready     := din_ready_reg
    dout.valid    := dout_valid_reg
    dout.bits.res := res
    
    when(din.ready && din.valid)
    {
        running := true.B
    }.otherwise
    {
        running := false.B
    }

    when(running)
    {
        pm1_din_valid_reg := true.B
        pm2_din_valid_reg := true.B
        g                 := din.bits.g
        m                 := din.bits.m
        r                 := din.bits.r
        n                 := din.bits.n
        mod               := din.bits.mod
        expkm             := din.bits.param.expkm
        exp2km            := din.bits.param.exp2km
    }.otherwise
    {
        pm1_din_valid_reg := false.B
        pm2_din_valid_reg := false.B
        dout_valid_reg    := false.B
    }

    when(pm1.dout.valid === true.B)
    {
        mp_mult    := pm1.dout.bits.res
        mp_valid_1 := true.B
    }
    when(pm2.dout.valid === true.B)
    {
        mp_multcand := pm2.dout.bits.res
        mp_valid_2  := true.B
    }

    when(mp_valid_1 && mp_valid_2)
    {
        mp_valid_1       := false.B
        mp_valid_2       := false.B
        mp_din_valid_reg := true.B
    }
    when(mp.dout.valid === true.B)
    {
        dout_valid_reg := true.B
        res            := mp.dout.bits.res
        running        := false.B
    }
}