package test

import paillier._
import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class EncryptTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new  PaillierEnc(8, 8, 8, 8, 8)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.bits.g.poke(211)
        dut.din.bits.m.poke(25)
        dut.din.bits.r.poke(115)
        dut.din.bits.n.poke(231)
        dut.din.bits.mod.poke(215)
        dut.din.bits.param.expkm.poke(41)
        dut.din.bits.param.exp2km.poke(176)
        
        dut.din.valid.poke(true.B)
        dut.clock.step(8192)
        }
    }
}