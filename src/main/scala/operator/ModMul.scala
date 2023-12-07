package operator

import chisel3._
import chisel3.util._

class ModMulInput(mult_width: Int, multcand_width: Int, mod_width: Int) extends Bundle
{
    val mult     = UInt(mult_width.W)
    val multcand = UInt(multcand_width.W)
    val mod      = UInt(mod_width.W)
}

class ModMulOutput(mod_width: Int) extends Bundle
{
    val res = UInt(mod_width.W)
}

class ModMul(val mult_width: Int, val multcand_width: Int, val mod_width: Int) extends Module 
{
    val din  = IO(Flipped(Decoupled(new ModMulInput(mult_width, multcand_width, mod_width))))
    val dout = IO(ValidIO(new ModMulOutput(mod_width)))

    val p   = RegInit(0.U((mod_width + 2).W))
    val a   = RegInit(0.U((mod_width + 2).W))
    val x   = RegInit(0.U(mult_width.W))
    val y   = RegInit(0.U(multcand_width.W))
    val m   = RegInit(0.U(mod_width.W))
    val res = RegInit(0.U(mod_width.W))

    val din_ready_reg  = RegInit(true.B)
    val dout_valid_reg = RegInit(false.B)
    val zero_reg       = RegInit(0.U(1.W))

    val count     = RegInit(0.U(log2Ceil(mod_width + 1).W))
    val count_max = RegInit((mod_width).U(log2Ceil(mod_width + 1).W))
    
    object ModMulSel extends ChiselEnum
    {
        val S0, S1, S2, S3, S4, S5 = Value
    }
    import ModMulSel._
    val status = RegInit(S0)

    din.ready     := din_ready_reg
    dout.valid    := dout_valid_reg
    dout.bits.res := res

    switch(status)
    {
        is(S0)
        {
            dout_valid_reg := false.B
            when(din.ready && din.valid)
            {
                status := S1
            }.otherwise
            {
                status := S0
            }
        }
        is(S1)
        {
            x          := din.bits.mult
            y          := din.bits.multcand
            m          := din.bits.mod
            p          := zero_reg
            count      := zero_reg
            status     := S2
        }
        is(S2)
        {
            a      := p + Mux(x(count), y, 0.U)
            status := S3
        }
        is(S3)
        {
            p      := Mux(a(0), (a + m) >> 1.U, a >> 1.U)
            count  := count + 1.U
            status := S4
        }
        is(S4)
        {
            when(count === count_max)
            {
                res    := Mux(p > m, p - m, p)
                status := S5
            }.otherwise
            {
                status := S2
            }  
        }
        is(S5)
        {
            dout_valid_reg := true.B
            status := S0
        }
    }
}