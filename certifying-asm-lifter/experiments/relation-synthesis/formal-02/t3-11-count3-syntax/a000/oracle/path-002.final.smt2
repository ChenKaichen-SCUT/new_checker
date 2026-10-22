(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun co_12 () (_ BitVec 3))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t0s2b () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun read_t2s1a () (_ BitVec 32))
(declare-fun rf_11_3 () Bool)
(declare-fun rf_12_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_11_5 () Bool)
(declare-fun rf_12_5 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_0_9 () Bool)
(declare-fun rf_4_9 () Bool)
(declare-fun rf_6_9 () Bool)
(declare-fun rf_11_9 () Bool)
(declare-fun rf_12_9 () Bool)
(declare-fun rf_0_10 () Bool)
(declare-fun rf_4_10 () Bool)
(declare-fun rf_6_10 () Bool)
(declare-fun rf_11_10 () Bool)
(declare-fun rf_12_10 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_U_10 () (_ BitVec 4))
(declare-fun topo_U_11 () (_ BitVec 4))
(declare-fun topo_U_12 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun topo_T_10 () (_ BitVec 4))
(declare-fun topo_T_11 () (_ BitVec 4))
(declare-fun topo_T_12 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b false))
(assert (= input_b true))
(assert (bvult co_0 #b101))
(assert (= co_0 #b000))
(assert (bvult co_4 #b101))
(assert (bvult co_6 #b101))
(assert (bvult co_11 #b101))
(assert (bvult co_12 #b101))
(assert (distinct co_0 co_4 co_6 co_11 co_12))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_8 #b10))
(assert (distinct co_1 co_8))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert (=> rf_6_3
    (= (bvadd read_t0s2b (ite input_b #x00000001 #x00000002)) read_t0s1a)))
(assert (=> rf_11_3 (= (bvadd read_t2s1a #x00000000) read_t0s1a)))
(assert (=> rf_12_3 (= #x00000000 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_3 rf_4_3 rf_6_3 rf_11_3 rf_12_3))
(assert (=> rf_0_5 (= #x00000000 read_t0s2b)))
(assert (=> rf_4_5 (= (bvadd read_t0s1a #x00000001) read_t0s2b)))
(assert (=> rf_6_5
    (= (bvadd read_t0s2b (ite input_b #x00000001 #x00000002)) read_t0s2b)))
(assert (=> rf_11_5 (= (bvadd read_t2s1a #x00000000) read_t0s2b)))
(assert (=> rf_12_5 (= #x00000000 read_t0s2b)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_5 rf_4_5 rf_6_5 rf_11_5 rf_12_5))
(assert (=> rf_1_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_8_7
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_1_7 rf_8_7))
(assert (=> rf_0_9 (= #x00000000 read_t2s0a)))
(assert (=> rf_4_9 (= (bvadd read_t0s1a #x00000001) read_t2s0a)))
(assert (=> rf_6_9
    (= (bvadd read_t0s2b (ite input_b #x00000001 #x00000002)) read_t2s0a)))
(assert (=> rf_11_9 (= (bvadd read_t2s1a #x00000000) read_t2s0a)))
(assert (=> rf_12_9 (= #x00000000 read_t2s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_9 rf_4_9 rf_6_9 rf_11_9 rf_12_9))
(assert (=> rf_0_10 (= #x00000000 read_t2s1a)))
(assert (=> rf_4_10 (= (bvadd read_t0s1a #x00000001) read_t2s1a)))
(assert (=> rf_6_10
    (= (bvadd read_t0s2b (ite input_b #x00000001 #x00000002)) read_t2s1a)))
(assert (=> rf_11_10 (= (bvadd read_t2s1a #x00000000) read_t2s1a)))
(assert (=> rf_12_10 (= #x00000000 read_t2s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_10 rf_4_10 rf_6_10 rf_11_10 rf_12_10))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_4_5 (bvult co_4 co_0))
                    (and rf_6_5 (bvult co_6 co_0))
                    (and rf_11_5 (bvult co_11 co_0))
                    (and rf_12_5 (bvult co_12 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false)
              (and rf_4_5 false)
              (and rf_6_5 false)
              (and rf_11_5 false)
              (and rf_12_5 false))
          false)))
(assert (not (and (or (and rf_0_5 false)
              (and rf_4_5 false)
              (and rf_6_5 false)
              (and rf_11_5 false)
              (and rf_12_5 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_11))
                    (and rf_4_5 (bvult co_4 co_11))
                    (and rf_6_5 (bvult co_6 co_11))
                    (and rf_11_5 (bvult co_11 co_11))
                    (and rf_12_5 (bvult co_12 co_11)))
                (bvult co_11 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_12))
                    (and rf_4_5 (bvult co_4 co_12))
                    (and rf_6_5 (bvult co_6 co_12))
                    (and rf_11_5 (bvult co_11 co_12))
                    (and rf_12_5 (bvult co_12 co_12)))
                (bvult co_12 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0))
                    (and rf_6_3 (bvult co_6 co_0))
                    (and rf_11_3 (bvult co_11 co_0))
                    (and rf_12_3 (bvult co_12 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false)
              (and rf_4_3 false)
              (and rf_6_3 false)
              (and rf_11_3 false)
              (and rf_12_3 false))
          false)))
(assert (not (and (or (and rf_0_3 false)
              (and rf_4_3 false)
              (and rf_6_3 false)
              (and rf_11_3 false)
              (and rf_12_3 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_11))
                    (and rf_4_3 (bvult co_4 co_11))
                    (and rf_6_3 (bvult co_6 co_11))
                    (and rf_11_3 (bvult co_11 co_11))
                    (and rf_12_3 (bvult co_12 co_11)))
                (bvult co_11 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_12))
                    (and rf_4_3 (bvult co_4 co_12))
                    (and rf_6_3 (bvult co_6 co_12))
                    (and rf_11_3 (bvult co_11 co_12))
                    (and rf_12_3 (bvult co_12 co_12)))
                (bvult co_12 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_1))
                    (and rf_8_7 (bvult co_8 co_1)))
                (bvult co_1 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false)) false)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false)) false)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false)) false)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_0))
                    (and rf_4_10 (bvult co_4 co_0))
                    (and rf_6_10 (bvult co_6 co_0))
                    (and rf_11_10 (bvult co_11 co_0))
                    (and rf_12_10 (bvult co_12 co_0)))
                (bvult co_0 co_11))))
  (not a!1)))
(assert (not (and (or (and rf_0_10 false)
              (and rf_4_10 false)
              (and rf_6_10 false)
              (and rf_11_10 false)
              (and rf_12_10 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_4))
                    (and rf_4_10 (bvult co_4 co_4))
                    (and rf_6_10 (bvult co_6 co_4))
                    (and rf_11_10 (bvult co_11 co_4))
                    (and rf_12_10 (bvult co_12 co_4)))
                (bvult co_4 co_11))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_6))
                    (and rf_4_10 (bvult co_4 co_6))
                    (and rf_6_10 (bvult co_6 co_6))
                    (and rf_11_10 (bvult co_11 co_6))
                    (and rf_12_10 (bvult co_12 co_6)))
                (bvult co_6 co_11))))
  (not a!1)))
(assert (not (and (or (and rf_0_10 false)
              (and rf_4_10 false)
              (and rf_6_10 false)
              (and rf_11_10 false)
              (and rf_12_10 false))
          false)))
(assert (bvult topo_U_0 #xd))
(assert (bvult topo_U_1 #xd))
(assert (bvult topo_U_2 #xd))
(assert (bvult topo_U_3 #xd))
(assert (bvult topo_U_4 #xd))
(assert (bvult topo_U_5 #xd))
(assert (bvult topo_U_6 #xd))
(assert (bvult topo_U_7 #xd))
(assert (bvult topo_U_8 #xd))
(assert (bvult topo_U_9 #xd))
(assert (bvult topo_U_10 #xd))
(assert (bvult topo_U_11 #xd))
(assert (bvult topo_U_12 #xd))
(assert (bvult topo_T_0 #xd))
(assert (bvult topo_T_1 #xd))
(assert (bvult topo_T_2 #xd))
(assert (bvult topo_T_3 #xd))
(assert (bvult topo_T_4 #xd))
(assert (bvult topo_T_5 #xd))
(assert (bvult topo_T_6 #xd))
(assert (bvult topo_T_7 #xd))
(assert (bvult topo_T_8 #xd))
(assert (bvult topo_T_9 #xd))
(assert (bvult topo_T_10 #xd))
(assert (bvult topo_T_11 #xd))
(assert (bvult topo_T_12 #xd))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false rf_0_9 false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true rf_0_9)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false rf_0_10 false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true rf_0_10)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false (bvult co_0 co_11) or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false (bvult co_0 co_11) or (and true false))
    (bvult topo_T_0 topo_T_11)))
(assert (=> (or false false (bvult co_0 co_12) or) (bvult topo_U_0 topo_U_12)))
(assert (=> (or false false (bvult co_0 co_12) or (and true false))
    (bvult topo_T_0 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false (bvult co_1 co_8) or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false (bvult co_1 co_8) or (and true false))
    (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and rf_11_3 (bvult co_11 co_0))
        (and rf_12_3 (bvult co_12 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and rf_11_3 (bvult co_11 co_0))
        (and rf_12_3 (bvult co_12 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4))
        (and rf_11_3 (bvult co_11 co_4))
        (and rf_12_3 (bvult co_12 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4))
        (and rf_11_3 (bvult co_11 co_4))
        (and rf_12_3 (bvult co_12 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_11_3 (bvult co_11 co_6))
        (and rf_12_3 (bvult co_12 co_6)))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_11_3 (bvult co_11 co_6))
        (and rf_12_3 (bvult co_12 co_6))
        (and false false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_11_3 false)
        (and rf_12_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_6_3 (bvult co_6 co_11))
        (and rf_11_3 (bvult co_11 co_11))
        (and rf_12_3 (bvult co_12 co_11)))
    (bvult topo_U_3 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_6_3 (bvult co_6 co_11))
        (and rf_11_3 (bvult co_11 co_11))
        (and rf_12_3 (bvult co_12 co_11))
        (and true false))
    (bvult topo_T_3 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_12))
        (and rf_4_3 (bvult co_4 co_12))
        (and rf_6_3 (bvult co_6 co_12))
        (and rf_11_3 (bvult co_11 co_12))
        (and rf_12_3 (bvult co_12 co_12)))
    (bvult topo_U_3 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_12))
        (and rf_4_3 (bvult co_4 co_12))
        (and rf_6_3 (bvult co_6 co_12))
        (and rf_11_3 (bvult co_11 co_12))
        (and rf_12_3 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false (bvult co_4 co_0) or (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false or (and false rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or true false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or true false (bvult co_4 co_6) or (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false rf_4_9 false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true rf_4_9)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false rf_4_10 false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true rf_4_10)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false (bvult co_4 co_11) or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false (bvult co_4 co_11) or (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false false (bvult co_4 co_12) or) (bvult topo_U_4 topo_U_12)))
(assert (=> (or false false (bvult co_4 co_12) or (and true false))
    (bvult topo_T_4 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_11_5 (bvult co_11 co_0))
        (and rf_12_5 (bvult co_12 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_11_5 (bvult co_11 co_0))
        (and rf_12_5 (bvult co_12 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4))
        (and rf_11_5 (bvult co_11 co_4))
        (and rf_12_5 (bvult co_12 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4))
        (and rf_11_5 (bvult co_11 co_4))
        (and rf_12_5 (bvult co_12 co_4))
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_11_5 (bvult co_11 co_6))
        (and rf_12_5 (bvult co_12 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_11_5 (bvult co_11 co_6))
        (and rf_12_5 (bvult co_12 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_11_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_11))
        (and rf_4_5 (bvult co_4 co_11))
        (and rf_6_5 (bvult co_6 co_11))
        (and rf_11_5 (bvult co_11 co_11))
        (and rf_12_5 (bvult co_12 co_11)))
    (bvult topo_U_5 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_11))
        (and rf_4_5 (bvult co_4 co_11))
        (and rf_6_5 (bvult co_6 co_11))
        (and rf_11_5 (bvult co_11 co_11))
        (and rf_12_5 (bvult co_12 co_11))
        (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_12))
        (and rf_4_5 (bvult co_4 co_12))
        (and rf_6_5 (bvult co_6 co_12))
        (and rf_11_5 (bvult co_11 co_12))
        (and rf_12_5 (bvult co_12 co_12)))
    (bvult topo_U_5 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_12))
        (and rf_4_5 (bvult co_4 co_12))
        (and rf_6_5 (bvult co_6 co_12))
        (and rf_11_5 (bvult co_11 co_12))
        (and rf_12_5 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_5 topo_T_12)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and false rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false (bvult co_6 co_4) or (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or false rf_6_9 false or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or false false false or (and true rf_6_9)) (bvult topo_T_6 topo_T_9)))
(assert (=> (or false rf_6_10 false or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or false false false or (and true rf_6_10)) (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false (bvult co_6 co_11) or) (bvult topo_U_6 topo_U_11)))
(assert (=> (or false false (bvult co_6 co_11) or (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false (bvult co_6 co_12) or) (bvult topo_U_6 topo_U_12)))
(assert (=> (or false false (bvult co_6 co_12) or (and true false))
    (bvult topo_T_6 topo_T_12)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_8_7 (bvult co_8 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_8_7 (bvult co_8 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_6_9 (bvult co_6 co_0))
        (and rf_11_9 (bvult co_11 co_0))
        (and rf_12_9 (bvult co_12 co_0)))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_6_9 (bvult co_6 co_0))
        (and rf_11_9 (bvult co_11 co_0))
        (and rf_12_9 (bvult co_12 co_0))
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_6_9 (bvult co_6 co_4))
        (and rf_11_9 (bvult co_11 co_4))
        (and rf_12_9 (bvult co_12 co_4)))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_6_9 (bvult co_6 co_4))
        (and rf_11_9 (bvult co_11 co_4))
        (and rf_12_9 (bvult co_12 co_4))
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_6))
        (and rf_4_9 (bvult co_4 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_11_9 (bvult co_11 co_6))
        (and rf_12_9 (bvult co_12 co_6)))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_6))
        (and rf_4_9 (bvult co_4 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_11_9 (bvult co_11 co_6))
        (and rf_12_9 (bvult co_12 co_6))
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_6_9 false)
        (and rf_11_9 false)
        (and rf_12_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_6_9 (bvult co_6 co_11))
        (and rf_11_9 (bvult co_11 co_11))
        (and rf_12_9 (bvult co_12 co_11)))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_6_9 (bvult co_6 co_11))
        (and rf_11_9 (bvult co_11 co_11))
        (and rf_12_9 (bvult co_12 co_11))
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_12))
        (and rf_4_9 (bvult co_4 co_12))
        (and rf_6_9 (bvult co_6 co_12))
        (and rf_11_9 (bvult co_11 co_12))
        (and rf_12_9 (bvult co_12 co_12)))
    (bvult topo_U_9 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_12))
        (and rf_4_9 (bvult co_4 co_12))
        (and rf_6_9 (bvult co_6 co_12))
        (and rf_11_9 (bvult co_11 co_12))
        (and rf_12_9 (bvult co_12 co_12))
        (and false false))
    (bvult topo_T_9 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_4_10 (bvult co_4 co_0))
        (and rf_6_10 (bvult co_6 co_0))
        (and rf_11_10 (bvult co_11 co_0))
        (and rf_12_10 (bvult co_12 co_0)))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_4_10 (bvult co_4 co_0))
        (and rf_6_10 (bvult co_6 co_0))
        (and rf_11_10 (bvult co_11 co_0))
        (and rf_12_10 (bvult co_12 co_0))
        (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_4))
        (and rf_4_10 (bvult co_4 co_4))
        (and rf_6_10 (bvult co_6 co_4))
        (and rf_11_10 (bvult co_11 co_4))
        (and rf_12_10 (bvult co_12 co_4)))
    (bvult topo_U_10 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_4))
        (and rf_4_10 (bvult co_4 co_4))
        (and rf_6_10 (bvult co_6 co_4))
        (and rf_11_10 (bvult co_11 co_4))
        (and rf_12_10 (bvult co_12 co_4))
        (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_6))
        (and rf_4_10 (bvult co_4 co_6))
        (and rf_6_10 (bvult co_6 co_6))
        (and rf_11_10 (bvult co_11 co_6))
        (and rf_12_10 (bvult co_12 co_6)))
    (bvult topo_U_10 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_6))
        (and rf_4_10 (bvult co_4 co_6))
        (and rf_6_10 (bvult co_6 co_6))
        (and rf_11_10 (bvult co_11 co_6))
        (and rf_12_10 (bvult co_12 co_6))
        (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false))
    (bvult topo_U_10 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and rf_6_10 false)
        (and rf_11_10 false)
        (and rf_12_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_11))
        (and rf_4_10 (bvult co_4 co_11))
        (and rf_6_10 (bvult co_6 co_11))
        (and rf_11_10 (bvult co_11 co_11))
        (and rf_12_10 (bvult co_12 co_11)))
    (bvult topo_U_10 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_11))
        (and rf_4_10 (bvult co_4 co_11))
        (and rf_6_10 (bvult co_6 co_11))
        (and rf_11_10 (bvult co_11 co_11))
        (and rf_12_10 (bvult co_12 co_11))
        (and false false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_12))
        (and rf_4_10 (bvult co_4 co_12))
        (and rf_6_10 (bvult co_6 co_12))
        (and rf_11_10 (bvult co_11 co_12))
        (and rf_12_10 (bvult co_12 co_12)))
    (bvult topo_U_10 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_12))
        (and rf_4_10 (bvult co_4 co_12))
        (and rf_6_10 (bvult co_6 co_12))
        (and rf_11_10 (bvult co_11 co_12))
        (and rf_12_10 (bvult co_12 co_12))
        (and false false))
    (bvult topo_T_10 topo_T_12)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false rf_11_3 false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true rf_11_3)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false (bvult co_11 co_4) or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false (bvult co_11 co_4) or (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false rf_11_5 false or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false false or (and true rf_11_5)) (bvult topo_T_11 topo_T_5)))
(assert (=> (or false false (bvult co_11 co_6) or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false (bvult co_11 co_6) or (and true false))
    (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false rf_11_9 false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false rf_11_9)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false rf_11_10 false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false rf_11_10)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or true false (bvult co_11 co_12) or) (bvult topo_U_11 topo_U_12)))
(assert (=> (or true false (bvult co_11 co_12) or (and false false))
    (bvult topo_T_11 topo_T_12)))
(assert (=> (or false false (bvult co_12 co_0) or) (bvult topo_U_12 topo_U_0)))
(assert (=> (or false false (bvult co_12 co_0) or (and true false))
    (bvult topo_T_12 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_2)))
(assert (=> (or false rf_12_3 false or) (bvult topo_U_12 topo_U_3)))
(assert (=> (or false false false or (and true rf_12_3)) (bvult topo_T_12 topo_T_3)))
(assert (=> (or false false (bvult co_12 co_4) or) (bvult topo_U_12 topo_U_4)))
(assert (=> (or false false (bvult co_12 co_4) or (and true false))
    (bvult topo_T_12 topo_T_4)))
(assert (=> (or false rf_12_5 false or) (bvult topo_U_12 topo_U_5)))
(assert (=> (or false false false or (and true rf_12_5)) (bvult topo_T_12 topo_T_5)))
(assert (=> (or false false (bvult co_12 co_6) or) (bvult topo_U_12 topo_U_6)))
(assert (=> (or false false (bvult co_12 co_6) or (and true false))
    (bvult topo_T_12 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_8)))
(assert (=> (or false rf_12_9 false or) (bvult topo_U_12 topo_U_9)))
(assert (=> (or false false false or (and false rf_12_9)) (bvult topo_T_12 topo_T_9)))
(assert (=> (or false rf_12_10 false or) (bvult topo_U_12 topo_U_10)))
(assert (=> (or false false false or (and false rf_12_10)) (bvult topo_T_12 topo_T_10)))
(assert (=> (or false false (bvult co_12 co_11) or) (bvult topo_U_12 topo_U_11)))
(assert (=> (or false false (bvult co_12 co_11) or (and false false))
    (bvult topo_T_12 topo_T_11)))
(assert (=> (or false false (bvult co_12 co_12) or) (bvult topo_U_12 topo_U_12)))
(assert (=> (or false false (bvult co_12 co_12) or (and false false))
    (bvult topo_T_12 topo_T_12)))
(assert (=> (= co_0 #b100) (= #x00000000 final_x)))
(assert (=> (= co_4 #b100) (= final_x (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_6 #b100)
    (= final_x (bvadd read_t0s2b (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_11 #b100) (= final_x (bvadd read_t2s1a #x00000000))))
(assert (=> (= co_12 #b100) (= #x00000000 final_x)))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_8 #b01)
    (= final_y (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))

(check-sat)
