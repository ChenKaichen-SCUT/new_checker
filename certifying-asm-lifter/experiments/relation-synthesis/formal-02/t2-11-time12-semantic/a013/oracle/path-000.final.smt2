(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun input_b () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun k!218 () Bool)
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun k!219 () Bool)
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun k!220 () Bool)
(declare-fun k!221 () Bool)
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_10 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_10_5 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_8 () Bool)
(declare-fun rf_3_8 () Bool)
(declare-fun rf_0_9 () Bool)
(declare-fun rf_6_9 () Bool)
(declare-fun rf_10_9 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_U_10 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun topo_T_10 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_6 #b11))
(assert (bvult co_10 #b11))
(assert (distinct co_0 co_6 co_10))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_3 #b10))
(assert (distinct co_1 co_3))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000002) read_t0s0a)))
(assert ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert (=> rf_0_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_6_5 (= (bvadd read_t0s2a #x00000002) read_t0s2a)))
(assert (=> rf_10_5 (= (bvadd read_t1s2a #x00000000) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_6_5 rf_10_5))
(assert (=> rf_1_7 (= #x00000000 read_t1s0a)))
(assert (=> rf_3_7 (= (bvadd read_t0s0a #x00000002) read_t1s0a)))
(assert ((_ pbeq 1 1 1) rf_1_7 rf_3_7))
(assert (=> rf_1_8 (= #x00000000 read_t1s1a)))
(assert (=> rf_3_8 (= (bvadd read_t0s0a #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_1_8 rf_3_8))
(assert (=> rf_0_9 (= #x00000000 read_t1s2a)))
(assert (=> rf_6_9 (= (bvadd read_t0s2a #x00000002) read_t1s2a)))
(assert (=> rf_10_9 (= (bvadd read_t1s2a #x00000000) read_t1s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_9 rf_6_9 rf_10_9))
(assert (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_9 (bvult co_0 co_0))
                    (and rf_6_9 (bvult co_6 co_0))
                    (and rf_10_9 (bvult co_10 co_0)))
                (bvult co_0 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_0_9 false) (and rf_6_9 false) (and rf_10_9 false)) false)))
(assert (not (and (or (and rf_0_9 false) (and rf_6_9 false) (and rf_10_9 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_9 (bvult co_0 co_6))
                    (and rf_6_9 (bvult co_6 co_6))
                    (and rf_10_9 (bvult co_10 co_6)))
                (bvult co_6 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_6_5 (bvult co_6 co_0))
                    (and rf_10_5 (bvult co_10 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false) (and rf_10_5 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_10))
                    (and rf_6_5 (bvult co_6 co_10))
                    (and rf_10_5 (bvult co_10 co_10)))
                (bvult co_10 co_6))))
  (not a!1)))
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
(assert (=> (or false false (bvult co_0 co_10) or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false (bvult co_0 co_10) or (and true false))
    (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false (bvult co_1 co_3) or (and true false))
    (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false rf_1_8 false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true rf_1_8)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true true false (and rf_1_2 false) (and rf_3_2 false) (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or true true false (and rf_1_2 false) (and rf_3_2 false) (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert (=> (or false false (bvult co_3 co_1) or (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert (=> (or false false (bvult co_3 co_3) or (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or true true false or (and false false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or true true false or (and false false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_10_5 (bvult co_10 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_10_5 (bvult co_10 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_10_5 (bvult co_10 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_10_5 (bvult co_10 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_6_5 (bvult co_6 co_10))
        (and rf_10_5 (bvult co_10 co_10)))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_6_5 (bvult co_6 co_10))
        (and rf_10_5 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_4)))
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
(assert (=> (or false false (bvult co_6 co_10) or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or false false (bvult co_6 co_10) or (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_3_7 (bvult co_3 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_3_7 (bvult co_3 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_3))
        (and rf_3_7 (bvult co_3 co_3)))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_3_8 (bvult co_3 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_3_8 (bvult co_3 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_3))
        (and rf_3_8 (bvult co_3 co_3)))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_6_9 (bvult co_6 co_0))
        (and rf_10_9 (bvult co_10 co_0)))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_6_9 (bvult co_6 co_0))
        (and rf_10_9 (bvult co_10 co_0))
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_10_9 (bvult co_10 co_6)))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_6))
        (and rf_6_9 (bvult co_6 co_6))
        (and rf_10_9 (bvult co_10 co_6))
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_6_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_10))
        (and rf_6_9 (bvult co_6 co_10))
        (and rf_10_9 (bvult co_10 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_10))
        (and rf_6_9 (bvult co_6 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or false false (bvult co_10 co_0) or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false (bvult co_10 co_0) or (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_4)))
(assert (=> (or false rf_10_5 false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true rf_10_5)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false (bvult co_10 co_6) or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false (bvult co_10 co_6) or (and true false))
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
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_6 #b10) (= final_x (bvadd read_t0s2a #x00000002))))
(assert (=> (= co_10 #b10) (= final_x (bvadd read_t1s2a #x00000000))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_3 #b01) (= final_y (bvadd read_t0s0a #x00000002))))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 false)
    (distinct rf_6_5 false)
    (distinct rf_10_5 true)
    (distinct rf_1_7 true)
    (distinct rf_3_7 false)
    (distinct rf_1_8 true)
    (distinct rf_3_8 false)
    (distinct rf_0_9 true)
    (distinct rf_6_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b10 co_6)
    (distinct #b01 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 false)
    (distinct rf_6_5 false)
    (distinct rf_10_5 true)
    (distinct rf_1_7 true)
    (distinct rf_3_7 false)
    (distinct rf_1_8 false)
    (distinct rf_3_8 true)
    (distinct rf_0_9 true)
    (distinct rf_6_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b10 co_6)
    (distinct #b01 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000002 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 false)
    (distinct rf_6_5 false)
    (distinct rf_10_5 true)
    (distinct rf_1_7 false)
    (distinct rf_3_7 true)
    (distinct rf_1_8 false)
    (distinct rf_3_8 true)
    (distinct rf_0_9 true)
    (distinct rf_6_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b10 co_6)
    (distinct #b01 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000002 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_10_5 false)
    (distinct rf_1_7 true)
    (distinct rf_3_7 false)
    (distinct rf_1_8 false)
    (distinct rf_3_8 true)
    (distinct rf_0_9 false)
    (distinct rf_6_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b10 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000002 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000002 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_10_5 false)
    (distinct rf_1_7 false)
    (distinct rf_3_7 true)
    (distinct rf_1_8 false)
    (distinct rf_3_8 true)
    (distinct rf_0_9 false)
    (distinct rf_6_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b10 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000002 read_t1s2a)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_10_5 false)
    (distinct rf_1_7 true)
    (distinct rf_3_7 false)
    (distinct rf_1_8 true)
    (distinct rf_3_8 false)
    (distinct rf_0_9 false)
    (distinct rf_6_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b10 co_10)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(model-add read_t0s0a () (_ BitVec 32) #x00000000)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_1_2 () Bool true)
(model-add rf_3_2 () Bool false)
(model-add rf_6_5 () Bool false)
(model-add input_b () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-del k!218)
(model-add topo_U_4
           ()
           (_ BitVec 4)
           (ite (or k!218 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!219)
(model-add topo_T_4
           ()
           (_ BitVec 4)
           (ite (or k!219 (= #xb #x0)) #xb (bvsub #xb #x1)))
(model-del k!220)
(model-add k!218 () Bool (not k!220))
(model-del k!221)
(model-add k!219 () Bool (not k!221))
(model-add rf_10_9 () Bool false)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_3_8 () Bool false)
(model-add co_10 () (_ BitVec 2) #b01)
(model-add rf_1_7 () Bool true)
(model-add topo_U_9 () (_ BitVec 4) #x1)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add rf_0_9 () Bool true)
(model-add topo_U_10 () (_ BitVec 4) #x2)
(model-add rf_0_5 () Bool false)
(model-add co_6 () (_ BitVec 2) #b10)
(model-add rf_10_5 () Bool true)
(model-add topo_T_5 () (_ BitVec 4) #x5)
(model-add rf_1_8 () Bool true)
(model-add topo_U_5 () (_ BitVec 4) #x3)
(model-add topo_U_3 () (_ BitVec 4) #x7)
(model-add topo_T_9 () (_ BitVec 4) #x3)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add read_t1s1a () (_ BitVec 32) #x00000000)
(model-add read_t0s2a () (_ BitVec 32) #x00000000)
(model-add topo_U_2 () (_ BitVec 4) #x2)
(model-add topo_T_6 () (_ BitVec 4) #x7)
(model-add topo_U_8 () (_ BitVec 4) #x6)
(model-add topo_T_7 () (_ BitVec 4) #x1)
(model-add k!221 () Bool true)
(model-add topo_T_8 () (_ BitVec 4) #x2)
(model-add co_3 () (_ BitVec 2) #b01)
(model-add topo_T_10 () (_ BitVec 4) #x4)
(model-add final_x () (_ BitVec 32) #x00000002)
(model-add topo_U_7 () (_ BitVec 4) #x4)
(model-add topo_T_2 () (_ BitVec 4) #x1)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_3 () (_ BitVec 4) #x3)
(model-add rf_6_9 () Bool false)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add read_t1s2a () (_ BitVec 32) #x00000000)
(model-add topo_U_6 () (_ BitVec 4) #x8)
(model-add k!220 () Bool true)
(model-add rf_3_7 () Bool false)

(check-sat)
