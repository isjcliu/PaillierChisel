package operator
import chisel3._

class ModInvert extends Module{
    val io = IO(new Bundle{
        val en = Input(Bool())
        val a = Input(UInt(1024.W))
        val p = Input(UInt(1024.W))
        val out = Output(UInt(1024.W))
    })
    
    val v = RegInit(0.U(UInt(1024.W)))
    val u = RegInit(0.U(UInt(1024.W)))
    val b = RegInit(0.U(UInt(1.W)))
    val s = RegInit(0.U(UInt(1.W)))
    val k = RegInit(0.U(UInt(1.W))) 

    when(io.en){
        v := io.a
        u := io.p
    }
    when(v > 0){
        when(u(0) === 0){
            u << 1
            s >> 1
        }
        when(v(0) === 0){
            v << 1
            c >> 1
        }
        when(u > v){
            u := u -v
            c >> 1
        }.otherwise{
            v = (v - u) << 1
            s := b + s
            b = b >> 1
        }
        k := k + 1
    }
    when(c >= p){c := c - p}
    io.out := c
}
