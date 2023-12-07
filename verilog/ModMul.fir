FIRRTL version 1.2.0
circuit ModMul :
  module ModMul :
    input clock : Clock
    input reset : UInt<1>
    input din : { flip ready : UInt<1>, valid : UInt<1>, bits : { mult : UInt<2048>, multcand : UInt<2048>, mod : UInt<2048>}} @[src/main/scala/operator/ModMul.scala 20:18]
    output dout : { valid : UInt<1>, bits : { res : UInt<2048>}} @[src/main/scala/operator/ModMul.scala 21:18]

    reg p : UInt<2050>, clock with :
      reset => (reset, UInt<2050>("h0")) @[src/main/scala/operator/ModMul.scala 23:22]
    reg a : UInt<2050>, clock with :
      reset => (reset, UInt<2050>("h0")) @[src/main/scala/operator/ModMul.scala 24:22]
    reg x : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/ModMul.scala 25:22]
    reg y : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/ModMul.scala 26:22]
    reg m : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/ModMul.scala 27:22]
    reg res : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/ModMul.scala 28:22]
    reg din_ready_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/ModMul.scala 30:33]
    reg dout_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/ModMul.scala 31:33]
    reg zero_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/ModMul.scala 32:33]
    reg count : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[src/main/scala/operator/ModMul.scala 34:28]
    reg count_max : UInt<12>, clock with :
      reset => (reset, UInt<12>("h800")) @[src/main/scala/operator/ModMul.scala 35:28]
    reg status : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/ModMul.scala 42:25]
    din.ready <= din_ready_reg @[src/main/scala/operator/ModMul.scala 44:19]
    dout.valid <= dout_valid_reg @[src/main/scala/operator/ModMul.scala 45:19]
    dout.bits.res <= res @[src/main/scala/operator/ModMul.scala 46:19]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/operator/ModMul.scala 49:5]
    node _T_1 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/operator/ModMul.scala 49:5]
    when _T_2 : @[src/main/scala/operator/ModMul.scala 49:5]
      dout_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/ModMul.scala 52:28]
      node _T_3 = and(din.ready, din.valid) @[src/main/scala/operator/ModMul.scala 53:28]
      when _T_3 : @[src/main/scala/operator/ModMul.scala 54:13]
        status <= UInt<1>("h1") @[src/main/scala/operator/ModMul.scala 55:24]
      else :
        status <= UInt<1>("h0") @[src/main/scala/operator/ModMul.scala 58:24]
    else :
      node _T_4 = asUInt(UInt<1>("h1")) @[src/main/scala/operator/ModMul.scala 49:5]
      node _T_5 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
      node _T_6 = eq(_T_4, _T_5) @[src/main/scala/operator/ModMul.scala 49:5]
      when _T_6 : @[src/main/scala/operator/ModMul.scala 49:5]
        x <= din.bits.mult @[src/main/scala/operator/ModMul.scala 63:24]
        y <= din.bits.multcand @[src/main/scala/operator/ModMul.scala 64:24]
        m <= din.bits.mod @[src/main/scala/operator/ModMul.scala 65:24]
        p <= zero_reg @[src/main/scala/operator/ModMul.scala 66:24]
        count <= zero_reg @[src/main/scala/operator/ModMul.scala 67:24]
        status <= UInt<2>("h2") @[src/main/scala/operator/ModMul.scala 68:24]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/operator/ModMul.scala 49:5]
        node _T_8 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/operator/ModMul.scala 49:5]
        when _T_9 : @[src/main/scala/operator/ModMul.scala 49:5]
          node _a_T = dshr(x, count) @[src/main/scala/operator/ModMul.scala 72:32]
          node _a_T_1 = bits(_a_T, 0, 0) @[src/main/scala/operator/ModMul.scala 72:32]
          node _a_T_2 = mux(_a_T_1, y, UInt<1>("h0")) @[src/main/scala/operator/ModMul.scala 72:30]
          node _a_T_3 = add(p, _a_T_2) @[src/main/scala/operator/ModMul.scala 72:25]
          node _a_T_4 = tail(_a_T_3, 1) @[src/main/scala/operator/ModMul.scala 72:25]
          a <= _a_T_4 @[src/main/scala/operator/ModMul.scala 72:20]
          status <= UInt<2>("h3") @[src/main/scala/operator/ModMul.scala 73:20]
        else :
          node _T_10 = asUInt(UInt<2>("h3")) @[src/main/scala/operator/ModMul.scala 49:5]
          node _T_11 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
          node _T_12 = eq(_T_10, _T_11) @[src/main/scala/operator/ModMul.scala 49:5]
          when _T_12 : @[src/main/scala/operator/ModMul.scala 49:5]
            node _p_T = bits(a, 0, 0) @[src/main/scala/operator/ModMul.scala 77:28]
            node _p_T_1 = add(a, m) @[src/main/scala/operator/ModMul.scala 77:36]
            node _p_T_2 = tail(_p_T_1, 1) @[src/main/scala/operator/ModMul.scala 77:36]
            node _p_T_3 = dshr(_p_T_2, UInt<1>("h1")) @[src/main/scala/operator/ModMul.scala 77:41]
            node _p_T_4 = dshr(a, UInt<1>("h1")) @[src/main/scala/operator/ModMul.scala 77:51]
            node _p_T_5 = mux(_p_T, _p_T_3, _p_T_4) @[src/main/scala/operator/ModMul.scala 77:26]
            p <= _p_T_5 @[src/main/scala/operator/ModMul.scala 77:20]
            node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/operator/ModMul.scala 78:29]
            node _count_T_1 = tail(_count_T, 1) @[src/main/scala/operator/ModMul.scala 78:29]
            count <= _count_T_1 @[src/main/scala/operator/ModMul.scala 78:20]
            status <= UInt<3>("h4") @[src/main/scala/operator/ModMul.scala 79:20]
          else :
            node _T_13 = asUInt(UInt<3>("h4")) @[src/main/scala/operator/ModMul.scala 49:5]
            node _T_14 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
            node _T_15 = eq(_T_13, _T_14) @[src/main/scala/operator/ModMul.scala 49:5]
            when _T_15 : @[src/main/scala/operator/ModMul.scala 49:5]
              node _T_16 = eq(count, count_max) @[src/main/scala/operator/ModMul.scala 83:24]
              when _T_16 : @[src/main/scala/operator/ModMul.scala 84:13]
                node _res_T = gt(p, m) @[src/main/scala/operator/ModMul.scala 85:33]
                node _res_T_1 = sub(p, m) @[src/main/scala/operator/ModMul.scala 85:40]
                node _res_T_2 = tail(_res_T_1, 1) @[src/main/scala/operator/ModMul.scala 85:40]
                node _res_T_3 = mux(_res_T, _res_T_2, p) @[src/main/scala/operator/ModMul.scala 85:30]
                res <= _res_T_3 @[src/main/scala/operator/ModMul.scala 85:24]
                status <= UInt<3>("h5") @[src/main/scala/operator/ModMul.scala 86:24]
              else :
                status <= UInt<2>("h2") @[src/main/scala/operator/ModMul.scala 89:24]
            else :
              node _T_17 = asUInt(UInt<3>("h5")) @[src/main/scala/operator/ModMul.scala 49:5]
              node _T_18 = asUInt(status) @[src/main/scala/operator/ModMul.scala 49:5]
              node _T_19 = eq(_T_17, _T_18) @[src/main/scala/operator/ModMul.scala 49:5]
              when _T_19 : @[src/main/scala/operator/ModMul.scala 49:5]
                dout_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/ModMul.scala 94:28]
                status <= UInt<1>("h0") @[src/main/scala/operator/ModMul.scala 95:20]


