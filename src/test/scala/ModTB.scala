// package test

// import operator._
// import chisel3._
// import chiseltest._
// import org.scalatest.freespec.AnyFreeSpec

// class ModTB extends AnyFreeSpec with ChiselScalatestTester{
//     "DUT should calculate" in{
//         test(new Mod(8, 8, 8)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
//         dut.clock.setTimeout(0)
//         dut.din.bits.base.poke(236)
//         dut.din.bits.mod.poke(239)
//         dut.din.valid.poke(true.B)
//         dut.clock.step(2560)
//         dut.dout.ready.poke(true.B)
//         }
//     }
// }
