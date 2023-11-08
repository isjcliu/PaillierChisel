package test

import
import main._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class ModMulTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new ModMul).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.din.bits.in1.poke(42)
        dut.din.bits.in2.poke(3)
        dut.din.bits.in3.poke(5)
        dut.din.valid.poke(true.B)
        dut.clock.step(100)
        }
    }
}
