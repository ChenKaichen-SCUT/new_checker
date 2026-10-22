(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun co_3 () (_ BitVec 3))
(declare-fun co_8 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun co_13 () (_ BitVec 3))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun co_10 () (_ BitVec 3))
(declare-fun co_14 () (_ BitVec 3))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_8_2 () Bool)
(declare-fun rf_11_2 () Bool)
(declare-fun read_t2s1a () (_ BitVec 32))
(declare-fun rf_13_2 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_10_4 () Bool)
(declare-fun rf_14_4 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun rf_11_7 () Bool)
(declare-fun rf_13_7 () Bool)
(declare-fun rf_1_9 () Bool)
(declare-fun rf_6_9 () Bool)
(declare-fun rf_10_9 () Bool)
(declare-fun rf_14_9 () Bool)
(declare-fun rf_0_12 () Bool)
(declare-fun rf_3_12 () Bool)
(declare-fun rf_8_12 () Bool)
(declare-fun rf_11_12 () Bool)
(declare-fun rf_13_12 () Bool)
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
(declare-fun topo_U_13 () (_ BitVec 4))
(declare-fun topo_U_14 () (_ BitVec 4))
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
(declare-fun topo_T_13 () (_ BitVec 4))
(declare-fun topo_T_14 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (= input_b true))
(assert (bvult co_0 #b101))
(assert (= co_0 #b000))
(assert (bvult co_3 #b101))
(assert (bvult co_8 #b101))
(assert (bvult co_11 #b101))
(assert (bvult co_13 #b101))
(assert (distinct co_0 co_3 co_8 co_11 co_13))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_6 #b100))
(assert (bvult co_10 #b100))
(assert (bvult co_14 #b100))
(assert (distinct co_1 co_6 co_10 co_14))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000000) read_t0s0a)))
(assert (=> rf_8_2
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t0s0a)))
(assert (=> rf_11_2 (= (ite input_b #x00000001 #x00000002) read_t0s0a)))
(assert (=> rf_13_2 (= (bvadd read_t2s1a #x00000000) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_2 rf_3_2 rf_8_2 rf_11_2 rf_13_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_6_4 (= #x00000002 read_t0s1a)))
(assert (=> rf_10_4 (= (bvadd read_t1s2a #x00000002) read_t0s1a)))
(assert (=> rf_14_4 (= #x00000001 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_4 rf_6_4 rf_10_4 rf_14_4))
(assert (=> rf_0_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_3_7 (= (bvadd read_t0s0a #x00000000) read_t1s1a)))
(assert (=> rf_8_7
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert (=> rf_11_7 (= (ite input_b #x00000001 #x00000002) read_t1s1a)))
(assert (=> rf_13_7 (= (bvadd read_t2s1a #x00000000) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_7 rf_3_7 rf_8_7 rf_11_7 rf_13_7))
(assert (=> rf_1_9 (= #x00000000 read_t1s2a)))
(assert (=> rf_6_9 (= #x00000002 read_t1s2a)))
(assert (=> rf_10_9 (= (bvadd read_t1s2a #x00000002) read_t1s2a)))
(assert (=> rf_14_9 (= #x00000001 read_t1s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_9 rf_6_9 rf_10_9 rf_14_9))
(assert (=> rf_0_12 (= #x00000000 read_t2s1a)))
(assert (=> rf_3_12 (= (bvadd read_t0s0a #x00000000) read_t2s1a)))
(assert (=> rf_8_12
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t2s1a)))
(assert (=> rf_11_12 (= (ite input_b #x00000001 #x00000002) read_t2s1a)))
(assert (=> rf_13_12 (= (bvadd read_t2s1a #x00000000) read_t2s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_12 rf_3_12 rf_8_12 rf_11_12 rf_13_12))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0))
                    (and rf_8_2 (bvult co_8 co_0))
                    (and rf_11_2 (bvult co_11 co_0))
                    (and rf_13_2 (bvult co_13 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_8_2 false)
              (and rf_11_2 false)
              (and rf_13_2 false))
          false)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_8_2 false)
              (and rf_11_2 false)
              (and rf_13_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_8))
                    (and rf_3_2 (bvult co_3 co_8))
                    (and rf_8_2 (bvult co_8 co_8))
                    (and rf_11_2 (bvult co_11 co_8))
                    (and rf_13_2 (bvult co_13 co_8)))
                (bvult co_8 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_8_2 false)
              (and rf_11_2 false)
              (and rf_13_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_11))
                    (and rf_3_2 (bvult co_3 co_11))
                    (and rf_8_2 (bvult co_8 co_11))
                    (and rf_11_2 (bvult co_11 co_11))
                    (and rf_13_2 (bvult co_13 co_11)))
                (bvult co_11 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_13))
                    (and rf_3_2 (bvult co_3 co_13))
                    (and rf_8_2 (bvult co_8 co_13))
                    (and rf_11_2 (bvult co_11 co_13))
                    (and rf_13_2 (bvult co_13 co_13)))
                (bvult co_13 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_8_2 false)
              (and rf_11_2 false)
              (and rf_13_2 false))
          false)))
(assert (not (and (or (and rf_1_9 false)
              (and rf_6_9 false)
              (and rf_10_9 false)
              (and rf_14_9 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_1))
                    (and rf_6_9 (bvult co_6 co_1))
                    (and rf_10_9 (bvult co_10 co_1))
                    (and rf_14_9 (bvult co_14 co_1)))
                (bvult co_1 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_1_9 false)
              (and rf_6_9 false)
              (and rf_10_9 false)
              (and rf_14_9 false))
          false)))
(assert (not (and (or (and rf_1_9 false)
              (and rf_6_9 false)
              (and rf_10_9 false)
              (and rf_14_9 false))
          false)))
(assert (not (and (or (and rf_1_9 false)
              (and rf_6_9 false)
              (and rf_10_9 false)
              (and rf_14_9 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_14))
                    (and rf_6_9 (bvult co_6 co_14))
                    (and rf_10_9 (bvult co_10 co_14))
                    (and rf_14_9 (bvult co_14 co_14)))
                (bvult co_14 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_12 (bvult co_0 co_0))
                    (and rf_3_12 (bvult co_3 co_0))
                    (and rf_8_12 (bvult co_8 co_0))
                    (and rf_11_12 (bvult co_11 co_0))
                    (and rf_13_12 (bvult co_13 co_0)))
                (bvult co_0 co_13))))
  (not a!1)))
(assert (not (and (or (and rf_0_12 false)
              (and rf_3_12 false)
              (and rf_8_12 false)
              (and rf_11_12 false)
              (and rf_13_12 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_12 (bvult co_0 co_3))
                    (and rf_3_12 (bvult co_3 co_3))
                    (and rf_8_12 (bvult co_8 co_3))
                    (and rf_11_12 (bvult co_11 co_3))
                    (and rf_13_12 (bvult co_13 co_3)))
                (bvult co_3 co_13))))
  (not a!1)))
(assert (not (and (or (and rf_0_12 false)
              (and rf_3_12 false)
              (and rf_8_12 false)
              (and rf_11_12 false)
              (and rf_13_12 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_12 (bvult co_0 co_8))
                    (and rf_3_12 (bvult co_3 co_8))
                    (and rf_8_12 (bvult co_8 co_8))
                    (and rf_11_12 (bvult co_11 co_8))
                    (and rf_13_12 (bvult co_13 co_8)))
                (bvult co_8 co_13))))
  (not a!1)))
(assert (not (and (or (and rf_0_12 false)
              (and rf_3_12 false)
              (and rf_8_12 false)
              (and rf_11_12 false)
              (and rf_13_12 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_0))
                    (and rf_3_7 (bvult co_3 co_0))
                    (and rf_8_7 (bvult co_8 co_0))
                    (and rf_11_7 (bvult co_11 co_0))
                    (and rf_13_7 (bvult co_13 co_0)))
                (bvult co_0 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_0_7 false)
              (and rf_3_7 false)
              (and rf_8_7 false)
              (and rf_11_7 false)
              (and rf_13_7 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_3))
                    (and rf_3_7 (bvult co_3 co_3))
                    (and rf_8_7 (bvult co_8 co_3))
                    (and rf_11_7 (bvult co_11 co_3))
                    (and rf_13_7 (bvult co_13 co_3)))
                (bvult co_3 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_11))
                    (and rf_3_7 (bvult co_3 co_11))
                    (and rf_8_7 (bvult co_8 co_11))
                    (and rf_11_7 (bvult co_11 co_11))
                    (and rf_13_7 (bvult co_13 co_11)))
                (bvult co_11 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_13))
                    (and rf_3_7 (bvult co_3 co_13))
                    (and rf_8_7 (bvult co_8 co_13))
                    (and rf_11_7 (bvult co_11 co_13))
                    (and rf_13_7 (bvult co_13 co_13)))
                (bvult co_13 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_0_7 false)
              (and rf_3_7 false)
              (and rf_8_7 false)
              (and rf_11_7 false)
              (and rf_13_7 false))
          false)))
(assert (bvult topo_U_0 #xf))
(assert (bvult topo_U_1 #xf))
(assert (bvult topo_U_2 #xf))
(assert (bvult topo_U_3 #xf))
(assert (bvult topo_U_4 #xf))
(assert (bvult topo_U_5 #xf))
(assert (bvult topo_U_6 #xf))
(assert (bvult topo_U_7 #xf))
(assert (bvult topo_U_8 #xf))
(assert (bvult topo_U_9 #xf))
(assert (bvult topo_U_10 #xf))
(assert (bvult topo_U_11 #xf))
(assert (bvult topo_U_12 #xf))
(assert (bvult topo_U_13 #xf))
(assert (bvult topo_U_14 #xf))
(assert (bvult topo_T_0 #xf))
(assert (bvult topo_T_1 #xf))
(assert (bvult topo_T_2 #xf))
(assert (bvult topo_T_3 #xf))
(assert (bvult topo_T_4 #xf))
(assert (bvult topo_T_5 #xf))
(assert (bvult topo_T_6 #xf))
(assert (bvult topo_T_7 #xf))
(assert (bvult topo_T_8 #xf))
(assert (bvult topo_T_9 #xf))
(assert (bvult topo_T_10 #xf))
(assert (bvult topo_T_11 #xf))
(assert (bvult topo_T_12 #xf))
(assert (bvult topo_T_13 #xf))
(assert (bvult topo_T_14 #xf))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false (bvult co_0 co_3) or (and true false))
    (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false (bvult co_0 co_8) or (and true false))
    (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false (bvult co_0 co_11) or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false (bvult co_0 co_11) or (and true false))
    (bvult topo_T_0 topo_T_11)))
(assert (=> (or false rf_0_12 false or) (bvult topo_U_0 topo_U_12)))
(assert (=> (or false false false or (and true rf_0_12)) (bvult topo_T_0 topo_T_12)))
(assert (=> (or false false (bvult co_0 co_13) or) (bvult topo_U_0 topo_U_13)))
(assert (=> (or false false (bvult co_0 co_13) or (and true false))
    (bvult topo_T_0 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_14)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_14)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false (bvult co_1 co_6) or (and true false))
    (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false rf_1_9 false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true rf_1_9)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false (bvult co_1 co_10) or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false (bvult co_1 co_10) or (and true false))
    (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_13)))
(assert (=> (or false false (bvult co_1 co_14) or) (bvult topo_U_1 topo_U_14)))
(assert (=> (or false false (bvult co_1 co_14) or (and true false))
    (bvult topo_T_1 topo_T_14)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_8_2 (bvult co_8 co_0))
        (and rf_11_2 (bvult co_11 co_0))
        (and rf_13_2 (bvult co_13 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_8_2 (bvult co_8 co_0))
        (and rf_11_2 (bvult co_11 co_0))
        (and rf_13_2 (bvult co_13 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_8_2 (bvult co_8 co_3))
        (and rf_11_2 (bvult co_11 co_3))
        (and rf_13_2 (bvult co_13 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_8_2 (bvult co_8 co_3))
        (and rf_11_2 (bvult co_11 co_3))
        (and rf_13_2 (bvult co_13 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_8))
        (and rf_3_2 (bvult co_3 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and rf_11_2 (bvult co_11 co_8))
        (and rf_13_2 (bvult co_13 co_8)))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_8))
        (and rf_3_2 (bvult co_3 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and rf_11_2 (bvult co_11 co_8))
        (and rf_13_2 (bvult co_13 co_8))
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_11))
        (and rf_3_2 (bvult co_3 co_11))
        (and rf_8_2 (bvult co_8 co_11))
        (and rf_11_2 (bvult co_11 co_11))
        (and rf_13_2 (bvult co_13 co_11)))
    (bvult topo_U_2 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_11))
        (and rf_3_2 (bvult co_3 co_11))
        (and rf_8_2 (bvult co_8 co_11))
        (and rf_11_2 (bvult co_11 co_11))
        (and rf_13_2 (bvult co_13 co_11))
        (and true false))
    (bvult topo_T_2 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_13))
        (and rf_3_2 (bvult co_3 co_13))
        (and rf_8_2 (bvult co_8 co_13))
        (and rf_11_2 (bvult co_11 co_13))
        (and rf_13_2 (bvult co_13 co_13)))
    (bvult topo_U_2 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_13))
        (and rf_3_2 (bvult co_3 co_13))
        (and rf_8_2 (bvult co_8 co_13))
        (and rf_11_2 (bvult co_11 co_13))
        (and rf_13_2 (bvult co_13 co_13))
        (and true false))
    (bvult topo_T_2 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false))
    (bvult topo_U_2 topo_U_14)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_8_2 false)
        (and rf_11_2 false)
        (and rf_13_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_14)))
(assert (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert (=> (or false false (bvult co_3 co_0) or (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert (=> (or false false (bvult co_3 co_3) or (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false (bvult co_3 co_8) or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false (bvult co_3 co_8) or (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false (bvult co_3 co_11) or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false (bvult co_3 co_11) or (and true false))
    (bvult topo_T_3 topo_T_11)))
(assert (=> (or false rf_3_12 false or) (bvult topo_U_3 topo_U_12)))
(assert (=> (or false false false or (and true rf_3_12)) (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false (bvult co_3 co_13) or) (bvult topo_U_3 topo_U_13)))
(assert (=> (or false false (bvult co_3 co_13) or (and true false))
    (bvult topo_T_3 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_14)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_14)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_10_4 (bvult co_10 co_1))
        (and rf_14_4 (bvult co_14 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_10_4 (bvult co_10 co_1))
        (and rf_14_4 (bvult co_14 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_10_4 (bvult co_10 co_6))
        (and rf_14_4 (bvult co_14 co_6)))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_10_4 (bvult co_10 co_6))
        (and rf_14_4 (bvult co_14 co_6))
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_10))
        (and rf_6_4 (bvult co_6 co_10))
        (and rf_10_4 (bvult co_10 co_10))
        (and rf_14_4 (bvult co_14 co_10)))
    (bvult topo_U_4 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_10))
        (and rf_6_4 (bvult co_6 co_10))
        (and rf_10_4 (bvult co_10 co_10))
        (and rf_14_4 (bvult co_14 co_10))
        (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false))
    (bvult topo_U_4 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_10_4 false)
        (and rf_14_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_14))
        (and rf_6_4 (bvult co_6 co_14))
        (and rf_10_4 (bvult co_10 co_14))
        (and rf_14_4 (bvult co_14 co_14)))
    (bvult topo_U_4 topo_U_14)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_14))
        (and rf_6_4 (bvult co_6 co_14))
        (and rf_10_4 (bvult co_10 co_14))
        (and rf_14_4 (bvult co_14 co_14))
        (and true false))
    (bvult topo_T_4 topo_T_14)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_14)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_14)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false (bvult co_6 co_1) or (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or true rf_6_9 false or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or true false false or (and false rf_6_9)) (bvult topo_T_6 topo_T_9)))
(assert (=> (or true false (bvult co_6 co_10) or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or true false (bvult co_6 co_10) or (and false false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_13)))
(assert (=> (or false false (bvult co_6 co_14) or) (bvult topo_U_6 topo_U_14)))
(assert (=> (or false false (bvult co_6 co_14) or (and true false))
    (bvult topo_T_6 topo_T_14)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_3_7 (bvult co_3 co_0))
        (and rf_8_7 (bvult co_8 co_0))
        (and rf_11_7 (bvult co_11 co_0))
        (and rf_13_7 (bvult co_13 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_3_7 (bvult co_3 co_0))
        (and rf_8_7 (bvult co_8 co_0))
        (and rf_11_7 (bvult co_11 co_0))
        (and rf_13_7 (bvult co_13 co_0))
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_8_7 (bvult co_8 co_3))
        (and rf_11_7 (bvult co_11 co_3))
        (and rf_13_7 (bvult co_13 co_3)))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_8_7 (bvult co_8 co_3))
        (and rf_11_7 (bvult co_11 co_3))
        (and rf_13_7 (bvult co_13 co_3))
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_8))
        (and rf_3_7 (bvult co_3 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_11_7 (bvult co_11 co_8))
        (and rf_13_7 (bvult co_13 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_8))
        (and rf_3_7 (bvult co_3 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_11_7 (bvult co_11 co_8))
        (and rf_13_7 (bvult co_13 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_11))
        (and rf_3_7 (bvult co_3 co_11))
        (and rf_8_7 (bvult co_8 co_11))
        (and rf_11_7 (bvult co_11 co_11))
        (and rf_13_7 (bvult co_13 co_11)))
    (bvult topo_U_7 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_11))
        (and rf_3_7 (bvult co_3 co_11))
        (and rf_8_7 (bvult co_8 co_11))
        (and rf_11_7 (bvult co_11 co_11))
        (and rf_13_7 (bvult co_13 co_11))
        (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_13))
        (and rf_3_7 (bvult co_3 co_13))
        (and rf_8_7 (bvult co_8 co_13))
        (and rf_11_7 (bvult co_11 co_13))
        (and rf_13_7 (bvult co_13 co_13)))
    (bvult topo_U_7 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_13))
        (and rf_3_7 (bvult co_3 co_13))
        (and rf_8_7 (bvult co_8 co_13))
        (and rf_11_7 (bvult co_11 co_13))
        (and rf_13_7 (bvult co_13 co_13))
        (and true false))
    (bvult topo_T_7 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false))
    (bvult topo_U_7 topo_U_14)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_8_7 false)
        (and rf_11_7 false)
        (and rf_13_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_14)))
(assert (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false (bvult co_8 co_0) or (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_1)))
(assert (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false (bvult co_8 co_3) or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false (bvult co_8 co_3) or (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false (bvult co_8 co_11) or) (bvult topo_U_8 topo_U_11)))
(assert (=> (or false false (bvult co_8 co_11) or (and true false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false rf_8_12 false or) (bvult topo_U_8 topo_U_12)))
(assert (=> (or false false false or (and true rf_8_12)) (bvult topo_T_8 topo_T_12)))
(assert (=> (or false false (bvult co_8 co_13) or) (bvult topo_U_8 topo_U_13)))
(assert (=> (or false false (bvult co_8 co_13) or (and true false))
    (bvult topo_T_8 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_14)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_14)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_6_9 (bvult co_6 co_1))
        (and rf_10_9 (bvult co_10 co_1))
        (and rf_14_9 (bvult co_14 co_1)))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_6_9 (bvult co_6 co_1))
        (and rf_10_9 (bvult co_10 co_1))
        (and rf_14_9 (bvult co_14 co_1))
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_10_9 (bvult co_10 co_6))
        (and rf_14_9 (bvult co_14 co_6)))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_10_9 (bvult co_10 co_6))
        (and rf_14_9 (bvult co_14 co_6))
        (and false false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_6_9 (bvult co_6 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and rf_14_9 (bvult co_14 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_6_9 (bvult co_6 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and rf_14_9 (bvult co_14 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false))
    (bvult topo_U_9 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and rf_14_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_14))
        (and rf_6_9 (bvult co_6 co_14))
        (and rf_10_9 (bvult co_10 co_14))
        (and rf_14_9 (bvult co_14 co_14)))
    (bvult topo_U_9 topo_U_14)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_14))
        (and rf_6_9 (bvult co_6 co_14))
        (and rf_10_9 (bvult co_10 co_14))
        (and rf_14_9 (bvult co_14 co_14))
        (and true false))
    (bvult topo_T_9 topo_T_14)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false (bvult co_10 co_1) or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false (bvult co_10 co_1) or (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false rf_10_4 false or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false or (and true rf_10_4)) (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false (bvult co_10 co_6) or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false (bvult co_10 co_6) or (and false false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_8)))
(assert (=> (or false rf_10_9 false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false rf_10_9)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_13)))
(assert (=> (or false false (bvult co_10 co_14) or) (bvult topo_U_10 topo_U_14)))
(assert (=> (or false false (bvult co_10 co_14) or (and true false))
    (bvult topo_T_10 topo_T_14)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false rf_11_2 false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true rf_11_2)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false (bvult co_11 co_3) or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false (bvult co_11 co_3) or (and true false))
    (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false rf_11_7 false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true rf_11_7)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false (bvult co_11 co_8) or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false (bvult co_11 co_8) or (and true false))
    (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or true rf_11_12 false or) (bvult topo_U_11 topo_U_12)))
(assert (=> (or true false false or (and false rf_11_12)) (bvult topo_T_11 topo_T_12)))
(assert (=> (or true false (bvult co_11 co_13) or) (bvult topo_U_11 topo_U_13)))
(assert (=> (or true false (bvult co_11 co_13) or (and false false))
    (bvult topo_T_11 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_14)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_11 topo_T_14)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_0))
        (and rf_3_12 (bvult co_3 co_0))
        (and rf_8_12 (bvult co_8 co_0))
        (and rf_11_12 (bvult co_11 co_0))
        (and rf_13_12 (bvult co_13 co_0)))
    (bvult topo_U_12 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_0))
        (and rf_3_12 (bvult co_3 co_0))
        (and rf_8_12 (bvult co_8 co_0))
        (and rf_11_12 (bvult co_11 co_0))
        (and rf_13_12 (bvult co_13 co_0))
        (and true false))
    (bvult topo_T_12 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_3))
        (and rf_3_12 (bvult co_3 co_3))
        (and rf_8_12 (bvult co_8 co_3))
        (and rf_11_12 (bvult co_11 co_3))
        (and rf_13_12 (bvult co_13 co_3)))
    (bvult topo_U_12 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_3))
        (and rf_3_12 (bvult co_3 co_3))
        (and rf_8_12 (bvult co_8 co_3))
        (and rf_11_12 (bvult co_11 co_3))
        (and rf_13_12 (bvult co_13 co_3))
        (and true false))
    (bvult topo_T_12 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_8))
        (and rf_3_12 (bvult co_3 co_8))
        (and rf_8_12 (bvult co_8 co_8))
        (and rf_11_12 (bvult co_11 co_8))
        (and rf_13_12 (bvult co_13 co_8)))
    (bvult topo_U_12 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_8))
        (and rf_3_12 (bvult co_3 co_8))
        (and rf_8_12 (bvult co_8 co_8))
        (and rf_11_12 (bvult co_11 co_8))
        (and rf_13_12 (bvult co_13 co_8))
        (and true false))
    (bvult topo_T_12 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_11))
        (and rf_3_12 (bvult co_3 co_11))
        (and rf_8_12 (bvult co_8 co_11))
        (and rf_11_12 (bvult co_11 co_11))
        (and rf_13_12 (bvult co_13 co_11)))
    (bvult topo_U_12 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_12 (bvult co_0 co_11))
        (and rf_3_12 (bvult co_3 co_11))
        (and rf_8_12 (bvult co_8 co_11))
        (and rf_11_12 (bvult co_11 co_11))
        (and rf_13_12 (bvult co_13 co_11))
        (and false false))
    (bvult topo_T_12 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_12)))
(assert (=> (or true
        false
        false
        (and rf_0_12 (bvult co_0 co_13))
        (and rf_3_12 (bvult co_3 co_13))
        (and rf_8_12 (bvult co_8 co_13))
        (and rf_11_12 (bvult co_11 co_13))
        (and rf_13_12 (bvult co_13 co_13)))
    (bvult topo_U_12 topo_U_13)))
(assert (=> (or true
        false
        false
        (and rf_0_12 (bvult co_0 co_13))
        (and rf_3_12 (bvult co_3 co_13))
        (and rf_8_12 (bvult co_8 co_13))
        (and rf_11_12 (bvult co_11 co_13))
        (and rf_13_12 (bvult co_13 co_13))
        (and false false))
    (bvult topo_T_12 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false))
    (bvult topo_U_12 topo_U_14)))
(assert (=> (or true
        false
        false
        (and rf_0_12 false)
        (and rf_3_12 false)
        (and rf_8_12 false)
        (and rf_11_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_14)))
(assert (=> (or false false (bvult co_13 co_0) or) (bvult topo_U_13 topo_U_0)))
(assert (=> (or false false (bvult co_13 co_0) or (and true false))
    (bvult topo_T_13 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_1)))
(assert (=> (or false rf_13_2 false or) (bvult topo_U_13 topo_U_2)))
(assert (=> (or false false false or (and true rf_13_2)) (bvult topo_T_13 topo_T_2)))
(assert (=> (or false false (bvult co_13 co_3) or) (bvult topo_U_13 topo_U_3)))
(assert (=> (or false false (bvult co_13 co_3) or (and true false))
    (bvult topo_T_13 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_6)))
(assert (=> (or false rf_13_7 false or) (bvult topo_U_13 topo_U_7)))
(assert (=> (or false false false or (and true rf_13_7)) (bvult topo_T_13 topo_T_7)))
(assert (=> (or false false (bvult co_13 co_8) or) (bvult topo_U_13 topo_U_8)))
(assert (=> (or false false (bvult co_13 co_8) or (and true false))
    (bvult topo_T_13 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_10)))
(assert (=> (or false false (bvult co_13 co_11) or) (bvult topo_U_13 topo_U_11)))
(assert (=> (or false false (bvult co_13 co_11) or (and false false))
    (bvult topo_T_13 topo_T_11)))
(assert (=> (or false rf_13_12 false or) (bvult topo_U_13 topo_U_12)))
(assert (=> (or false false false or (and false rf_13_12)) (bvult topo_T_13 topo_T_12)))
(assert (=> (or false false (bvult co_13 co_13) or) (bvult topo_U_13 topo_U_13)))
(assert (=> (or false false (bvult co_13 co_13) or (and false false))
    (bvult topo_T_13 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_14)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_13 topo_T_14)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_0)))
(assert (=> (or false false (bvult co_14 co_1) or) (bvult topo_U_14 topo_U_1)))
(assert (=> (or false false (bvult co_14 co_1) or (and true false))
    (bvult topo_T_14 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_3)))
(assert (=> (or false rf_14_4 false or) (bvult topo_U_14 topo_U_4)))
(assert (=> (or false false false or (and true rf_14_4)) (bvult topo_T_14 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_5)))
(assert (=> (or false false (bvult co_14 co_6) or) (bvult topo_U_14 topo_U_6)))
(assert (=> (or false false (bvult co_14 co_6) or (and true false))
    (bvult topo_T_14 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_14 topo_T_8)))
(assert (=> (or false rf_14_9 false or) (bvult topo_U_14 topo_U_9)))
(assert (=> (or false false false or (and true rf_14_9)) (bvult topo_T_14 topo_T_9)))
(assert (=> (or false false (bvult co_14 co_10) or) (bvult topo_U_14 topo_U_10)))
(assert (=> (or false false (bvult co_14 co_10) or (and true false))
    (bvult topo_T_14 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_14 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_12)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_14 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_14 topo_U_13)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_14 topo_T_13)))
(assert (=> (or false false (bvult co_14 co_14) or) (bvult topo_U_14 topo_U_14)))
(assert (=> (or false false (bvult co_14 co_14) or (and false false))
    (bvult topo_T_14 topo_T_14)))
(assert (=> (= co_0 #b100) (= #x00000000 final_x)))
(assert (=> (= co_3 #b100) (= final_x (bvadd read_t0s0a #x00000000))))
(assert (=> (= co_8 #b100)
    (= final_x (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_11 #b100) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_13 #b100) (= final_x (bvadd read_t2s1a #x00000000))))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_6 #b011) (= #x00000002 final_y)))
(assert (=> (= co_10 #b011) (= final_y (bvadd read_t1s2a #x00000002))))
(assert (=> (= co_14 #b011) (= #x00000001 final_y)))

(check-sat)
