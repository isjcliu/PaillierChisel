import chisel3._
import chisel3.stage._
import operator._

object main extends App {
    emitVerilog(new ModMul(256), Array("--target-dir", "generated"))
}