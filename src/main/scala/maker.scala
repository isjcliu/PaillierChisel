import chisel3._
import chisel3.stage._
import operator._

object main extends App {
    // emitVerilog(new Powmod(256, 1024, 2048), Array("--target-dir", "generated"))
    emitVerilog(new Powmod(1024, 1024, 2048), Array("--target-dir", "generated"))
    // emitVerilog()
}