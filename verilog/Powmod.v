module ModMul(
  input           clock,
  input           reset,
  output          din_ready, // @[src/main/scala/operator/ModMul.scala 20:18]
  input           din_valid, // @[src/main/scala/operator/ModMul.scala 20:18]
  input  [2047:0] din_bits_mult, // @[src/main/scala/operator/ModMul.scala 20:18]
  input  [2047:0] din_bits_multcand, // @[src/main/scala/operator/ModMul.scala 20:18]
  input  [2047:0] din_bits_mod, // @[src/main/scala/operator/ModMul.scala 20:18]
  output          dout_valid, // @[src/main/scala/operator/ModMul.scala 21:18]
  output [2047:0] dout_bits_res // @[src/main/scala/operator/ModMul.scala 21:18]
);
`ifdef RANDOMIZE_REG_INIT
  reg [2079:0] _RAND_0;
  reg [2079:0] _RAND_1;
  reg [2047:0] _RAND_2;
  reg [2047:0] _RAND_3;
  reg [2047:0] _RAND_4;
  reg [2047:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [2049:0] p; // @[src/main/scala/operator/ModMul.scala 23:22]
  reg [2049:0] a; // @[src/main/scala/operator/ModMul.scala 24:22]
  reg [2047:0] x; // @[src/main/scala/operator/ModMul.scala 25:22]
  reg [2047:0] y; // @[src/main/scala/operator/ModMul.scala 26:22]
  reg [2047:0] m; // @[src/main/scala/operator/ModMul.scala 27:22]
  reg [2047:0] res; // @[src/main/scala/operator/ModMul.scala 28:22]
  reg  dout_valid_reg; // @[src/main/scala/operator/ModMul.scala 31:33]
  reg [11:0] count; // @[src/main/scala/operator/ModMul.scala 34:28]
  reg [2:0] status; // @[src/main/scala/operator/ModMul.scala 42:25]
  wire  _T_3 = din_ready & din_valid; // @[src/main/scala/operator/ModMul.scala 53:28]
  wire [2047:0] _a_T = x >> count; // @[src/main/scala/operator/ModMul.scala 72:32]
  wire [2047:0] _a_T_2 = _a_T[0] ? y : 2048'h0; // @[src/main/scala/operator/ModMul.scala 72:30]
  wire [2049:0] _GEN_37 = {{2'd0}, _a_T_2}; // @[src/main/scala/operator/ModMul.scala 72:25]
  wire [2049:0] _a_T_4 = p + _GEN_37; // @[src/main/scala/operator/ModMul.scala 72:25]
  wire [2049:0] _GEN_38 = {{2'd0}, m}; // @[src/main/scala/operator/ModMul.scala 77:36]
  wire [2049:0] _p_T_2 = a + _GEN_38; // @[src/main/scala/operator/ModMul.scala 77:36]
  wire [2049:0] _p_T_3 = {{1'd0}, _p_T_2[2049:1]}; // @[src/main/scala/operator/ModMul.scala 77:41]
  wire [2049:0] _p_T_4 = {{1'd0}, a[2049:1]}; // @[src/main/scala/operator/ModMul.scala 77:51]
  wire [2049:0] _p_T_5 = a[0] ? _p_T_3 : _p_T_4; // @[src/main/scala/operator/ModMul.scala 77:26]
  wire [11:0] _count_T_1 = count + 12'h1; // @[src/main/scala/operator/ModMul.scala 78:29]
  wire  _T_16 = count == 12'h800; // @[src/main/scala/operator/ModMul.scala 83:24]
  wire [2049:0] _res_T_2 = p - _GEN_38; // @[src/main/scala/operator/ModMul.scala 85:40]
  wire [2049:0] _res_T_3 = p > _GEN_38 ? _res_T_2 : p; // @[src/main/scala/operator/ModMul.scala 85:30]
  wire [2049:0] _GEN_1 = _T_16 ? _res_T_3 : {{2'd0}, res}; // @[src/main/scala/operator/ModMul.scala 84:13 28:22 85:24]
  wire [2:0] _GEN_2 = _T_16 ? 3'h5 : 3'h2; // @[src/main/scala/operator/ModMul.scala 84:13 86:24 89:24]
  wire  _GEN_3 = 3'h5 == status | dout_valid_reg; // @[src/main/scala/operator/ModMul.scala 49:5 94:28 31:33]
  wire [2:0] _GEN_4 = 3'h5 == status ? 3'h0 : status; // @[src/main/scala/operator/ModMul.scala 49:5 95:20 42:25]
  wire [2049:0] _GEN_5 = 3'h4 == status ? _GEN_1 : {{2'd0}, res}; // @[src/main/scala/operator/ModMul.scala 28:22 49:5]
  wire [2:0] _GEN_6 = 3'h4 == status ? _GEN_2 : _GEN_4; // @[src/main/scala/operator/ModMul.scala 49:5]
  wire  _GEN_7 = 3'h4 == status ? dout_valid_reg : _GEN_3; // @[src/main/scala/operator/ModMul.scala 31:33 49:5]
  wire [2049:0] _GEN_8 = 3'h3 == status ? _p_T_5 : p; // @[src/main/scala/operator/ModMul.scala 49:5 77:20 23:22]
  wire [11:0] _GEN_9 = 3'h3 == status ? _count_T_1 : count; // @[src/main/scala/operator/ModMul.scala 49:5 78:20 34:28]
  wire [2:0] _GEN_10 = 3'h3 == status ? 3'h4 : _GEN_6; // @[src/main/scala/operator/ModMul.scala 49:5 79:20]
  wire [2049:0] _GEN_11 = 3'h3 == status ? {{2'd0}, res} : _GEN_5; // @[src/main/scala/operator/ModMul.scala 28:22 49:5]
  wire  _GEN_12 = 3'h3 == status ? dout_valid_reg : _GEN_7; // @[src/main/scala/operator/ModMul.scala 31:33 49:5]
  wire [2049:0] _GEN_17 = 3'h2 == status ? {{2'd0}, res} : _GEN_11; // @[src/main/scala/operator/ModMul.scala 28:22 49:5]
  wire [2049:0] _GEN_26 = 3'h1 == status ? {{2'd0}, res} : _GEN_17; // @[src/main/scala/operator/ModMul.scala 28:22 49:5]
  wire [2049:0] _GEN_36 = 3'h0 == status ? {{2'd0}, res} : _GEN_26; // @[src/main/scala/operator/ModMul.scala 28:22 49:5]
  wire [2049:0] _GEN_43 = reset ? 2050'h0 : _GEN_36; // @[src/main/scala/operator/ModMul.scala 28:{22,22}]
  assign din_ready = 1'h1; // @[src/main/scala/operator/ModMul.scala 44:19]
  assign dout_valid = dout_valid_reg; // @[src/main/scala/operator/ModMul.scala 45:19]
  assign dout_bits_res = res; // @[src/main/scala/operator/ModMul.scala 46:19]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 23:22]
      p <= 2050'h0; // @[src/main/scala/operator/ModMul.scala 23:22]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        p <= 2050'h0; // @[src/main/scala/operator/ModMul.scala 66:24]
      end else if (!(3'h2 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        p <= _GEN_8;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 24:22]
      a <= 2050'h0; // @[src/main/scala/operator/ModMul.scala 24:22]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (!(3'h1 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        if (3'h2 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
          a <= _a_T_4; // @[src/main/scala/operator/ModMul.scala 72:20]
        end
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 25:22]
      x <= 2048'h0; // @[src/main/scala/operator/ModMul.scala 25:22]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        x <= din_bits_mult; // @[src/main/scala/operator/ModMul.scala 63:24]
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 26:22]
      y <= 2048'h0; // @[src/main/scala/operator/ModMul.scala 26:22]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        y <= din_bits_multcand; // @[src/main/scala/operator/ModMul.scala 64:24]
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 27:22]
      m <= 2048'h0; // @[src/main/scala/operator/ModMul.scala 27:22]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        m <= din_bits_mod; // @[src/main/scala/operator/ModMul.scala 65:24]
      end
    end
    res <= _GEN_43[2047:0]; // @[src/main/scala/operator/ModMul.scala 28:{22,22}]
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 31:33]
      dout_valid_reg <= 1'h0; // @[src/main/scala/operator/ModMul.scala 31:33]
    end else if (3'h0 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      dout_valid_reg <= 1'h0; // @[src/main/scala/operator/ModMul.scala 52:28]
    end else if (!(3'h1 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (!(3'h2 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        dout_valid_reg <= _GEN_12;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 34:28]
      count <= 12'h0; // @[src/main/scala/operator/ModMul.scala 34:28]
    end else if (!(3'h0 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        count <= 12'h0; // @[src/main/scala/operator/ModMul.scala 67:24]
      end else if (!(3'h2 == status)) begin // @[src/main/scala/operator/ModMul.scala 49:5]
        count <= _GEN_9;
      end
    end
    if (reset) begin // @[src/main/scala/operator/ModMul.scala 42:25]
      status <= 3'h0; // @[src/main/scala/operator/ModMul.scala 42:25]
    end else if (3'h0 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      status <= {{2'd0}, _T_3};
    end else if (3'h1 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      status <= 3'h2; // @[src/main/scala/operator/ModMul.scala 68:24]
    end else if (3'h2 == status) begin // @[src/main/scala/operator/ModMul.scala 49:5]
      status <= 3'h3; // @[src/main/scala/operator/ModMul.scala 73:20]
    end else begin
      status <= _GEN_10;
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
  _RAND_0 = {65{`RANDOM}};
  p = _RAND_0[2049:0];
  _RAND_1 = {65{`RANDOM}};
  a = _RAND_1[2049:0];
  _RAND_2 = {64{`RANDOM}};
  x = _RAND_2[2047:0];
  _RAND_3 = {64{`RANDOM}};
  y = _RAND_3[2047:0];
  _RAND_4 = {64{`RANDOM}};
  m = _RAND_4[2047:0];
  _RAND_5 = {64{`RANDOM}};
  res = _RAND_5[2047:0];
  _RAND_6 = {1{`RANDOM}};
  dout_valid_reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  count = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  status = _RAND_8[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Powmod(
  input           clock,
  input           reset,
  output          din_ready, // @[src/main/scala/operator/Powmod.scala 20:18]
  input           din_valid, // @[src/main/scala/operator/Powmod.scala 20:18]
  input  [1023:0] din_bits_base, // @[src/main/scala/operator/Powmod.scala 20:18]
  input  [1023:0] din_bits_exp, // @[src/main/scala/operator/Powmod.scala 20:18]
  input  [2047:0] din_bits_mod, // @[src/main/scala/operator/Powmod.scala 20:18]
  input  [2047:0] din_bits_expkm, // @[src/main/scala/operator/Powmod.scala 20:18]
  input  [2047:0] din_bits_exp2km, // @[src/main/scala/operator/Powmod.scala 20:18]
  output          dout_valid, // @[src/main/scala/operator/Powmod.scala 21:18]
  output [2047:0] dout_bits_res // @[src/main/scala/operator/Powmod.scala 21:18]
);
`ifdef RANDOMIZE_REG_INIT
  reg [1023:0] _RAND_0;
  reg [2047:0] _RAND_1;
  reg [2047:0] _RAND_2;
  reg [2047:0] _RAND_3;
  reg [2047:0] _RAND_4;
  reg [2047:0] _RAND_5;
  reg [2047:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  mp_clock; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire  mp_reset; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire  mp_din_ready; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire  mp_din_valid; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire [2047:0] mp_din_bits_mult; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire [2047:0] mp_din_bits_multcand; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire [2047:0] mp_din_bits_mod; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire  mp_dout_valid; // @[src/main/scala/operator/Powmod.scala 53:20]
  wire [2047:0] mp_dout_bits_res; // @[src/main/scala/operator/Powmod.scala 53:20]
  reg [1023:0] x; // @[src/main/scala/operator/Powmod.scala 23:31]
  reg [2047:0] e; // @[src/main/scala/operator/Powmod.scala 24:31]
  reg [2047:0] ty; // @[src/main/scala/operator/Powmod.scala 25:31]
  reg [2047:0] res; // @[src/main/scala/operator/Powmod.scala 26:31]
  reg [2047:0] mp_mult; // @[src/main/scala/operator/Powmod.scala 28:36]
  reg [2047:0] mp_multcand; // @[src/main/scala/operator/Powmod.scala 29:36]
  reg [2047:0] mp_mod; // @[src/main/scala/operator/Powmod.scala 30:36]
  reg  mp_din_valid_reg; // @[src/main/scala/operator/Powmod.scala 31:36]
  reg  dout_valid_reg; // @[src/main/scala/operator/Powmod.scala 36:36]
  reg [11:0] count; // @[src/main/scala/operator/Powmod.scala 39:24]
  reg [3:0] status; // @[src/main/scala/operator/Powmod.scala 47:26]
  wire  _T_3 = din_ready & din_valid; // @[src/main/scala/operator/Powmod.scala 64:28]
  wire  _T_10 = mp_dout_valid; // @[src/main/scala/operator/Powmod.scala 85:32]
  wire [2047:0] _GEN_1 = _T_10 ? mp_dout_bits_res : ty; // @[src/main/scala/operator/Powmod.scala 86:13 87:24 25:31]
  wire [1:0] _GEN_2 = _T_10 ? 2'h3 : 2'h2; // @[src/main/scala/operator/Powmod.scala 86:13 88:24 92:34]
  wire  _GEN_3 = _T_10 & mp_din_valid_reg; // @[src/main/scala/operator/Powmod.scala 86:13 31:36 91:34]
  wire  _T_14 = count == 12'h800; // @[src/main/scala/operator/Powmod.scala 97:24]
  wire [1023:0] _T_15 = x >> count; // @[src/main/scala/operator/Powmod.scala 102:23]
  wire [2:0] _GEN_4 = _T_15[0] ? 3'h4 : 3'h6; // @[src/main/scala/operator/Powmod.scala 103:17 104:28 107:28]
  wire [3:0] _GEN_5 = _T_14 ? 4'h8 : {{1'd0}, _GEN_4}; // @[src/main/scala/operator/Powmod.scala 98:13 99:24]
  wire [2047:0] _GEN_6 = _T_10 ? mp_dout_bits_res : e; // @[src/main/scala/operator/Powmod.scala 121:13 122:24 24:31]
  wire [2:0] _GEN_7 = _T_10 ? 3'h6 : 3'h5; // @[src/main/scala/operator/Powmod.scala 121:13 123:24 127:34]
  wire [11:0] _count_T_1 = count + 12'h1; // @[src/main/scala/operator/Powmod.scala 142:33]
  wire [11:0] _GEN_10 = _T_10 ? _count_T_1 : count; // @[src/main/scala/operator/Powmod.scala 140:13 142:24 39:24]
  wire [2:0] _GEN_11 = _T_10 ? 3'h3 : 3'h7; // @[src/main/scala/operator/Powmod.scala 140:13 143:24 147:34]
  wire [2047:0] _GEN_13 = _T_10 ? mp_dout_bits_res : res; // @[src/main/scala/operator/Powmod.scala 160:13 161:32 26:31]
  wire  _GEN_14 = _T_10 | dout_valid_reg; // @[src/main/scala/operator/Powmod.scala 160:13 162:32 36:36]
  wire [3:0] _GEN_15 = _T_10 ? 4'h0 : 4'h9; // @[src/main/scala/operator/Powmod.scala 160:13 163:32 167:34]
  wire [2047:0] _GEN_17 = 4'h9 == status ? _GEN_13 : res; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_18 = 4'h9 == status ? _GEN_14 : dout_valid_reg; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire [3:0] _GEN_19 = 4'h9 == status ? _GEN_15 : status; // @[src/main/scala/operator/Powmod.scala 47:26 60:5]
  wire  _GEN_20 = 4'h9 == status ? _GEN_3 : mp_din_valid_reg; // @[src/main/scala/operator/Powmod.scala 31:36 60:5]
  wire [2047:0] _GEN_21 = 4'h8 == status ? e : mp_mult; // @[src/main/scala/operator/Powmod.scala 152:30 28:36 60:5]
  wire [2047:0] _GEN_22 = 4'h8 == status ? 2048'h1 : mp_multcand; // @[src/main/scala/operator/Powmod.scala 153:30 29:36 60:5]
  wire  _GEN_23 = 4'h8 == status | _GEN_20; // @[src/main/scala/operator/Powmod.scala 154:30 60:5]
  wire [3:0] _GEN_24 = 4'h8 == status ? 4'h9 : _GEN_19; // @[src/main/scala/operator/Powmod.scala 155:30 60:5]
  wire [2047:0] _GEN_25 = 4'h8 == status ? res : _GEN_17; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_26 = 4'h8 == status ? dout_valid_reg : _GEN_18; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire [2047:0] _GEN_27 = 4'h7 == status ? _GEN_1 : ty; // @[src/main/scala/operator/Powmod.scala 25:31 60:5]
  wire [11:0] _GEN_28 = 4'h7 == status ? _GEN_10 : count; // @[src/main/scala/operator/Powmod.scala 39:24 60:5]
  wire [3:0] _GEN_29 = 4'h7 == status ? {{1'd0}, _GEN_11} : _GEN_24; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire  _GEN_30 = 4'h7 == status ? _GEN_3 : _GEN_23; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire [2047:0] _GEN_31 = 4'h7 == status ? mp_mult : _GEN_21; // @[src/main/scala/operator/Powmod.scala 28:36 60:5]
  wire [2047:0] _GEN_32 = 4'h7 == status ? mp_multcand : _GEN_22; // @[src/main/scala/operator/Powmod.scala 29:36 60:5]
  wire [2047:0] _GEN_33 = 4'h7 == status ? res : _GEN_25; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_34 = 4'h7 == status ? dout_valid_reg : _GEN_26; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire [2047:0] _GEN_35 = 4'h6 == status ? ty : _GEN_31; // @[src/main/scala/operator/Powmod.scala 132:34 60:5]
  wire [2047:0] _GEN_36 = 4'h6 == status ? ty : _GEN_32; // @[src/main/scala/operator/Powmod.scala 133:34 60:5]
  wire  _GEN_37 = 4'h6 == status | _GEN_30; // @[src/main/scala/operator/Powmod.scala 134:34 60:5]
  wire [3:0] _GEN_38 = 4'h6 == status ? 4'h7 : _GEN_29; // @[src/main/scala/operator/Powmod.scala 135:34 60:5]
  wire [2047:0] _GEN_39 = 4'h6 == status ? ty : _GEN_27; // @[src/main/scala/operator/Powmod.scala 25:31 60:5]
  wire [11:0] _GEN_40 = 4'h6 == status ? count : _GEN_28; // @[src/main/scala/operator/Powmod.scala 39:24 60:5]
  wire [2047:0] _GEN_41 = 4'h6 == status ? res : _GEN_33; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_42 = 4'h6 == status ? dout_valid_reg : _GEN_34; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire [2047:0] _GEN_43 = 4'h5 == status ? _GEN_6 : e; // @[src/main/scala/operator/Powmod.scala 24:31 60:5]
  wire [3:0] _GEN_44 = 4'h5 == status ? {{1'd0}, _GEN_7} : _GEN_38; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire  _GEN_45 = 4'h5 == status ? _GEN_3 : _GEN_37; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire [2047:0] _GEN_46 = 4'h5 == status ? mp_mult : _GEN_35; // @[src/main/scala/operator/Powmod.scala 28:36 60:5]
  wire [2047:0] _GEN_47 = 4'h5 == status ? mp_multcand : _GEN_36; // @[src/main/scala/operator/Powmod.scala 29:36 60:5]
  wire [2047:0] _GEN_48 = 4'h5 == status ? ty : _GEN_39; // @[src/main/scala/operator/Powmod.scala 25:31 60:5]
  wire [11:0] _GEN_49 = 4'h5 == status ? count : _GEN_40; // @[src/main/scala/operator/Powmod.scala 39:24 60:5]
  wire [2047:0] _GEN_50 = 4'h5 == status ? res : _GEN_41; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_51 = 4'h5 == status ? dout_valid_reg : _GEN_42; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire  _GEN_52 = 4'h4 == status | _GEN_45; // @[src/main/scala/operator/Powmod.scala 113:30 60:5]
  wire [2047:0] _GEN_53 = 4'h4 == status ? e : _GEN_46; // @[src/main/scala/operator/Powmod.scala 114:30 60:5]
  wire [2047:0] _GEN_54 = 4'h4 == status ? ty : _GEN_47; // @[src/main/scala/operator/Powmod.scala 115:30 60:5]
  wire [3:0] _GEN_55 = 4'h4 == status ? 4'h5 : _GEN_44; // @[src/main/scala/operator/Powmod.scala 116:30 60:5]
  wire [2047:0] _GEN_56 = 4'h4 == status ? e : _GEN_43; // @[src/main/scala/operator/Powmod.scala 24:31 60:5]
  wire [2047:0] _GEN_57 = 4'h4 == status ? ty : _GEN_48; // @[src/main/scala/operator/Powmod.scala 25:31 60:5]
  wire [11:0] _GEN_58 = 4'h4 == status ? count : _GEN_49; // @[src/main/scala/operator/Powmod.scala 39:24 60:5]
  wire [2047:0] _GEN_59 = 4'h4 == status ? res : _GEN_50; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_60 = 4'h4 == status ? dout_valid_reg : _GEN_51; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire [3:0] _GEN_61 = 4'h3 == status ? _GEN_5 : _GEN_55; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire  _GEN_62 = 4'h3 == status ? mp_din_valid_reg : _GEN_52; // @[src/main/scala/operator/Powmod.scala 31:36 60:5]
  wire [2047:0] _GEN_63 = 4'h3 == status ? mp_mult : _GEN_53; // @[src/main/scala/operator/Powmod.scala 28:36 60:5]
  wire [2047:0] _GEN_64 = 4'h3 == status ? mp_multcand : _GEN_54; // @[src/main/scala/operator/Powmod.scala 29:36 60:5]
  wire [2047:0] _GEN_65 = 4'h3 == status ? e : _GEN_56; // @[src/main/scala/operator/Powmod.scala 24:31 60:5]
  wire [2047:0] _GEN_66 = 4'h3 == status ? ty : _GEN_57; // @[src/main/scala/operator/Powmod.scala 25:31 60:5]
  wire [11:0] _GEN_67 = 4'h3 == status ? count : _GEN_58; // @[src/main/scala/operator/Powmod.scala 39:24 60:5]
  wire [2047:0] _GEN_68 = 4'h3 == status ? res : _GEN_59; // @[src/main/scala/operator/Powmod.scala 26:31 60:5]
  wire  _GEN_69 = 4'h3 == status ? dout_valid_reg : _GEN_60; // @[src/main/scala/operator/Powmod.scala 36:36 60:5]
  wire  _GEN_72 = 4'h2 == status ? _GEN_3 : _GEN_62; // @[src/main/scala/operator/Powmod.scala 60:5]
  wire  _GEN_79 = 4'h1 == status | _GEN_72; // @[src/main/scala/operator/Powmod.scala 60:5 74:30]
  ModMul mp ( // @[src/main/scala/operator/Powmod.scala 53:20]
    .clock(mp_clock),
    .reset(mp_reset),
    .din_ready(mp_din_ready),
    .din_valid(mp_din_valid),
    .din_bits_mult(mp_din_bits_mult),
    .din_bits_multcand(mp_din_bits_multcand),
    .din_bits_mod(mp_din_bits_mod),
    .dout_valid(mp_dout_valid),
    .dout_bits_res(mp_dout_bits_res)
  );
  assign din_ready = 1'h1; // @[src/main/scala/operator/Powmod.scala 49:19]
  assign dout_valid = dout_valid_reg; // @[src/main/scala/operator/Powmod.scala 50:19]
  assign dout_bits_res = res; // @[src/main/scala/operator/Powmod.scala 51:19]
  assign mp_clock = clock;
  assign mp_reset = reset;
  assign mp_din_valid = mp_din_valid_reg; // @[src/main/scala/operator/Powmod.scala 54:26]
  assign mp_din_bits_mult = mp_mult; // @[src/main/scala/operator/Powmod.scala 55:26]
  assign mp_din_bits_multcand = mp_multcand; // @[src/main/scala/operator/Powmod.scala 56:26]
  assign mp_din_bits_mod = mp_mod; // @[src/main/scala/operator/Powmod.scala 57:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 23:31]
      x <= 1024'h0; // @[src/main/scala/operator/Powmod.scala 23:31]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        x <= din_bits_exp; // @[src/main/scala/operator/Powmod.scala 75:30]
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 24:31]
      e <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 24:31]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        e <= din_bits_expkm; // @[src/main/scala/operator/Powmod.scala 76:30]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        e <= _GEN_65;
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 25:31]
      ty <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 25:31]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (!(4'h1 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        if (4'h2 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
          ty <= _GEN_1;
        end else begin
          ty <= _GEN_66;
        end
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 26:31]
      res <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 26:31]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (!(4'h1 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
          res <= _GEN_68;
        end
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 28:36]
      mp_mult <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 28:36]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        mp_mult <= {{1024'd0}, din_bits_base}; // @[src/main/scala/operator/Powmod.scala 77:30]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        mp_mult <= _GEN_63;
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 29:36]
      mp_multcand <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 29:36]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        mp_multcand <= din_bits_exp2km; // @[src/main/scala/operator/Powmod.scala 78:30]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        mp_multcand <= _GEN_64;
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 30:36]
      mp_mod <= 2048'h0; // @[src/main/scala/operator/Powmod.scala 30:36]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        mp_mod <= din_bits_mod; // @[src/main/scala/operator/Powmod.scala 79:30]
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 31:36]
      mp_din_valid_reg <= 1'h0; // @[src/main/scala/operator/Powmod.scala 31:36]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      mp_din_valid_reg <= _GEN_79;
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 36:36]
      dout_valid_reg <= 1'h0; // @[src/main/scala/operator/Powmod.scala 36:36]
    end else if (4'h0 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      dout_valid_reg <= 1'h0; // @[src/main/scala/operator/Powmod.scala 63:28]
    end else if (!(4'h1 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        dout_valid_reg <= _GEN_69;
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 39:24]
      count <= 12'h0; // @[src/main/scala/operator/Powmod.scala 39:24]
    end else if (!(4'h0 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        count <= 12'h0; // @[src/main/scala/operator/Powmod.scala 80:30]
      end else if (!(4'h2 == status)) begin // @[src/main/scala/operator/Powmod.scala 60:5]
        count <= _GEN_67;
      end
    end
    if (reset) begin // @[src/main/scala/operator/Powmod.scala 47:26]
      status <= 4'h0; // @[src/main/scala/operator/Powmod.scala 47:26]
    end else if (4'h0 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      status <= {{3'd0}, _T_3};
    end else if (4'h1 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      status <= 4'h2; // @[src/main/scala/operator/Powmod.scala 81:30]
    end else if (4'h2 == status) begin // @[src/main/scala/operator/Powmod.scala 60:5]
      status <= {{2'd0}, _GEN_2};
    end else begin
      status <= _GEN_61;
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
  _RAND_0 = {32{`RANDOM}};
  x = _RAND_0[1023:0];
  _RAND_1 = {64{`RANDOM}};
  e = _RAND_1[2047:0];
  _RAND_2 = {64{`RANDOM}};
  ty = _RAND_2[2047:0];
  _RAND_3 = {64{`RANDOM}};
  res = _RAND_3[2047:0];
  _RAND_4 = {64{`RANDOM}};
  mp_mult = _RAND_4[2047:0];
  _RAND_5 = {64{`RANDOM}};
  mp_multcand = _RAND_5[2047:0];
  _RAND_6 = {64{`RANDOM}};
  mp_mod = _RAND_6[2047:0];
  _RAND_7 = {1{`RANDOM}};
  mp_din_valid_reg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  dout_valid_reg = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  count = _RAND_9[11:0];
  _RAND_10 = {1{`RANDOM}};
  status = _RAND_10[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
