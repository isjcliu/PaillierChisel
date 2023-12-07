FIRRTL version 1.2.0
circuit PaillierEnc :
  module ModMul :
    input clock : Clock
    input reset : Reset
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


  module Powmod :
    input clock : Clock
    input reset : Reset
    input din : { flip ready : UInt<1>, valid : UInt<1>, bits : { base : UInt<1024>, exp : UInt<256>, mod : UInt<2048>, expkm : UInt<2048>, exp2km : UInt<2048>}} @[src/main/scala/operator/Powmod.scala 20:18]
    output dout : { valid : UInt<1>, bits : { res : UInt<2048>}} @[src/main/scala/operator/Powmod.scala 21:18]

    reg x : UInt<256>, clock with :
      reset => (reset, UInt<256>("h0")) @[src/main/scala/operator/Powmod.scala 23:31]
    reg e : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 24:31]
    reg ty : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 25:31]
    reg res : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 26:31]
    reg mp_mult : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 28:36]
    reg mp_multcand : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 29:36]
    reg mp_mod : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 30:36]
    reg mp_din_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 31:36]
    reg zero_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 33:36]
    reg one_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 34:36]
    reg din_ready_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 35:36]
    reg dout_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 36:36]
    reg count : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[src/main/scala/operator/Powmod.scala 39:24]
    reg count_max : UInt<12>, clock with :
      reset => (reset, UInt<12>("h800")) @[src/main/scala/operator/Powmod.scala 40:28]
    reg status : UInt<4>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 47:26]
    din.ready <= din_ready_reg @[src/main/scala/operator/Powmod.scala 49:19]
    dout.valid <= dout_valid_reg @[src/main/scala/operator/Powmod.scala 50:19]
    dout.bits.res <= res @[src/main/scala/operator/Powmod.scala 51:19]
    inst mp of ModMul @[src/main/scala/operator/Powmod.scala 53:20]
    mp.clock <= clock
    mp.reset <= reset
    mp.din.valid <= mp_din_valid_reg @[src/main/scala/operator/Powmod.scala 54:26]
    mp.din.bits.mult <= mp_mult @[src/main/scala/operator/Powmod.scala 55:26]
    mp.din.bits.multcand <= mp_multcand @[src/main/scala/operator/Powmod.scala 56:26]
    mp.din.bits.mod <= mp_mod @[src/main/scala/operator/Powmod.scala 57:26]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 60:5]
    node _T_1 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/operator/Powmod.scala 60:5]
    when _T_2 : @[src/main/scala/operator/Powmod.scala 60:5]
      dout_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 63:28]
      node _T_3 = and(din.ready, din.valid) @[src/main/scala/operator/Powmod.scala 64:28]
      when _T_3 : @[src/main/scala/operator/Powmod.scala 65:13]
        status <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 66:24]
      else :
        status <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 69:24]
    else :
      node _T_4 = asUInt(UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 60:5]
      node _T_5 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
      node _T_6 = eq(_T_4, _T_5) @[src/main/scala/operator/Powmod.scala 60:5]
      when _T_6 : @[src/main/scala/operator/Powmod.scala 60:5]
        mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 74:30]
        x <= din.bits.exp @[src/main/scala/operator/Powmod.scala 75:30]
        e <= din.bits.expkm @[src/main/scala/operator/Powmod.scala 76:30]
        mp_mult <= din.bits.base @[src/main/scala/operator/Powmod.scala 77:30]
        mp_multcand <= din.bits.exp2km @[src/main/scala/operator/Powmod.scala 78:30]
        mp_mod <= din.bits.mod @[src/main/scala/operator/Powmod.scala 79:30]
        count <= zero_reg @[src/main/scala/operator/Powmod.scala 80:30]
        status <= UInt<2>("h2") @[src/main/scala/operator/Powmod.scala 81:30]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/operator/Powmod.scala 60:5]
        node _T_8 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/operator/Powmod.scala 60:5]
        when _T_9 : @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_10 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 85:32]
          when _T_10 : @[src/main/scala/operator/Powmod.scala 86:13]
            ty <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 87:24]
            status <= UInt<2>("h3") @[src/main/scala/operator/Powmod.scala 88:24]
          else :
            mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 91:34]
            status <= UInt<2>("h2") @[src/main/scala/operator/Powmod.scala 92:34]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_12 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/operator/Powmod.scala 60:5]
          when _T_13 : @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_14 = eq(count, count_max) @[src/main/scala/operator/Powmod.scala 97:24]
            when _T_14 : @[src/main/scala/operator/Powmod.scala 98:13]
              status <= UInt<4>("h8") @[src/main/scala/operator/Powmod.scala 99:24]
            else :
              node _T_15 = dshr(x, count) @[src/main/scala/operator/Powmod.scala 102:23]
              node _T_16 = bits(_T_15, 0, 0) @[src/main/scala/operator/Powmod.scala 102:23]
              node _T_17 = eq(_T_16, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 102:31]
              when _T_17 : @[src/main/scala/operator/Powmod.scala 103:17]
                status <= UInt<3>("h4") @[src/main/scala/operator/Powmod.scala 104:28]
              else :
                status <= UInt<3>("h6") @[src/main/scala/operator/Powmod.scala 107:28]
          else :
            node _T_18 = asUInt(UInt<3>("h4")) @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_19 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_20 = eq(_T_18, _T_19) @[src/main/scala/operator/Powmod.scala 60:5]
            when _T_20 : @[src/main/scala/operator/Powmod.scala 60:5]
              mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 113:30]
              mp_mult <= e @[src/main/scala/operator/Powmod.scala 114:30]
              mp_multcand <= ty @[src/main/scala/operator/Powmod.scala 115:30]
              status <= UInt<3>("h5") @[src/main/scala/operator/Powmod.scala 116:30]
            else :
              node _T_21 = asUInt(UInt<3>("h5")) @[src/main/scala/operator/Powmod.scala 60:5]
              node _T_22 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
              node _T_23 = eq(_T_21, _T_22) @[src/main/scala/operator/Powmod.scala 60:5]
              when _T_23 : @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_24 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 120:32]
                when _T_24 : @[src/main/scala/operator/Powmod.scala 121:13]
                  e <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 122:24]
                  status <= UInt<3>("h6") @[src/main/scala/operator/Powmod.scala 123:24]
                else :
                  mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 126:34]
                  status <= UInt<3>("h5") @[src/main/scala/operator/Powmod.scala 127:34]
              else :
                node _T_25 = asUInt(UInt<3>("h6")) @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_26 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_27 = eq(_T_25, _T_26) @[src/main/scala/operator/Powmod.scala 60:5]
                when _T_27 : @[src/main/scala/operator/Powmod.scala 60:5]
                  mp_mult <= ty @[src/main/scala/operator/Powmod.scala 132:34]
                  mp_multcand <= ty @[src/main/scala/operator/Powmod.scala 133:34]
                  mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 134:34]
                  status <= UInt<3>("h7") @[src/main/scala/operator/Powmod.scala 135:34]
                else :
                  node _T_28 = asUInt(UInt<3>("h7")) @[src/main/scala/operator/Powmod.scala 60:5]
                  node _T_29 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                  node _T_30 = eq(_T_28, _T_29) @[src/main/scala/operator/Powmod.scala 60:5]
                  when _T_30 : @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_31 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 139:32]
                    when _T_31 : @[src/main/scala/operator/Powmod.scala 140:13]
                      ty <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 141:24]
                      node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 142:33]
                      node _count_T_1 = tail(_count_T, 1) @[src/main/scala/operator/Powmod.scala 142:33]
                      count <= _count_T_1 @[src/main/scala/operator/Powmod.scala 142:24]
                      status <= UInt<2>("h3") @[src/main/scala/operator/Powmod.scala 143:24]
                    else :
                      mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 146:34]
                      status <= UInt<3>("h7") @[src/main/scala/operator/Powmod.scala 147:34]
                  else :
                    node _T_32 = asUInt(UInt<4>("h8")) @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_33 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_34 = eq(_T_32, _T_33) @[src/main/scala/operator/Powmod.scala 60:5]
                    when _T_34 : @[src/main/scala/operator/Powmod.scala 60:5]
                      mp_mult <= e @[src/main/scala/operator/Powmod.scala 152:30]
                      mp_multcand <= one_reg @[src/main/scala/operator/Powmod.scala 153:30]
                      mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 154:30]
                      status <= UInt<4>("h9") @[src/main/scala/operator/Powmod.scala 155:30]
                    else :
                      node _T_35 = asUInt(UInt<4>("h9")) @[src/main/scala/operator/Powmod.scala 60:5]
                      node _T_36 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                      node _T_37 = eq(_T_35, _T_36) @[src/main/scala/operator/Powmod.scala 60:5]
                      when _T_37 : @[src/main/scala/operator/Powmod.scala 60:5]
                        node _T_38 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 159:32]
                        when _T_38 : @[src/main/scala/operator/Powmod.scala 160:13]
                          res <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 161:32]
                          dout_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 162:32]
                          status <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 163:32]
                        else :
                          mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 166:34]
                          status <= UInt<4>("h9") @[src/main/scala/operator/Powmod.scala 167:34]


  module ModMul_1 :
    input clock : Clock
    input reset : Reset
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


  module Powmod_1 :
    input clock : Clock
    input reset : Reset
    input din : { flip ready : UInt<1>, valid : UInt<1>, bits : { base : UInt<1024>, exp : UInt<1024>, mod : UInt<2048>, expkm : UInt<2048>, exp2km : UInt<2048>}} @[src/main/scala/operator/Powmod.scala 20:18]
    output dout : { valid : UInt<1>, bits : { res : UInt<2048>}} @[src/main/scala/operator/Powmod.scala 21:18]

    reg x : UInt<1024>, clock with :
      reset => (reset, UInt<1024>("h0")) @[src/main/scala/operator/Powmod.scala 23:31]
    reg e : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 24:31]
    reg ty : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 25:31]
    reg res : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 26:31]
    reg mp_mult : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 28:36]
    reg mp_multcand : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 29:36]
    reg mp_mod : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Powmod.scala 30:36]
    reg mp_din_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 31:36]
    reg zero_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 33:36]
    reg one_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 34:36]
    reg din_ready_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 35:36]
    reg dout_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 36:36]
    reg count : UInt<12>, clock with :
      reset => (reset, UInt<12>("h0")) @[src/main/scala/operator/Powmod.scala 39:24]
    reg count_max : UInt<12>, clock with :
      reset => (reset, UInt<12>("h800")) @[src/main/scala/operator/Powmod.scala 40:28]
    reg status : UInt<4>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 47:26]
    din.ready <= din_ready_reg @[src/main/scala/operator/Powmod.scala 49:19]
    dout.valid <= dout_valid_reg @[src/main/scala/operator/Powmod.scala 50:19]
    dout.bits.res <= res @[src/main/scala/operator/Powmod.scala 51:19]
    inst mp of ModMul_1 @[src/main/scala/operator/Powmod.scala 53:20]
    mp.clock <= clock
    mp.reset <= reset
    mp.din.valid <= mp_din_valid_reg @[src/main/scala/operator/Powmod.scala 54:26]
    mp.din.bits.mult <= mp_mult @[src/main/scala/operator/Powmod.scala 55:26]
    mp.din.bits.multcand <= mp_multcand @[src/main/scala/operator/Powmod.scala 56:26]
    mp.din.bits.mod <= mp_mod @[src/main/scala/operator/Powmod.scala 57:26]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/operator/Powmod.scala 60:5]
    node _T_1 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/operator/Powmod.scala 60:5]
    when _T_2 : @[src/main/scala/operator/Powmod.scala 60:5]
      dout_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 63:28]
      node _T_3 = and(din.ready, din.valid) @[src/main/scala/operator/Powmod.scala 64:28]
      when _T_3 : @[src/main/scala/operator/Powmod.scala 65:13]
        status <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 66:24]
      else :
        status <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 69:24]
    else :
      node _T_4 = asUInt(UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 60:5]
      node _T_5 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
      node _T_6 = eq(_T_4, _T_5) @[src/main/scala/operator/Powmod.scala 60:5]
      when _T_6 : @[src/main/scala/operator/Powmod.scala 60:5]
        mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 74:30]
        x <= din.bits.exp @[src/main/scala/operator/Powmod.scala 75:30]
        e <= din.bits.expkm @[src/main/scala/operator/Powmod.scala 76:30]
        mp_mult <= din.bits.base @[src/main/scala/operator/Powmod.scala 77:30]
        mp_multcand <= din.bits.exp2km @[src/main/scala/operator/Powmod.scala 78:30]
        mp_mod <= din.bits.mod @[src/main/scala/operator/Powmod.scala 79:30]
        count <= zero_reg @[src/main/scala/operator/Powmod.scala 80:30]
        status <= UInt<2>("h2") @[src/main/scala/operator/Powmod.scala 81:30]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/operator/Powmod.scala 60:5]
        node _T_8 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/operator/Powmod.scala 60:5]
        when _T_9 : @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_10 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 85:32]
          when _T_10 : @[src/main/scala/operator/Powmod.scala 86:13]
            ty <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 87:24]
            status <= UInt<2>("h3") @[src/main/scala/operator/Powmod.scala 88:24]
          else :
            mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 91:34]
            status <= UInt<2>("h2") @[src/main/scala/operator/Powmod.scala 92:34]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_12 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/operator/Powmod.scala 60:5]
          when _T_13 : @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_14 = eq(count, count_max) @[src/main/scala/operator/Powmod.scala 97:24]
            when _T_14 : @[src/main/scala/operator/Powmod.scala 98:13]
              status <= UInt<4>("h8") @[src/main/scala/operator/Powmod.scala 99:24]
            else :
              node _T_15 = dshr(x, count) @[src/main/scala/operator/Powmod.scala 102:23]
              node _T_16 = bits(_T_15, 0, 0) @[src/main/scala/operator/Powmod.scala 102:23]
              node _T_17 = eq(_T_16, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 102:31]
              when _T_17 : @[src/main/scala/operator/Powmod.scala 103:17]
                status <= UInt<3>("h4") @[src/main/scala/operator/Powmod.scala 104:28]
              else :
                status <= UInt<3>("h6") @[src/main/scala/operator/Powmod.scala 107:28]
          else :
            node _T_18 = asUInt(UInt<3>("h4")) @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_19 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
            node _T_20 = eq(_T_18, _T_19) @[src/main/scala/operator/Powmod.scala 60:5]
            when _T_20 : @[src/main/scala/operator/Powmod.scala 60:5]
              mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 113:30]
              mp_mult <= e @[src/main/scala/operator/Powmod.scala 114:30]
              mp_multcand <= ty @[src/main/scala/operator/Powmod.scala 115:30]
              status <= UInt<3>("h5") @[src/main/scala/operator/Powmod.scala 116:30]
            else :
              node _T_21 = asUInt(UInt<3>("h5")) @[src/main/scala/operator/Powmod.scala 60:5]
              node _T_22 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
              node _T_23 = eq(_T_21, _T_22) @[src/main/scala/operator/Powmod.scala 60:5]
              when _T_23 : @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_24 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 120:32]
                when _T_24 : @[src/main/scala/operator/Powmod.scala 121:13]
                  e <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 122:24]
                  status <= UInt<3>("h6") @[src/main/scala/operator/Powmod.scala 123:24]
                else :
                  mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 126:34]
                  status <= UInt<3>("h5") @[src/main/scala/operator/Powmod.scala 127:34]
              else :
                node _T_25 = asUInt(UInt<3>("h6")) @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_26 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                node _T_27 = eq(_T_25, _T_26) @[src/main/scala/operator/Powmod.scala 60:5]
                when _T_27 : @[src/main/scala/operator/Powmod.scala 60:5]
                  mp_mult <= ty @[src/main/scala/operator/Powmod.scala 132:34]
                  mp_multcand <= ty @[src/main/scala/operator/Powmod.scala 133:34]
                  mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 134:34]
                  status <= UInt<3>("h7") @[src/main/scala/operator/Powmod.scala 135:34]
                else :
                  node _T_28 = asUInt(UInt<3>("h7")) @[src/main/scala/operator/Powmod.scala 60:5]
                  node _T_29 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                  node _T_30 = eq(_T_28, _T_29) @[src/main/scala/operator/Powmod.scala 60:5]
                  when _T_30 : @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_31 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 139:32]
                    when _T_31 : @[src/main/scala/operator/Powmod.scala 140:13]
                      ty <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 141:24]
                      node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 142:33]
                      node _count_T_1 = tail(_count_T, 1) @[src/main/scala/operator/Powmod.scala 142:33]
                      count <= _count_T_1 @[src/main/scala/operator/Powmod.scala 142:24]
                      status <= UInt<2>("h3") @[src/main/scala/operator/Powmod.scala 143:24]
                    else :
                      mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 146:34]
                      status <= UInt<3>("h7") @[src/main/scala/operator/Powmod.scala 147:34]
                  else :
                    node _T_32 = asUInt(UInt<4>("h8")) @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_33 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                    node _T_34 = eq(_T_32, _T_33) @[src/main/scala/operator/Powmod.scala 60:5]
                    when _T_34 : @[src/main/scala/operator/Powmod.scala 60:5]
                      mp_mult <= e @[src/main/scala/operator/Powmod.scala 152:30]
                      mp_multcand <= one_reg @[src/main/scala/operator/Powmod.scala 153:30]
                      mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 154:30]
                      status <= UInt<4>("h9") @[src/main/scala/operator/Powmod.scala 155:30]
                    else :
                      node _T_35 = asUInt(UInt<4>("h9")) @[src/main/scala/operator/Powmod.scala 60:5]
                      node _T_36 = asUInt(status) @[src/main/scala/operator/Powmod.scala 60:5]
                      node _T_37 = eq(_T_35, _T_36) @[src/main/scala/operator/Powmod.scala 60:5]
                      when _T_37 : @[src/main/scala/operator/Powmod.scala 60:5]
                        node _T_38 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Powmod.scala 159:32]
                        when _T_38 : @[src/main/scala/operator/Powmod.scala 160:13]
                          res <= mp.dout.bits.res @[src/main/scala/operator/Powmod.scala 161:32]
                          dout_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Powmod.scala 162:32]
                          status <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 163:32]
                        else :
                          mp_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Powmod.scala 166:34]
                          status <= UInt<4>("h9") @[src/main/scala/operator/Powmod.scala 167:34]


  module ModMul_2 :
    input clock : Clock
    input reset : Reset
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


  module PaillierEnc :
    input clock : Clock
    input reset : UInt<1>
    input din : { flip ready : UInt<1>, valid : UInt<1>, bits : { g : UInt<1024>, m : UInt<256>, r : UInt<1024>, n : UInt<1024>, mod : UInt<2048>, param : { expkm : UInt<2048>, exp2km : UInt<2048>}}} @[src/main/scala/operator/Encrypt.scala 25:17]
    output dout : { valid : UInt<1>, bits : { res : UInt<2048>}} @[src/main/scala/operator/Encrypt.scala 26:18]

    reg g : UInt<1024>, clock with :
      reset => (reset, UInt<1024>("h0")) @[src/main/scala/operator/Encrypt.scala 28:26]
    reg m : UInt<256>, clock with :
      reset => (reset, UInt<256>("h0")) @[src/main/scala/operator/Encrypt.scala 29:26]
    reg r : UInt<1024>, clock with :
      reset => (reset, UInt<1024>("h0")) @[src/main/scala/operator/Encrypt.scala 30:26]
    reg n : UInt<1024>, clock with :
      reset => (reset, UInt<1024>("h0")) @[src/main/scala/operator/Encrypt.scala 31:26]
    reg mod : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 32:26]
    reg expkm : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 33:26]
    reg exp2km : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 34:26]
    reg res : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 35:26]
    reg pm1_din_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 37:36]
    inst pm1 of Powmod @[src/main/scala/operator/Encrypt.scala 38:21]
    pm1.clock <= clock
    pm1.reset <= reset
    pm1.din.valid <= pm1_din_valid_reg @[src/main/scala/operator/Encrypt.scala 39:25]
    pm1.din.bits.base <= g @[src/main/scala/operator/Encrypt.scala 40:25]
    pm1.din.bits.exp <= m @[src/main/scala/operator/Encrypt.scala 41:25]
    pm1.din.bits.mod <= mod @[src/main/scala/operator/Encrypt.scala 42:25]
    pm1.din.bits.expkm <= expkm @[src/main/scala/operator/Encrypt.scala 43:25]
    pm1.din.bits.exp2km <= exp2km @[src/main/scala/operator/Encrypt.scala 44:25]
    reg pm2_din_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 46:36]
    inst pm2 of Powmod_1 @[src/main/scala/operator/Encrypt.scala 47:21]
    pm2.clock <= clock
    pm2.reset <= reset
    pm2.din.valid <= pm2_din_valid_reg @[src/main/scala/operator/Encrypt.scala 48:25]
    pm2.din.bits.base <= r @[src/main/scala/operator/Encrypt.scala 49:25]
    pm2.din.bits.exp <= n @[src/main/scala/operator/Encrypt.scala 50:25]
    pm2.din.bits.mod <= mod @[src/main/scala/operator/Encrypt.scala 51:25]
    pm2.din.bits.expkm <= expkm @[src/main/scala/operator/Encrypt.scala 52:25]
    pm2.din.bits.exp2km <= exp2km @[src/main/scala/operator/Encrypt.scala 53:25]
    reg mp_din_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 55:35]
    reg mp_mult : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 56:35]
    reg mp_multcand : UInt<2048>, clock with :
      reset => (reset, UInt<2048>("h0")) @[src/main/scala/operator/Encrypt.scala 57:35]
    inst mp of ModMul_2 @[src/main/scala/operator/Encrypt.scala 58:20]
    mp.clock <= clock
    mp.reset <= reset
    mp.din.valid <= mp_din_valid_reg @[src/main/scala/operator/Encrypt.scala 59:26]
    mp.din.bits.mult <= mp_mult @[src/main/scala/operator/Encrypt.scala 60:26]
    mp.din.bits.multcand <= mp_multcand @[src/main/scala/operator/Encrypt.scala 61:26]
    mp.din.bits.mod <= mod @[src/main/scala/operator/Encrypt.scala 62:26]
    reg running : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 64:33]
    reg mp_valid_1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 65:33]
    reg mp_valid_2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 66:33]
    reg convert : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 67:33]
    reg din_ready_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/operator/Encrypt.scala 68:33]
    reg dout_valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/operator/Encrypt.scala 69:33]
    din.ready <= din_ready_reg @[src/main/scala/operator/Encrypt.scala 70:19]
    dout.valid <= dout_valid_reg @[src/main/scala/operator/Encrypt.scala 71:19]
    dout.bits.res <= res @[src/main/scala/operator/Encrypt.scala 72:19]
    node _T = and(din.ready, din.valid) @[src/main/scala/operator/Encrypt.scala 74:20]
    when _T : @[src/main/scala/operator/Encrypt.scala 75:5]
      running <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 76:17]
    else :
      running <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 79:17]
    when running : @[src/main/scala/operator/Encrypt.scala 83:5]
      pm1_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 84:27]
      pm2_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 85:27]
      g <= din.bits.g @[src/main/scala/operator/Encrypt.scala 86:27]
      m <= din.bits.m @[src/main/scala/operator/Encrypt.scala 87:27]
      r <= din.bits.r @[src/main/scala/operator/Encrypt.scala 88:27]
      n <= din.bits.n @[src/main/scala/operator/Encrypt.scala 89:27]
      mod <= din.bits.mod @[src/main/scala/operator/Encrypt.scala 90:27]
      expkm <= din.bits.param.expkm @[src/main/scala/operator/Encrypt.scala 91:27]
      exp2km <= din.bits.param.exp2km @[src/main/scala/operator/Encrypt.scala 92:27]
    else :
      pm1_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 95:27]
      pm2_din_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 96:27]
      dout_valid_reg <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 97:27]
    node _T_1 = eq(pm1.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Encrypt.scala 100:25]
    when _T_1 : @[src/main/scala/operator/Encrypt.scala 101:5]
      mp_mult <= pm1.dout.bits.res @[src/main/scala/operator/Encrypt.scala 102:20]
      mp_valid_1 <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 103:20]
    node _T_2 = eq(pm2.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Encrypt.scala 105:25]
    when _T_2 : @[src/main/scala/operator/Encrypt.scala 106:5]
      mp_multcand <= pm2.dout.bits.res @[src/main/scala/operator/Encrypt.scala 107:21]
      mp_valid_2 <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 108:21]
    node _T_3 = and(mp_valid_1, mp_valid_2) @[src/main/scala/operator/Encrypt.scala 111:21]
    when _T_3 : @[src/main/scala/operator/Encrypt.scala 112:5]
      mp_valid_1 <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 113:26]
      mp_valid_2 <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 114:26]
      mp_din_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 115:26]
    node _T_4 = eq(mp.dout.valid, UInt<1>("h1")) @[src/main/scala/operator/Encrypt.scala 117:24]
    when _T_4 : @[src/main/scala/operator/Encrypt.scala 118:5]
      dout_valid_reg <= UInt<1>("h1") @[src/main/scala/operator/Encrypt.scala 119:24]
      res <= mp.dout.bits.res @[src/main/scala/operator/Encrypt.scala 120:24]
      running <= UInt<1>("h0") @[src/main/scala/operator/Encrypt.scala 121:24]


