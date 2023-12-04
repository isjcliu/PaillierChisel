package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class PowmodTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new Powmod(1024, 1024, 2048)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.bits.base.poke(BigInt("7D7E3E1656D9FECF1AF5E0A39608BC7E7CD07CBFFA76FDA55476D4FEA85DE51D", 16))
        dut.din.bits.exp.poke(BigInt("2F10649FCE15932F864B049304E02B54EA579962A47701BAF9E3B8C6A54541FE", 16))
        dut.din.bits.mod.poke(BigInt("27CBACFB1F139B151DF09D9B8E6A54123720F517FC1F9BE0B9C77840AFD3F4E9", 16))
        dut.din.bits.expk.poke(BigInt("1139F21D458A5D814C5C4E5AA9820792B53A4170174258BBA5532E7BE108428A", 16))
        dut.din.bits.exp2k.poke(BigInt("1E4F2C991950FD59EB839970148A3678E469F73AD5AAD65C720B5D593FFB5B33", 16))
        
        dut.din.valid.poke(true.B)
        dut.clock.step(1024000)
        }
    }
}