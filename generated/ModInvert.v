module ModInvert(
  input        clock,
  input        reset,
  output       din_ready, // @[src/main/scala/operator/ModInvert.scala 15:17]
  input        din_valid, // @[src/main/scala/operator/ModInvert.scala 15:17]
  input  [7:0] din_bits_base, // @[src/main/scala/operator/ModInvert.scala 15:17]
  input  [7:0] din_bits_mod, // @[src/main/scala/operator/ModInvert.scala 15:17]
  input        dout_ready, // @[src/main/scala/operator/ModInvert.scala 16:18]
  output       dout_valid, // @[src/main/scala/operator/ModInvert.scala 16:18]
  output [7:0] dout_bits_res // @[src/main/scala/operator/ModInvert.scala 16:18]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] base; // @[src/main/scala/operator/ModInvert.scala 18:23]
  reg [7:0] mod; // @[src/main/scala/operator/ModInvert.scala 19:22]
  reg [7:0] res; // @[src/main/scala/operator/ModInvert.scala 20:22]
  reg [7:0] u; // @[src/main/scala/operator/ModInvert.scala 21:20]
  reg [7:0] v; // @[src/main/scala/operator/ModInvert.scala 22:20]
  reg [3:0] status; // @[src/main/scala/operator/ModInvert.scala 26:25]
  wire  _T_4 = base != 8'h0; // @[src/main/scala/operator/ModInvert.scala 48:23]
  wire [7:0] _base_T = {{1'd0}, base[7:1]}; // @[src/main/scala/operator/ModInvert.scala 49:30]
  wire [3:0] _GEN_1 = _T_4 & base[0] ? 4'h4 : 4'h0; // @[src/main/scala/operator/ModInvert.scala 51:56 52:24 56:24]
  wire [7:0] _GEN_2 = _T_4 & base[0] ? res : v; // @[src/main/scala/operator/ModInvert.scala 20:22 51:56 54:21]
  wire  _GEN_3 = _T_4 & base[0] ? 1'h0 : 1'h1; // @[src/main/scala/operator/ModInvert.scala 30:16 51:56 55:28]
  wire [7:0] _GEN_4 = base != 8'h0 & ~base[0] ? _base_T : base; // @[src/main/scala/operator/ModInvert.scala 48:50 49:22 18:23]
  wire [3:0] _GEN_5 = base != 8'h0 & ~base[0] ? 4'h3 : _GEN_1; // @[src/main/scala/operator/ModInvert.scala 48:50 50:24]
  wire [7:0] _GEN_6 = base != 8'h0 & ~base[0] ? res : _GEN_2; // @[src/main/scala/operator/ModInvert.scala 20:22 48:50]
  wire  _GEN_7 = base != 8'h0 & ~base[0] ? 1'h0 : _GEN_3; // @[src/main/scala/operator/ModInvert.scala 30:16 48:50]
  wire [7:0] _u_T = {{1'd0}, u[7:1]}; // @[src/main/scala/operator/ModInvert.scala 61:24]
  wire [7:0] _u_T_2 = u + mod; // @[src/main/scala/operator/ModInvert.scala 64:25]
  wire [7:0] _u_T_3 = {{1'd0}, _u_T_2[7:1]}; // @[src/main/scala/operator/ModInvert.scala 64:32]
  wire [7:0] _GEN_8 = ~u[0] ? _u_T : _u_T_3; // @[src/main/scala/operator/ModInvert.scala 60:31 61:19 64:19]
  wire [7:0] _mod_T = {{1'd0}, mod[7:1]}; // @[src/main/scala/operator/ModInvert.scala 70:28]
  wire [7:0] _GEN_10 = ~mod[0] ? _mod_T : mod; // @[src/main/scala/operator/ModInvert.scala 69:33 70:21 19:22]
  wire [3:0] _GEN_11 = ~mod[0] ? 4'h5 : 4'h6; // @[src/main/scala/operator/ModInvert.scala 69:33 71:24 73:24]
  wire [7:0] _v_T = {{1'd0}, v[7:1]}; // @[src/main/scala/operator/ModInvert.scala 78:24]
  wire [7:0] _v_T_2 = v + mod; // @[src/main/scala/operator/ModInvert.scala 81:25]
  wire [7:0] _v_T_3 = {{1'd0}, _v_T_2[7:1]}; // @[src/main/scala/operator/ModInvert.scala 81:32]
  wire [7:0] _GEN_12 = v == 8'h0 ? _v_T : _v_T_3; // @[src/main/scala/operator/ModInvert.scala 77:28 78:19 81:19]
  wire [7:0] _base_T_2 = base - mod; // @[src/main/scala/operator/ModInvert.scala 87:30]
  wire [7:0] _mod_T_2 = mod - base; // @[src/main/scala/operator/ModInvert.scala 90:28]
  wire [7:0] _GEN_14 = base > mod ? _base_T_2 : base; // @[src/main/scala/operator/ModInvert.scala 86:29 87:22 18:23]
  wire [3:0] _GEN_15 = base > mod ? 4'h7 : 4'h8; // @[src/main/scala/operator/ModInvert.scala 86:29 88:24 91:24]
  wire [7:0] _GEN_16 = base > mod ? mod : _mod_T_2; // @[src/main/scala/operator/ModInvert.scala 19:22 86:29 90:21]
  wire [7:0] _u_T_5 = u - v; // @[src/main/scala/operator/ModInvert.scala 96:24]
  wire [7:0] _u_T_9 = _u_T_2 - v; // @[src/main/scala/operator/ModInvert.scala 99:30]
  wire [7:0] _GEN_17 = u > v ? _u_T_5 : _u_T_9; // @[src/main/scala/operator/ModInvert.scala 95:24 96:19 99:19]
  wire [7:0] _v_T_5 = v - u; // @[src/main/scala/operator/ModInvert.scala 105:24]
  wire [7:0] _v_T_9 = _v_T_2 - u; // @[src/main/scala/operator/ModInvert.scala 108:30]
  wire [7:0] _GEN_19 = v > u ? _v_T_5 : _v_T_9; // @[src/main/scala/operator/ModInvert.scala 104:24 105:19 108:19]
  wire [7:0] _GEN_21 = 4'h8 == status ? _GEN_19 : v; // @[src/main/scala/operator/ModInvert.scala 32:19 22:20]
  wire [3:0] _GEN_22 = 4'h8 == status ? 4'h2 : status; // @[src/main/scala/operator/ModInvert.scala 32:19 26:25]
  wire [7:0] _GEN_23 = 4'h7 == status ? _GEN_17 : u; // @[src/main/scala/operator/ModInvert.scala 32:19 21:20]
  wire [3:0] _GEN_24 = 4'h7 == status ? 4'h2 : _GEN_22; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [7:0] _GEN_25 = 4'h7 == status ? v : _GEN_21; // @[src/main/scala/operator/ModInvert.scala 32:19 22:20]
  wire [7:0] _GEN_26 = 4'h6 == status ? _GEN_14 : base; // @[src/main/scala/operator/ModInvert.scala 32:19 18:23]
  wire [3:0] _GEN_27 = 4'h6 == status ? _GEN_15 : _GEN_24; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [7:0] _GEN_28 = 4'h6 == status ? _GEN_16 : mod; // @[src/main/scala/operator/ModInvert.scala 32:19 19:22]
  wire [7:0] _GEN_29 = 4'h6 == status ? u : _GEN_23; // @[src/main/scala/operator/ModInvert.scala 32:19 21:20]
  wire [7:0] _GEN_30 = 4'h6 == status ? v : _GEN_25; // @[src/main/scala/operator/ModInvert.scala 32:19 22:20]
  wire [7:0] _GEN_31 = 4'h5 == status ? _GEN_12 : _GEN_30; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [3:0] _GEN_32 = 4'h5 == status ? 4'h6 : _GEN_27; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [7:0] _GEN_33 = 4'h5 == status ? base : _GEN_26; // @[src/main/scala/operator/ModInvert.scala 32:19 18:23]
  wire [7:0] _GEN_34 = 4'h5 == status ? mod : _GEN_28; // @[src/main/scala/operator/ModInvert.scala 32:19 19:22]
  wire [7:0] _GEN_35 = 4'h5 == status ? u : _GEN_29; // @[src/main/scala/operator/ModInvert.scala 32:19 21:20]
  wire [7:0] _GEN_36 = 4'h4 == status ? _GEN_10 : _GEN_34; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [3:0] _GEN_37 = 4'h4 == status ? _GEN_11 : _GEN_32; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [7:0] _GEN_38 = 4'h4 == status ? v : _GEN_31; // @[src/main/scala/operator/ModInvert.scala 32:19 22:20]
  wire [7:0] _GEN_39 = 4'h4 == status ? base : _GEN_33; // @[src/main/scala/operator/ModInvert.scala 32:19 18:23]
  wire [7:0] _GEN_40 = 4'h4 == status ? u : _GEN_35; // @[src/main/scala/operator/ModInvert.scala 32:19 21:20]
  wire [7:0] _GEN_41 = 4'h3 == status ? _GEN_8 : _GEN_40; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [3:0] _GEN_42 = 4'h3 == status ? 4'h4 : _GEN_37; // @[src/main/scala/operator/ModInvert.scala 32:19]
  wire [7:0] _GEN_43 = 4'h3 == status ? mod : _GEN_36; // @[src/main/scala/operator/ModInvert.scala 32:19 19:22]
  wire [7:0] _GEN_44 = 4'h3 == status ? v : _GEN_38; // @[src/main/scala/operator/ModInvert.scala 32:19 22:20]
  wire [7:0] _GEN_45 = 4'h3 == status ? base : _GEN_39; // @[src/main/scala/operator/ModInvert.scala 32:19 18:23]
  wire  _GEN_59 = 4'h1 == status ? 1'h0 : 4'h2 == status & _GEN_7; // @[src/main/scala/operator/ModInvert.scala 30:16 32:19]
  assign din_ready = 1'h1; // @[src/main/scala/operator/ModInvert.scala 28:15]
  assign dout_valid = 4'h0 == status ? 1'h0 : _GEN_59; // @[src/main/scala/operator/ModInvert.scala 30:16 32:19]
  assign dout_bits_res = res; // @[src/main/scala/operator/ModInvert.scala 113:35 114:23]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 18:23]
      base <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 18:23]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (4'h1 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        base <= din_bits_base; // @[src/main/scala/operator/ModInvert.scala 41:18]
      end else if (4'h2 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        base <= _GEN_4;
      end else begin
        base <= _GEN_45;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 19:22]
      mod <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 19:22]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (4'h1 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        mod <= din_bits_mod; // @[src/main/scala/operator/ModInvert.scala 42:17]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        mod <= _GEN_43;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 20:22]
      res <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 20:22]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (!(4'h1 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        if (4'h2 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
          res <= _GEN_6;
        end
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 21:20]
      u <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 21:20]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (4'h1 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        u <= 8'h1; // @[src/main/scala/operator/ModInvert.scala 43:15]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        u <= _GEN_41;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 22:20]
      v <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 22:20]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (4'h1 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        v <= 8'h0; // @[src/main/scala/operator/ModInvert.scala 44:15]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
        v <= _GEN_44;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModInvert.scala 26:25]
      status <= 4'h0; // @[src/main/scala/operator/ModInvert.scala 26:25]
    end else if (4'h0 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      if (din_ready & din_valid) begin // @[src/main/scala/operator/ModInvert.scala 34:41]
        status <= 4'h1; // @[src/main/scala/operator/ModInvert.scala 35:24]
      end else begin
        status <= 4'h0; // @[src/main/scala/operator/ModInvert.scala 37:24]
      end
    end else if (4'h1 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      status <= 4'h2; // @[src/main/scala/operator/ModInvert.scala 45:20]
    end else if (4'h2 == status) begin // @[src/main/scala/operator/ModInvert.scala 32:19]
      status <= _GEN_5;
    end else begin
      status <= _GEN_42;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  base = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  mod = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  res = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  u = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  v = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  status = _RAND_5[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
