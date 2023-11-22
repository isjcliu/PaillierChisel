package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class PowmodTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new Powmod(8, 8)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.bits.base.poke(236.U)
        dut.din.bits.exp.poke(202.U)
        dut.din.bits.expk.poke(17.U)
        dut.din.bits.exp2k.poke(50.U)
        dut.din.bits.mod.poke(239.U)
        dut.din.valid.poke(true.B)
        dut.dout.ready.poke(true.B)
        dut.clock.step(1024)
        }
    }
}