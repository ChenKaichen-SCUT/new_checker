(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_5_3 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (= (= #x00000000 #x00000000) true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_2 #b10))
(assert (distinct co_0 co_2))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_5 #b11))
(assert (distinct co_1 co_4 co_5))
(assert (=> rf_1_3 (= #x00000000 read_t0s2a)))
(assert (=> rf_4_3 (= (ite input_b #x00000001 #x00000002) read_t0s2a)))
(assert (=> rf_5_3 (= #x00000000 read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_5_3))
(assert (=> rf_0_6 (= #x00000000 read_t1s2a)))
(assert (=> rf_2_6 (= (ite input_b #x00000001 #x00000002) read_t1s2a)))
(assert ((_ pbeq 1 1 1) rf_0_6 rf_2_6))
(assert (bvult topo_U_0 #b111))
(assert (bvult topo_U_1 #b111))
(assert (bvult topo_U_2 #b111))
(assert (bvult topo_U_3 #b111))
(assert (bvult topo_U_4 #b111))
(assert (bvult topo_U_5 #b111))
(assert (bvult topo_U_6 #b111))
(assert (bvult topo_T_0 #b111))
(assert (bvult topo_T_1 #b111))
(assert (bvult topo_T_2 #b111))
(assert (bvult topo_T_3 #b111))
(assert (bvult topo_T_4 #b111))
(assert (bvult topo_T_5 #b111))
(assert (bvult topo_T_6 #b111))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false (bvult co_0 co_2) or (and true false))
    (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
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
(assert (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false (bvult co_1 co_5) or (and true false))
    (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false (bvult co_2 co_0) or (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_5_3 (bvult co_5 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_5_3 (bvult co_5 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_5_3 (bvult co_5 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_5_3 (bvult co_5 co_4))
        (and true false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_5))
        (and rf_4_3 (bvult co_4 co_5))
        (and rf_5_3 (bvult co_5 co_5)))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_5))
        (and rf_4_3 (bvult co_4 co_5))
        (and rf_5_3 (bvult co_5 co_5))
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false (bvult co_4 co_1) or (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false (bvult co_4 co_5) or (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false (bvult co_5 co_1) or (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false (bvult co_5 co_4) or (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_2_6 (bvult co_2 co_0)))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_2_6 (bvult co_2 co_0))
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_2_6 false))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_2_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_2))
        (and rf_2_6 (bvult co_2 co_2)))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_2_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_2_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_2_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_2_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_2_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_2_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_2_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_2_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_2 #b01) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_4 #b10) (= final_y (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_5 #b10) (= #x00000000 final_y)))

(check-sat)
