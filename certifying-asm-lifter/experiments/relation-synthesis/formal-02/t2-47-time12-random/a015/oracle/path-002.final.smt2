(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun final_x () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun k!388 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun k!389 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!390 () Bool)
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun k!391 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!392 () Bool)
(declare-fun k!393 () Bool)
(declare-fun k!394 () Bool)
(declare-fun k!395 () Bool)
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun rf_7_3 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun rf_7_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_7_5 () Bool)
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) false))
(assert (= input_b true))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_6 #b11))
(assert (bvult co_7 #b11))
(assert (distinct co_1 co_6 co_7))
(assert (=> rf_1_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_6_3 (= (bvadd read_t1s1a #x00000000) read_t0s1a)))
(assert (=> rf_7_3 (= #x00000000 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_3 rf_6_3 rf_7_3))
(assert (=> rf_1_4 (= #x00000000 read_t1s0a)))
(assert (=> rf_6_4 (= (bvadd read_t1s1a #x00000000) read_t1s0a)))
(assert (=> rf_7_4 (= #x00000000 read_t1s0a)))
(assert ((_ pbeq 1 1 1 1) rf_1_4 rf_6_4 rf_7_4))
(assert (=> rf_1_5 (= #x00000000 read_t1s1a)))
(assert (=> rf_6_5 (= (bvadd read_t1s1a #x00000000) read_t1s1a)))
(assert (=> rf_7_5 (= #x00000000 read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_5 rf_6_5 rf_7_5))
(assert (not (and (or (and rf_1_5 false) (and rf_6_5 false) (and rf_7_5 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_1))
                    (and rf_6_5 (bvult co_6 co_1))
                    (and rf_7_5 (bvult co_7 co_1)))
                (bvult co_1 co_6))))
  (not a!1)))
(assert (bvult topo_U_0 #x8))
(assert (bvult topo_U_1 #x8))
(assert (bvult topo_U_2 #x8))
(assert (bvult topo_U_3 #x8))
(assert (bvult topo_U_4 #x8))
(assert (bvult topo_U_5 #x8))
(assert (bvult topo_U_6 #x8))
(assert (bvult topo_U_7 #x8))
(assert (bvult topo_T_0 #x8))
(assert (bvult topo_T_1 #x8))
(assert (bvult topo_T_2 #x8))
(assert (bvult topo_T_3 #x8))
(assert (bvult topo_T_4 #x8))
(assert (bvult topo_T_5 #x8))
(assert (bvult topo_T_6 #x8))
(assert (bvult topo_T_7 #x8))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false (bvult co_1 co_6) or (and true false))
    (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false (bvult co_1 co_7) or (and true false))
    (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_6_3 (bvult co_6 co_1))
        (and rf_7_3 (bvult co_7 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_6_3 (bvult co_6 co_1))
        (and rf_7_3 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_6_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_7_3 (bvult co_7 co_6)))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_7_3 (bvult co_7 co_6))
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_7))
        (and rf_6_3 (bvult co_6 co_7))
        (and rf_7_3 (bvult co_7 co_7)))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_7))
        (and rf_6_3 (bvult co_6 co_7))
        (and rf_7_3 (bvult co_7 co_7))
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_7_4 (bvult co_7 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_7_4 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_6_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_7_4 (bvult co_7 co_6)))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_7_4 (bvult co_7 co_6))
        (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_6_4 (bvult co_6 co_7))
        (and rf_7_4 (bvult co_7 co_7)))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_6_4 (bvult co_6 co_7))
        (and rf_7_4 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_7_5 (bvult co_7 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_7_5 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_6_5 false)
        (and rf_7_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_7_5 (bvult co_7 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_7_5 (bvult co_7 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_7))
        (and rf_6_5 (bvult co_6 co_7))
        (and rf_7_5 (bvult co_7 co_7)))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_7))
        (and rf_6_5 (bvult co_6 co_7))
        (and rf_7_5 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false (bvult co_6 co_1) or (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true false (bvult co_6 co_7) or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false (bvult co_6 co_7) or (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false rf_7_3 false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true rf_7_3)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and false rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false rf_7_5 false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and false rf_7_5)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false (bvult co_7 co_6) or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false (bvult co_7 co_6) or (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_6 #b10) (= final_y (bvadd read_t1s1a #x00000000))))
(assert (=> (= co_7 #b10) (= #x00000000 final_y)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct rf_1_3 true)
    (distinct rf_6_3 false)
    (distinct rf_7_3 false)
    (distinct rf_1_4 true)
    (distinct rf_6_4 false)
    (distinct rf_7_4 false)
    (distinct rf_1_5 true)
    (distinct rf_6_5 false)
    (distinct rf_7_5 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct rf_1_3 false)
    (distinct rf_6_3 false)
    (distinct rf_7_3 true)
    (distinct rf_1_4 true)
    (distinct rf_6_4 false)
    (distinct rf_7_4 false)
    (distinct rf_1_5 true)
    (distinct rf_6_5 false)
    (distinct rf_7_5 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct rf_1_3 false)
    (distinct rf_6_3 true)
    (distinct rf_7_3 false)
    (distinct rf_1_4 true)
    (distinct rf_6_4 false)
    (distinct rf_7_4 false)
    (distinct rf_1_5 true)
    (distinct rf_6_5 false)
    (distinct rf_7_5 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_7)))
(model-add co_0 () (_ BitVec 1) #b0)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add final_x () (_ BitVec 32) #x00000000)
(model-add input_b () Bool true)
(model-del k!388)
(model-add topo_U_0
           ()
           (_ BitVec 4)
           (ite (or k!388 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!389)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!389 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!390)
(model-add topo_T_0
           ()
           (_ BitVec 4)
           (ite (or k!390 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!391)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!391 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!392)
(model-add k!388 () Bool (not k!392))
(model-del k!393)
(model-add k!389 () Bool (not k!393))
(model-del k!394)
(model-add k!390 () Bool (not k!394))
(model-del k!395)
(model-add k!391 () Bool (not k!395))
(model-add rf_1_4 () Bool true)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_7_3 () Bool false)
(model-add topo_T_4 () (_ BitVec 4) #x2)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add rf_6_4 () Bool false)
(model-add topo_T_5 () (_ BitVec 4) #x5)
(model-add co_6 () (_ BitVec 2) #b01)
(model-add k!395 () Bool true)
(model-add topo_U_4 () (_ BitVec 4) #x2)
(model-add topo_U_5 () (_ BitVec 4) #x3)
(model-add topo_U_3 () (_ BitVec 4) #x1)
(model-add rf_1_3 () Bool true)
(model-add rf_7_4 () Bool false)
(model-add read_t1s1a () (_ BitVec 32) #x00000000)
(model-add rf_6_3 () Bool false)
(model-add topo_T_6 () (_ BitVec 4) #x6)
(model-add topo_T_7 () (_ BitVec 4) #x7)
(model-add k!394 () Bool true)
(model-add rf_1_5 () Bool true)
(model-add rf_6_5 () Bool false)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add co_7 () (_ BitVec 2) #b10)
(model-add topo_U_7 () (_ BitVec 4) #x6)
(model-add topo_T_3 () (_ BitVec 4) #x3)
(model-add final_y () (_ BitVec 32) #x00000000)
(model-add topo_U_6 () (_ BitVec 4) #x4)
(model-add rf_7_5 () Bool false)
(model-add k!392 () Bool true)
(model-add k!393 () Bool true)

(check-sat)
