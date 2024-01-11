import operator._
import paillier._
import chisel3.stage.ChiselGeneratorAnnotation
import circt.stage.{ChiselStage, FirtoolOption}
object Main extends App {
  (new ChiselStage).execute(
    Array("--target", "verilog"),
    Seq(
      ChiselGeneratorAnnotation(() =>
        new PaillierEnc(1024, 256, 1024, 1024, 2048)
      ),
      FirtoolOption("--disable-all-randomization")
    )
  )
}
