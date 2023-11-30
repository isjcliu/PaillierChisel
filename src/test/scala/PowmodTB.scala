package test

import operator._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class PowmodTB extends AnyFreeSpec with ChiselScalatestTester{
    "DUT should calculate" in{
        test(new Powmod(1024, 1024, 2048)).withAnnotations(Seq(WriteVcdAnnotation)){dut =>
        dut.clock.setTimeout(0)
        dut.din.bits.base.poke(BigInt("DCACCB55CF88EA68E446B32DB82C3FF575D2DCE44886FE3FD3C3F31EA6B52316435CAC02A7063F6FB2B6F48B168DA049B8BE04319B0CF9C4EF2A5872E7E5AEC62B095733FC0AC6788A5DDA12E3C9BF4FE736A3E3A4236ECBC2426384BC16604D3C21712CD0D1C381FC4E731A1A0635885C428A08490B567E3215D30DE10351C", 16))
        dut.din.bits.exp.poke(BigInt("FE998C61EC47053063D2C930EAA54E72DB8A2988F2811AA09AEC39DF20AADACD203AA30E90015652C16CAE62012F9AA78C901E78DF4C71C9E1D7DA6F4E83BECA7496618FBC2EB63D65C26082F02E2D093F07490F65A77400C7C9C9304CA3B3632F2DBE558CDDF794DCEC6CD2BB2FF6FF4B1B3EC3D8C668B9416A3057FF2204A0", 16))
        dut.din.bits.expk.poke(BigInt("35FE852FACA8D4DB89D5F35BF6D8A5B7063A8D48E32776D89E949E70C57FF6072B43989F6C99D664627B0C18AF8BF70E4F2D558A0DCBC0FDDC283A07F7F9364530954DD98812A0FE65E378D6FB63A7AD549B9A7C3A9C033864BD1F230FB3A526D10643A9F86669E64B0B18EE92B04EAF14EF983096D249565D9C7EE6D0D5FF2F5750F5D11E03D65D9AE1922356E6F2D9C267E4C8B8144A5308DA5B4ADA2D9DE99097BBAD67E3A1FE3241613E4F6FA339F2C03E26F102A7E93866855AA75AFBCB733A8FEEAA4888A52CB22142E23467A460026D23DFD101AFCC5DE867540BFB8C9E24A45AB666A422429DDC46ABE50437D942454F40001B7C97294F3CE08A41C", 16))
        dut.din.bits.exp2k.poke(BigInt("E13C1F1F9C9D625FE426F669426683F6FA7C041685588388AD8D9F402A345E38B059B5C5019B7CC92EC1215A2D2E64CCFC3D89A7226D02A17507C398E0FEF84B5F405129B71B19853ABFE49ECC5EC07840A27268561A7ED4841CFD2FE4C67C1A009DED2865843CAA5E135F842AABF3A002D04388FFF2918FBAC9808B4D11EBF27D4F2352AE34DECA1B51C7391DC8D85512C3E3939C310340138AC87EAA1644CDD64DF20CFC804FA3388565781FFDD28FE448443923E2333C9195B1755C455C402BCA22E0B2F0B04FB6F05732E67A0AB631A78F9DEA7DF8BE5B5A397FC8D7AC0E75D45D58D314FDA95B13DA08134D865BDE676F70B18532F384AE5BCD720BB50", 16))
        dut.din.bits.mod.poke(BigInt("16F747F874D6503EC0ABE01262F60AB1DE82938F95FB6981ADA4F94816268BB169EF9DADA3BF203C854235BFDC17EE98A55E49B21FEBEEE748EE511FF468C40E26FF26D4950B87D0025486960D1DFAAF03E206651CC205CCC53EECE9FB8C11F881B8B111F17F6B08DF92D895EACD8B3075B30096FF249F9553D4EDD30D5BE0012F80FE9A72BD11B0EC35FDB7126A52FBDA88231050689CAB2A21AB1E1EC2A66020A20C0649976F145FB6E6B85F8C74E408CD7402B015CD9766F3C7F8365264633529D95D307CADC4E13359FE2A59E251F9A2E532B48BE7435D626022526E7A3504EB6D9C9353C7CB71137779C7C0273FAEC3FCB275745CEF4AC709BB4A5C4E2C", 16))
        dut.din.valid.poke(true.B)
        dut.clock.step(1024000)
        }
    }
}