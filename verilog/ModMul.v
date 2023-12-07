module ModMul_11_11(
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
