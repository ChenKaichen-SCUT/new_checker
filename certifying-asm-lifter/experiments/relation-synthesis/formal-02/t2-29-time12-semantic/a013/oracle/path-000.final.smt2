(declare-fun rf_8_7 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun final_x () (_ BitVec 32))
(declare-fun k!279 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!280 () Bool)
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun k!281 () Bool)
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun k!282 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!283 () Bool)
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun k!284 () Bool)
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun k!285 () Bool)
(declare-fun k!286 () Bool)
(declare-fun k!287 () Bool)
(declare-fun k!288 () Bool)
(declare-fun k!289 () Bool)
(declare-fun k!290 () Bool)
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_10 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_10_3 () Bool)
(declare-fun rf_1_9 () Bool)
(declare-fun rf_4_9 () Bool)
(declare-fun rf_10_9 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_U_10 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun topo_T_10 () (_ BitVec 4))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (= (not input_b) true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_8 #b10))
(assert (distinct co_0 co_8))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_10 #b11))
(assert (distinct co_1 co_4 co_10))
(assert (=> rf_1_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3
    (= (bvadd read_t0s1a (ite input_b #x00000001 #x00000002)) read_t0s1a)))
(assert (=> rf_10_3 (= (bvadd read_t1s2a #x00000000) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_10_3))
(assert (=> rf_0_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_8_7 (= (bvadd read_t1s1a #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_0_7 rf_8_7))
(assert (=> rf_1_9 (= #x00000000 read_t1s2a)))
(assert (=> rf_4_9
    (= (bvadd read_t0s1a (ite input_b #x00000001 #x00000002)) read_t1s2a)))
(assert (=> rf_10_9 (= (bvadd read_t1s2a #x00000000) read_t1s2a)))
(assert ((_ pbeq 1 1 1 1) rf_1_9 rf_4_9 rf_10_9))
(assert (not (and (or (and rf_1_9 false) (and rf_4_9 false) (and rf_10_9 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_1))
                    (and rf_4_9 (bvult co_4 co_1))
                    (and rf_10_9 (bvult co_10 co_1)))
                (bvult co_1 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_4))
                    (and rf_4_9 (bvult co_4 co_4))
                    (and rf_10_9 (bvult co_10 co_4)))
                (bvult co_4 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false) (and rf_10_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_4_3 (bvult co_4 co_1))
                    (and rf_10_3 (bvult co_10 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false) (and rf_10_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_10))
                    (and rf_4_3 (bvult co_4 co_10))
                    (and rf_10_3 (bvult co_10 co_10)))
                (bvult co_10 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_0))
                    (and rf_8_7 (bvult co_8 co_0)))
                (bvult co_0 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert (bvult topo_U_0 #xb))
(assert (bvult topo_U_1 #xb))
(assert (bvult topo_U_2 #xb))
(assert (bvult topo_U_3 #xb))
(assert (bvult topo_U_4 #xb))
(assert (bvult topo_U_5 #xb))
(assert (bvult topo_U_6 #xb))
(assert (bvult topo_U_7 #xb))
(assert (bvult topo_U_8 #xb))
(assert (bvult topo_U_9 #xb))
(assert (bvult topo_U_10 #xb))
(assert (bvult topo_T_0 #xb))
(assert (bvult topo_T_1 #xb))
(assert (bvult topo_T_2 #xb))
(assert (bvult topo_T_3 #xb))
(assert (bvult topo_T_4 #xb))
(assert (bvult topo_T_5 #xb))
(assert (bvult topo_T_6 #xb))
(assert (bvult topo_T_7 #xb))
(assert (bvult topo_T_8 #xb))
(assert (bvult topo_T_9 #xb))
(assert (bvult topo_T_10 #xb))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false (bvult co_1 co_4) or (and true false))
    (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false rf_1_9 false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true rf_1_9)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false (bvult co_1 co_10) or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false (bvult co_1 co_10) or (and true false))
    (bvult topo_T_1 topo_T_10)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_10_3 (bvult co_10 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_10_3 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_10_3 (bvult co_10 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_10_3 (bvult co_10 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_10))
        (and rf_4_3 (bvult co_4 co_10))
        (and rf_10_3 (bvult co_10 co_10)))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_10))
        (and rf_4_3 (bvult co_4 co_10))
        (and rf_10_3 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false (bvult co_4 co_1) or (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false rf_4_9 false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true rf_4_9)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false (bvult co_4 co_10) or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false (bvult co_4 co_10) or (and true false))
    (bvult topo_T_4 topo_T_10)))
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
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_8_7 (bvult co_8 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_8_7 (bvult co_8 co_0))
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_8))
        (and rf_8_7 (bvult co_8 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_8_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false (bvult co_8 co_0) or (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_3)))
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
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_4_9 (bvult co_4 co_1))
        (and rf_10_9 (bvult co_10 co_1)))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_4_9 (bvult co_4 co_1))
        (and rf_10_9 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_10_9 (bvult co_10 co_4)))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_10_9 (bvult co_10 co_4))
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_4_9 (bvult co_4 co_10))
        (and rf_10_9 (bvult co_10 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_4_9 (bvult co_4 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false (bvult co_10 co_1) or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false (bvult co_10 co_1) or (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false rf_10_3 false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true rf_10_3)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false (bvult co_10 co_4) or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false (bvult co_10 co_4) or (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_8)))
(assert (=> (or false rf_10_9 false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false rf_10_9)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_8 #b01) (= final_x (bvadd read_t1s1a #x00000002))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_4 #b10)
    (= final_y (bvadd read_t0s1a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_10 #b10) (= final_y (bvadd read_t1s2a #x00000000))))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_1_3 false)
    (distinct rf_4_3 false)
    (distinct rf_10_3 true)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct rf_1_9 true)
    (distinct rf_4_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b10 co_4)
    (distinct #b01 co_10)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000002 read_t1s2a)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct rf_1_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_4)
    (distinct #b10 co_10)))
(model-add rf_8_7 () Bool false)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add rf_0_7 () Bool true)
(model-add read_t1s1a () (_ BitVec 32) #x00000000)
(model-add input_b () Bool false)
(model-add final_x () (_ BitVec 32) #x00000002)
(model-del k!279)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!279 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!280)
(model-add topo_U_5
           ()
           (_ BitVec 4)
           (ite (or k!280 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!281)
(model-add topo_U_6
           ()
           (_ BitVec 4)
           (ite (or k!281 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!282)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!282 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!283)
(model-add topo_T_5
           ()
           (_ BitVec 4)
           (ite (or k!283 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!284)
(model-add topo_T_6
           ()
           (_ BitVec 4)
           (ite (or k!284 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!285)
(model-add k!279 () Bool (not k!285))
(model-del k!286)
(model-add k!280 () Bool (not k!286))
(model-del k!287)
(model-add k!281 () Bool (not k!287))
(model-del k!288)
(model-add k!282 () Bool (not k!288))
(model-del k!289)
(model-add k!283 () Bool (not k!289))
(model-del k!290)
(model-add k!284 () Bool (not k!290))
(model-add rf_10_9 () Bool false)
(model-add co_8 () (_ BitVec 2) #b01)
(model-add topo_T_4 () (_ BitVec 4) #x7)
(model-add co_10 () (_ BitVec 2) #b01)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_U_9 () (_ BitVec 4) #x2)
(model-add topo_U_10 () (_ BitVec 4) #x3)
(model-add rf_1_9 () Bool true)
(model-add k!285 () Bool true)
(model-add topo_U_4 () (_ BitVec 4) #x8)
(model-add topo_U_3 () (_ BitVec 4) #x5)
(model-add rf_1_3 () Bool false)
(model-add rf_4_9 () Bool false)
(model-add k!287 () Bool true)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add k!288 () Bool true)
(model-add topo_T_9 () (_ BitVec 4) #x3)
(model-add co_4 () (_ BitVec 2) #b10)
(model-add topo_U_8 () (_ BitVec 4) #x3)
(model-add topo_T_7 () (_ BitVec 4) #x1)
(model-add k!290 () Bool true)
(model-add topo_T_8 () (_ BitVec 4) #x2)
(model-add topo_T_10 () (_ BitVec 4) #x4)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add topo_U_7 () (_ BitVec 4) #x2)
(model-add k!289 () Bool true)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_3 () (_ BitVec 4) #x5)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add rf_10_3 () Bool true)
(model-add read_t1s2a () (_ BitVec 32) #x00000000)
(model-add k!286 () Bool true)

(check-sat)
