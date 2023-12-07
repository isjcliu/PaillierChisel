import operator._
import paillier._
import chisel3._
import chisel3.stage._

object Main extends App
{
    emitVerilog(new ModMul(2048, 2048, 2048), Array("-td", "verilog"))
    emitVerilog(new Powmod(1024, 256, 2048), Array("-td", "verilog"))
    // emitVerilog(new Powmod(1024, 1024, 2048), Array("-td", "verilog"))
    emitVerilog(new PaillierEnc(1024, 256, 1024, 1024, 2048), Array("-td", "verilog"))


}