(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_7_5 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_7_6 () Bool)
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
(assert (= (not input_b) false))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_4 #b10))
(assert (distinct co_0 co_4))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_7 #b10))
(assert (distinct co_1 co_7))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_7_2 (= (bvadd read_t1s2b #x00000002) read_t0s0a)))
(assert ((_ pbeq 1 1 1) rf_1_2 rf_7_2))
(assert (=> rf_0_3 (= #x00000000 read_t0s2a)))
(assert (=> rf_4_3
    (= (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)) read_t0s2a)))
(assert ((_ pbeq 1 1 1) rf_0_3 rf_4_3))
(assert (=> rf_1_5 (= #x00000000 read_t1s1a)))
(assert (=> rf_7_5 (= (bvadd read_t1s2b #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_1_5 rf_7_5))
(assert (=> rf_1_6 (= #x00000000 read_t1s2b)))
(assert (=> rf_7_6 (= (bvadd read_t1s2b #x00000002) read_t1s2b)))
(assert ((_ pbeq 1 1 1) rf_1_6 rf_7_6))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_7_6 (bvult co_7 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
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
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
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
(assert (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false (bvult co_1 co_7) or (and true false))
    (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_7_2 (bvult co_7 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_7_2 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_7_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_7_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_7))
        (and rf_7_2 (bvult co_7 co_7)))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_7))
        (and rf_7_2 (bvult co_7 co_7))
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
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
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_7_5 (bvult co_7 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_7_5 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true false false (and rf_1_5 false) (and rf_7_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 false)
        (and rf_7_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_7))
        (and rf_7_5 (bvult co_7 co_7)))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_7))
        (and rf_7_5 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_7_6 (bvult co_7 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_7_6 (bvult co_7 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false rf_7_5 false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and false rf_7_5)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_4 #b01)
    (= final_x (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_7 #b01) (= final_y (bvadd read_t1s2b #x00000002))))

(check-sat)
