package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class ModMulTB extends AnyFreeSpec with ChiselScalatestTester
{
    "DUT should calculate" in
    {
        test(new ModMul(8, 8, 8)).withAnnotations(Seq(WriteVcdAnnotation))
        {
            dut =>
            dut.clock.setTimeout(0)
            dut.din.valid.poke(true.B)
            dut.din.bits.mult.poke(119)
            dut.din.bits.multcand.poke(17)
            dut.din.bits.mod.poke(239)
            dut.clock.step(512)
        }
    }
}
