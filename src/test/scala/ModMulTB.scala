package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class ModMulTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new ModMul(8)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.valid.poke(true.B)
        dut.din.bits.mult.poke(202)
        dut.din.bits.multcand.poke(236)
        dut.din.bits.mod.poke(239)
        // dut.din.bits.mult.poke(BigInt("5782FFFCAF6113EDB048B7CBF038E2FB4A5EEF8956982B7B373FE5DB76B411AC", 16))
        // dut.din.bits.multcand.poke(BigInt("DD5A831C3761020781CC364ED40C9A35A14BB8F7F12C0885546BFECB593F6ECF", 16))
        // dut.din.bits.mod.poke(BigInt("FD5A831C3761020781CC364ED40C9A35A14BB8F7F12C0885546BFECB593F6ECF", 16))
        dut.clock.step(20480)
        }
    }
}
