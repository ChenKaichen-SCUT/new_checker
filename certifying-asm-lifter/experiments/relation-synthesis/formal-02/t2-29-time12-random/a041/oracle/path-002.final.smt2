(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0s2b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_7_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b false))
(assert (= input_b true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_5 #b11))
(assert (bvult co_6 #b11))
(assert (distinct co_0 co_5 co_6))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_7 #b10))
(assert (distinct co_1 co_7))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_5_2 (= #x00000001 read_t0s0a)))
(assert (=> rf_6_2 (= #x00000000 read_t0s0a)))
(assert ((_ pbeq 1 1 1 1) rf_0_2 rf_5_2 rf_6_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s2b)))
(assert (=> rf_7_4 (= #x00000002 read_t0s2b)))
(assert ((_ pbeq 1 1 1) rf_1_4 rf_7_4))
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
(assert (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false (bvult co_0 co_5) or (and true false))
    (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false (bvult co_1 co_7) or (and true false))
    (bvult topo_T_1 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_5_2 (bvult co_5 co_0))
        (and rf_6_2 (bvult co_6 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_5_2 (bvult co_5 co_0))
        (and rf_6_2 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        true
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_6_2 (bvult co_6 co_5)))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_6_2 (bvult co_6 co_5))
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_5_2 (bvult co_5 co_6))
        (and rf_6_2 (bvult co_6 co_6)))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_5_2 (bvult co_5 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_5_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_7_4 (bvult co_7 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_7_4 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_7_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_7_4 (bvult co_7 co_7)))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_7_4 (bvult co_7 co_7))
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false (bvult co_5 co_0) or (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true false (bvult co_5 co_6) or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or true false (bvult co_5 co_6) or (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false (bvult co_6 co_5) or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false (bvult co_6 co_5) or (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_5 #b10) (= #x00000001 final_x)))
(assert (=> (= co_6 #b10) (= #x00000000 final_x)))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_7 #b01) (= #x00000002 final_y)))

(check-sat)
