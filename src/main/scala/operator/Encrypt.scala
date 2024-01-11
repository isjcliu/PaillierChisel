package paillier

import chisel3._
import chisel3.util._
import operator._

class EncryptInput extends Bundle {
  val axi_data1 = UInt(32.W)
  val axi_data2 = UInt(32.W)
  val axi_data3 = UInt(32.W)
  val axi_data4 = UInt(32.W)
  val data_type = UInt(1.W)
}

class EncryptOutput(mod_width: Int) extends Bundle {
  val res = UInt(mod_width.W)
}

class PaillierEnc extends Module {
  val din = IO(Flipped(Decoupled(new EncryptInput)))
  val dout = IO(ValidIO(new EncryptOutput(mod_width)))

  val mod_width: Int = 2048
  val half_width: Int = 1024
  val m_width: Int = 256

  val m = Reg(Vec(m_width / 32, UInt(32.W)))
  val r = Reg(Vec(half_width / 32, UInt(32.W)))
  val g_n = Reg(Vec(mod_width / 32, UInt(32.W)))
  val mod = Reg(Vec(mod_width / 32, UInt(32.W)))
  val expkm = Reg(Vec(mod_width / 32, UInt(32.W)))
  val exp2km = Reg(Vec(mod_width / 32, UInt(32.W)))

  val res = Reg(Vec(mod_width, UInt(32.W)))

  val pm1 = Module(
    new Powmod(half_width, m_width, mod_width)
  )
  val pm1_din_valid = RegInit(false.B)
  val pm1_res = RegInit(0.U(mod_width.W))
  pm1.din.bits.base := g_n
  pm1.din.bits.exp := m
  pm1.din.bits.mod := mod
  pm1.din.bits.expkm := expkm
  pm1.din.bits.exp2km := exp2km

  val pm2 = Module(
    new Powmod(g_width, m_width, mod_width)
  )
  val pm2_din_valid = RegInit(false.B)
  val pm2_res = RegInit(0.U(mod_width.W))
  pm2.din.bits.base := r
  pm2.din.bits.exp := g_n
  pm2.din.bits.mod := mod
  pm2.din.bits.expkm := expkm
  pm2.din.bits.exp2km := exp2km

  val mp = Module(
    new ModMul(mod_width, mod_width, mod_width)
  )
  val mp_din_valid = RegInit(false.B)
  mp.din.bits.mult := pm1_res
  mp.din.bits.multcand := pm2_res
  mp.din.bits.mod := mod

  val status = RegInit(0.U(1.W))
  val running = RegInit(false.B)

  when(din.ready && din.valid) {
    running := true.B
  }.otherwise {
    running := false.B
  }
  when(running) {
    switch(status) {
      is(0.U) {
        when(fire_time <= max_fire_time) {
          g_n(fire_time) := axi_data1
          mod(fire_time) := axi_data2
          expkm(fire_time) := axi_data3
          exp2km(fire_time) := axi_data4
          fire_time := fire_time + 1.U
        }
      }
      is(1.U) {
        when(fire_time <= max_fire_time)
      }
    }
  }

//   val pm1_din_valid_reg = RegInit(false.B)
//   val pm1 = Module(
//     new Powmod(g_width, m_width, mod_width)
//   )
//   pm1.din.valid := pm1_din_valid_reg
//   pm1.din.bits.base := g
//   pm1.din.bits.exp := m
//   pm1.din.bits.mod := mod
//   pm1.din.bits.expkm := expkm
//   pm1.din.bits.exp2km := exp2km

//   val pm2_din_valid_reg = RegInit(false.B)
//   val pm2 = Module(
//     new Powmod(r_width, n_width, mod_width)
//   )
//   pm2.din.valid := pm2_din_valid_reg
//   pm2.din.bits.base := r
//   pm2.din.bits.exp := n
//   pm2.din.bits.mod := mod
//   pm2.din.bits.expkm := expkm
//   pm2.din.bits.exp2km := exp2km

//   val mp_din_valid_reg = RegInit(false.B)
//   val mp_mult = RegInit(0.U(mod_width.W))
//   val mp_multcand = RegInit(0.U(mod_width.W))
//   val mp = Module(new ModMul(mod_width, mod_width, mod_width))
//   mp.din.valid := mp_din_valid_reg
//   mp.din.bits.mult := mp_mult
//   mp.din.bits.multcand := mp_multcand
//   mp.din.bits.mod := mod

//   val running = RegInit(false.B)
//   val mp_valid_1 = RegInit(false.B)
//   val mp_valid_2 = RegInit(false.B)
//   val convert = RegInit(false.B)
//   val din_ready_reg = RegInit(true.B)
//   val dout_valid_reg = RegInit(false.B)
//   din.ready := din_ready_reg
//   dout.valid := dout_valid_reg
//   dout.bits.res := res

//   when(din.ready && din.valid) {
//     running := true.B
//   }.otherwise {
//     running := false.B
//   }

//   when(running) {
//     pm1_din_valid_reg := true.B
//     pm2_din_valid_reg := true.B
//     g := din.bits.m
//     r := din.bits.r
//     n := din.bits.n
//     mod := din.bits.mod
//     expkm := din.bits.param.expkm
//     exp2km := din.bits.param.exp2km
//   }.otherwise {
//     pm1_din_valid_reg := false.B
//     pm2_din_valid_reg := false.B
//     dout_valid_reg := false.B
//   }

//   when(pm1.dout.valid === true.B) {
//     mp_mult := pm1.dout.bits.res
//     mp_valid_1 := true.B
//   }
//   when(pm2.dout.valid === true.B) {
//     mp_multcand := pm2.dout.bits.res
//     mp_valid_2 := true.B
//   }

//   when(mp_valid_1 && mp_valid_2) {
//     mp_valid_1 := false.B
//     mp_valid_2 := false.B
//     mp_din_valid_reg := true.B
//   }
//   when(mp.dout.valid === true.B) {
//     dout_valid_reg := true.B
//     res := mp.dout.bits.res
//     running := false.B
//   }
}
