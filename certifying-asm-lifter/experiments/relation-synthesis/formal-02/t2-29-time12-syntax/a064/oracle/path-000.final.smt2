(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun final_x () (_ BitVec 32))
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_8_2 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_8_3 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) true))
(assert (= (= #x00000000 #x00000000) true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_8 #b10))
(assert (distinct co_0 co_8))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_5 #b10))
(assert (distinct co_1 co_5))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_8_2 (= (bvadd read_t1s2a #x00000000) read_t0s0a)))
(assert ((_ pbeq 1 1 1) rf_0_2 rf_8_2))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_8_3 (= (bvadd read_t1s2a #x00000000) read_t0s1a)))
(assert ((_ pbeq 1 1 1) rf_0_3 rf_8_3))
(assert (=> rf_1_4 (= #x00000000 read_t0s2a)))
(assert (=> rf_5_4 (= (bvadd read_t0s2a #x00000000) read_t0s2a)))
(assert ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert (=> rf_1_6 (= #x00000000 read_t1s0a)))
(assert (=> rf_5_6 (= (bvadd read_t0s2a #x00000000) read_t1s0a)))
(assert ((_ pbeq 1 1 1) rf_1_6 rf_5_6))
(assert (=> rf_0_7 (= #x00000000 read_t1s2a)))
(assert (=> rf_8_7 (= (bvadd read_t1s2a #x00000000) read_t1s2a)))
(assert ((_ pbeq 1 1 1) rf_0_7 rf_8_7))
(assert (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_1))
                    (and rf_5_4 (bvult co_5 co_1)))
                (bvult co_1 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_7 (bvult co_0 co_0))
                    (and rf_8_7 (bvult co_8 co_0)))
                (bvult co_0 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert (bvult topo_U_0 #x9))
(assert (bvult topo_U_1 #x9))
(assert (bvult topo_U_2 #x9))
(assert (bvult topo_U_3 #x9))
(assert (bvult topo_U_4 #x9))
(assert (bvult topo_U_5 #x9))
(assert (bvult topo_U_6 #x9))
(assert (bvult topo_U_7 #x9))
(assert (bvult topo_U_8 #x9))
(assert (bvult topo_T_0 #x9))
(assert (bvult topo_T_1 #x9))
(assert (bvult topo_T_2 #x9))
(assert (bvult topo_T_3 #x9))
(assert (bvult topo_T_4 #x9))
(assert (bvult topo_T_5 #x9))
(assert (bvult topo_T_6 #x9))
(assert (bvult topo_T_7 #x9))
(assert (bvult topo_T_8 #x9))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
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
(assert (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false (bvult co_1 co_5) or (and true false))
    (bvult topo_T_1 topo_T_5)))
(assert (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_8_2 (bvult co_8 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_8_2 (bvult co_8 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_8))
        (and rf_8_2 (bvult co_8 co_8)))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_8_3 (bvult co_8 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_8_3 (bvult co_8 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_8_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_8))
        (and rf_8_3 (bvult co_8 co_8)))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_8))
        (and rf_8_3 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false (and rf_1_4 false) (and rf_5_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false (bvult co_5 co_1) or (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and true rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5)))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
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
(assert (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false (bvult co_8 co_0) or (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_1)))
(assert (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false rf_8_3 false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true rf_8_3)) (bvult topo_T_8 topo_T_3)))
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
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_8 #b01) (= final_x (bvadd read_t1s2a #x00000000))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_5 #b01) (= final_y (bvadd read_t0s2a #x00000000))))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 false)
    (distinct rf_8_3 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 false)
    (distinct rf_8_3 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 false)
    (distinct rf_8_2 true)
    (distinct rf_0_3 false)
    (distinct rf_8_3 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 false)
    (distinct rf_8_2 true)
    (distinct rf_0_3 false)
    (distinct rf_8_3 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 true)
    (distinct rf_8_3 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 true)
    (distinct rf_8_3 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 true)
    (distinct rf_8_3 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2a)
    (distinct rf_0_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 true)
    (distinct rf_8_3 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_0_7 true)
    (distinct rf_8_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_8)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add final_y () (_ BitVec 32) read_t0s2a)
(model-add final_x () (_ BitVec 32) read_t1s2a)
(model-add rf_1_4 () Bool true)
(model-add co_8 () (_ BitVec 2) #b01)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_0_7 () Bool true)
(model-add topo_T_4 () (_ BitVec 4) #x6)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add read_t0s0a () (_ BitVec 32) #x00000000)
(model-add topo_T_5 () (_ BitVec 4) #x7)
(model-add topo_U_4 () (_ BitVec 4) #x1)
(model-add topo_U_5 () (_ BitVec 4) #x5)
(model-add topo_U_3 () (_ BitVec 4) #x6)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add rf_8_3 () Bool true)
(model-add read_t0s2a () (_ BitVec 32) #x00000000)
(model-add topo_U_2 () (_ BitVec 4) #x1)
(model-add rf_8_7 () Bool false)
(model-add rf_0_2 () Bool true)
(model-add topo_U_8 () (_ BitVec 4) #x3)
(model-add rf_5_4 () Bool false)
(model-add topo_T_6 () (_ BitVec 4) #x2)
(model-add topo_T_7 () (_ BitVec 4) #x3)
(model-add co_5 () (_ BitVec 2) #b01)
(model-add rf_1_6 () Bool true)
(model-add topo_T_8 () (_ BitVec 4) #x4)
(model-add topo_U_7 () (_ BitVec 4) #x1)
(model-add rf_0_3 () Bool false)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_2 () (_ BitVec 4) #x2)
(model-add rf_5_6 () Bool false)
(model-add topo_T_3 () (_ BitVec 4) #x5)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add read_t1s2a () (_ BitVec 32) #x00000000)
(model-add topo_U_6 () (_ BitVec 4) #x4)
(model-add rf_8_2 () Bool false)

(check-sat)
