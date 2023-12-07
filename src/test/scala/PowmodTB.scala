package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class PowmodTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new Powmod(8, 8, 8)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.bits.base.poke(154)
        dut.din.bits.exp.poke(123)
        dut.din.bits.mod.poke(253)
        dut.din.bits.expkm.poke(3)
        dut.din.bits.exp2km.poke(9)
        
        dut.din.valid.poke(true.B)
        dut.clock.step(1024)
        }
    }
}