import chisel3._
import operator._
import chisel3.stage.ChiselGeneratorAnnotation
import circt.stage.{CIRCTTarget, CIRCTTargetAnnotation, ChiselStage}
import firrtl.{AnnotationSeq, EmittedVerilogCircuitAnnotation}
import firrtl.options.{Dependency, PhaseManager}

object emit_verilog {
  def apply(gen: => RawModule, args: Array[String] = Array.empty, annotations: AnnotationSeq = Seq.empty): String = {
    (new ChiselStage)
      .execute(
        Array("--target", "verilog") ++ args,
        ChiselGeneratorAnnotation(() => gen) +: annotations
      )
      .collectFirst {
        case EmittedVerilogCircuitAnnotation(a) => a
      }
      .get
      .value
  }
}
object Main extends App{
    emit_verilog(new Powmod(1024, 1024, 2048), Array("-td", "verilog"))
    emit_verilog(new ModMul(2048, 2048, 2048), Array("-td", "verilog"))
}