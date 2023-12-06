// package operator

// import chisel3._
// import chisel3.util._

// class ModInput(val base_width: Int, val mod_width: Int) extends Bundle{
//     val base = Int((base_width + 1).W)
//     val mod = Int((mod_width + 1).W)
// }

// class Modoutput(val res_width: Int) extends Bundle{
//     val res = Int((res_width + 1).W)
// }

// class Mod(base_width: Int, mod_width: Int, res_width: Int) extends Module{
//     val din = Flipped(Decoupled(new ModInput(base_width, mod_width)))
//     val dout = Decoupled(new Modoutput(res_width))

//     val base = RegInit(0((base_width + 2).W))
//     val mod = RegInit(0((mod_width + 1).W))

//     val idle :: init :: exec :: end :: Nil = Enum(4)
//     val status = RegInit(idle)

//     din.ready := true.B
//     dout.valid := false.B
//     dout.bits.res := DontCare
    
//     switch(status){
//         is(idle){
//             when(din.valid && din.ready){
//                 stauts := init
//             }.otherwise{
//                 status := idle
//             }
//         }
//         is(init){
//             base := din.bits.base
//             mod := din.btis.mod
//             status := exec
//         }
//         is(exec){
//             when(base < 0){
//                 base := base + mod
//             }.elsewhen(base > mod){
//                 base := base - mod
//             }.otherwise{
//                 status := end 
//             }
//         }
//     }
//     when(dout.valid && dout.ready){
//         dout.bits.res := base
//     }
// }