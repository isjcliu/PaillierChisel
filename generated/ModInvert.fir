FIRRTL version 1.2.0
circuit ModInvert :
  module ModInvert :
    input clock : Clock
    input reset : UInt<1>
    input din : { flip ready : UInt<1>, valid : UInt<1>, bits : { base : UInt<8>, mod : UInt<8>}} @[src/main/scala/operator/ModInvert.scala 15:17]
    output dout : { flip ready : UInt<1>, valid : UInt<1>, bits : { res : UInt<8>}} @[src/main/scala/operator/ModInvert.scala 16:18]

    reg base : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/operator/ModInvert.scala 18:23]
    reg mod : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/operator/ModInvert.scala 19:22]
    reg res : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/operator/ModInvert.scala 20:22]
    reg u : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/operator/ModInvert.scala 21:20]
    reg v : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/operator/ModInvert.scala 22:20]
    reg status : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/operator/ModInvert.scala 26:25]
    din.ready <= UInt<1>("h1") @[src/main/scala/operator/ModInvert.scala 28:15]
    dout.bits.res is invalid @[src/main/scala/operator/ModInvert.scala 29:19]
    dout.valid <= UInt<1>("h0") @[src/main/scala/operator/ModInvert.scala 30:16]
    node _T = eq(UInt<4>("h0"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
    when _T : @[src/main/scala/operator/ModInvert.scala 32:19]
      node _T_1 = and(din.ready, din.valid) @[src/main/scala/operator/ModInvert.scala 34:28]
      when _T_1 : @[src/main/scala/operator/ModInvert.scala 34:41]
        status <= UInt<4>("h1") @[src/main/scala/operator/ModInvert.scala 35:24]
      else :
        status <= UInt<4>("h0") @[src/main/scala/operator/ModInvert.scala 37:24]
    else :
      node _T_2 = eq(UInt<4>("h1"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
      when _T_2 : @[src/main/scala/operator/ModInvert.scala 32:19]
        base <= din.bits.base @[src/main/scala/operator/ModInvert.scala 41:18]
        mod <= din.bits.mod @[src/main/scala/operator/ModInvert.scala 42:17]
        u <= UInt<1>("h1") @[src/main/scala/operator/ModInvert.scala 43:15]
        v <= UInt<1>("h0") @[src/main/scala/operator/ModInvert.scala 44:15]
        status <= UInt<4>("h2") @[src/main/scala/operator/ModInvert.scala 45:20]
      else :
        node _T_3 = eq(UInt<4>("h2"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
        when _T_3 : @[src/main/scala/operator/ModInvert.scala 32:19]
          node _T_4 = neq(base, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 48:23]
          node _T_5 = bits(base, 0, 0) @[src/main/scala/operator/ModInvert.scala 48:38]
          node _T_6 = eq(_T_5, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 48:42]
          node _T_7 = and(_T_4, _T_6) @[src/main/scala/operator/ModInvert.scala 48:31]
          when _T_7 : @[src/main/scala/operator/ModInvert.scala 48:50]
            node _base_T = dshr(base, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 49:30]
            base <= _base_T @[src/main/scala/operator/ModInvert.scala 49:22]
            status <= UInt<4>("h3") @[src/main/scala/operator/ModInvert.scala 50:24]
          else :
            node _T_8 = neq(base, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 51:29]
            node _T_9 = bits(base, 0, 0) @[src/main/scala/operator/ModInvert.scala 51:44]
            node _T_10 = eq(_T_9, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 51:48]
            node _T_11 = and(_T_8, _T_10) @[src/main/scala/operator/ModInvert.scala 51:37]
            when _T_11 : @[src/main/scala/operator/ModInvert.scala 51:56]
              status <= UInt<4>("h4") @[src/main/scala/operator/ModInvert.scala 52:24]
            else :
              res <= v @[src/main/scala/operator/ModInvert.scala 54:21]
              dout.valid <= UInt<1>("h1") @[src/main/scala/operator/ModInvert.scala 55:28]
              status <= UInt<4>("h0") @[src/main/scala/operator/ModInvert.scala 56:24]
        else :
          node _T_12 = eq(UInt<4>("h3"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
          when _T_12 : @[src/main/scala/operator/ModInvert.scala 32:19]
            node _T_13 = bits(u, 0, 0) @[src/main/scala/operator/ModInvert.scala 60:19]
            node _T_14 = eq(_T_13, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 60:23]
            when _T_14 : @[src/main/scala/operator/ModInvert.scala 60:31]
              node _u_T = dshr(u, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 61:24]
              u <= _u_T @[src/main/scala/operator/ModInvert.scala 61:19]
              status <= UInt<4>("h4") @[src/main/scala/operator/ModInvert.scala 62:24]
            else :
              node _u_T_1 = add(u, mod) @[src/main/scala/operator/ModInvert.scala 64:25]
              node _u_T_2 = tail(_u_T_1, 1) @[src/main/scala/operator/ModInvert.scala 64:25]
              node _u_T_3 = dshr(_u_T_2, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 64:32]
              u <= _u_T_3 @[src/main/scala/operator/ModInvert.scala 64:19]
              status <= UInt<4>("h4") @[src/main/scala/operator/ModInvert.scala 65:24]
          else :
            node _T_15 = eq(UInt<4>("h4"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
            when _T_15 : @[src/main/scala/operator/ModInvert.scala 32:19]
              node _T_16 = bits(mod, 0, 0) @[src/main/scala/operator/ModInvert.scala 69:21]
              node _T_17 = eq(_T_16, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 69:25]
              when _T_17 : @[src/main/scala/operator/ModInvert.scala 69:33]
                node _mod_T = dshr(mod, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 70:28]
                mod <= _mod_T @[src/main/scala/operator/ModInvert.scala 70:21]
                status <= UInt<4>("h5") @[src/main/scala/operator/ModInvert.scala 71:24]
              else :
                status <= UInt<4>("h6") @[src/main/scala/operator/ModInvert.scala 73:24]
            else :
              node _T_18 = eq(UInt<4>("h5"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
              when _T_18 : @[src/main/scala/operator/ModInvert.scala 32:19]
                node _T_19 = eq(v, UInt<1>("h0")) @[src/main/scala/operator/ModInvert.scala 77:20]
                when _T_19 : @[src/main/scala/operator/ModInvert.scala 77:28]
                  node _v_T = dshr(v, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 78:24]
                  v <= _v_T @[src/main/scala/operator/ModInvert.scala 78:19]
                  status <= UInt<4>("h6") @[src/main/scala/operator/ModInvert.scala 79:24]
                else :
                  node _v_T_1 = add(v, mod) @[src/main/scala/operator/ModInvert.scala 81:25]
                  node _v_T_2 = tail(_v_T_1, 1) @[src/main/scala/operator/ModInvert.scala 81:25]
                  node _v_T_3 = dshr(_v_T_2, UInt<1>("h1")) @[src/main/scala/operator/ModInvert.scala 81:32]
                  v <= _v_T_3 @[src/main/scala/operator/ModInvert.scala 81:19]
                  status <= UInt<4>("h6") @[src/main/scala/operator/ModInvert.scala 82:24]
              else :
                node _T_20 = eq(UInt<4>("h6"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
                when _T_20 : @[src/main/scala/operator/ModInvert.scala 32:19]
                  node _T_21 = gt(base, mod) @[src/main/scala/operator/ModInvert.scala 86:23]
                  when _T_21 : @[src/main/scala/operator/ModInvert.scala 86:29]
                    node _base_T_1 = sub(base, mod) @[src/main/scala/operator/ModInvert.scala 87:30]
                    node _base_T_2 = tail(_base_T_1, 1) @[src/main/scala/operator/ModInvert.scala 87:30]
                    base <= _base_T_2 @[src/main/scala/operator/ModInvert.scala 87:22]
                    status <= UInt<4>("h7") @[src/main/scala/operator/ModInvert.scala 88:24]
                  else :
                    node _mod_T_1 = sub(mod, base) @[src/main/scala/operator/ModInvert.scala 90:28]
                    node _mod_T_2 = tail(_mod_T_1, 1) @[src/main/scala/operator/ModInvert.scala 90:28]
                    mod <= _mod_T_2 @[src/main/scala/operator/ModInvert.scala 90:21]
                    status <= UInt<4>("h8") @[src/main/scala/operator/ModInvert.scala 91:24]
                else :
                  node _T_22 = eq(UInt<4>("h7"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
                  when _T_22 : @[src/main/scala/operator/ModInvert.scala 32:19]
                    node _T_23 = gt(u, v) @[src/main/scala/operator/ModInvert.scala 95:20]
                    when _T_23 : @[src/main/scala/operator/ModInvert.scala 95:24]
                      node _u_T_4 = sub(u, v) @[src/main/scala/operator/ModInvert.scala 96:24]
                      node _u_T_5 = tail(_u_T_4, 1) @[src/main/scala/operator/ModInvert.scala 96:24]
                      u <= _u_T_5 @[src/main/scala/operator/ModInvert.scala 96:19]
                      status <= UInt<4>("h2") @[src/main/scala/operator/ModInvert.scala 97:24]
                    else :
                      node _u_T_6 = add(u, mod) @[src/main/scala/operator/ModInvert.scala 99:24]
                      node _u_T_7 = tail(_u_T_6, 1) @[src/main/scala/operator/ModInvert.scala 99:24]
                      node _u_T_8 = sub(_u_T_7, v) @[src/main/scala/operator/ModInvert.scala 99:30]
                      node _u_T_9 = tail(_u_T_8, 1) @[src/main/scala/operator/ModInvert.scala 99:30]
                      u <= _u_T_9 @[src/main/scala/operator/ModInvert.scala 99:19]
                      status <= UInt<4>("h2") @[src/main/scala/operator/ModInvert.scala 100:24]
                  else :
                    node _T_24 = eq(UInt<4>("h8"), status) @[src/main/scala/operator/ModInvert.scala 32:19]
                    when _T_24 : @[src/main/scala/operator/ModInvert.scala 32:19]
                      node _T_25 = gt(v, u) @[src/main/scala/operator/ModInvert.scala 104:20]
                      when _T_25 : @[src/main/scala/operator/ModInvert.scala 104:24]
                        node _v_T_4 = sub(v, u) @[src/main/scala/operator/ModInvert.scala 105:24]
                        node _v_T_5 = tail(_v_T_4, 1) @[src/main/scala/operator/ModInvert.scala 105:24]
                        v <= _v_T_5 @[src/main/scala/operator/ModInvert.scala 105:19]
                        status <= UInt<4>("h2") @[src/main/scala/operator/ModInvert.scala 106:24]
                      else :
                        node _v_T_6 = add(v, mod) @[src/main/scala/operator/ModInvert.scala 108:24]
                        node _v_T_7 = tail(_v_T_6, 1) @[src/main/scala/operator/ModInvert.scala 108:24]
                        node _v_T_8 = sub(_v_T_7, u) @[src/main/scala/operator/ModInvert.scala 108:30]
                        node _v_T_9 = tail(_v_T_8, 1) @[src/main/scala/operator/ModInvert.scala 108:30]
                        v <= _v_T_9 @[src/main/scala/operator/ModInvert.scala 108:19]
                        status <= UInt<4>("h2") @[src/main/scala/operator/ModInvert.scala 109:24]
    node _T_26 = and(dout.valid, dout.ready) @[src/main/scala/operator/ModInvert.scala 113:21]
    when _T_26 : @[src/main/scala/operator/ModInvert.scala 113:35]
      dout.bits.res <= res @[src/main/scala/operator/ModInvert.scala 114:23]


