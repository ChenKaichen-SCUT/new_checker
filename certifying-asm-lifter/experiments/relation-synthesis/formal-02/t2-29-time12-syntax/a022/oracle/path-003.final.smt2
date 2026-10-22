(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun input_b () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun final_x () (_ BitVec 32))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun k!680 () Bool)
(declare-fun k!681 () Bool)
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun k!682 () Bool)
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun k!683 () Bool)
(declare-fun k!684 () Bool)
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_1_8 () Bool)
(declare-fun rf_5_8 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(assert (= input_b input_b))
(assert true)
(assert (= input_b false))
(assert (= input_b false))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_3 #b10))
(assert (distinct co_0 co_3))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_5 #b10))
(assert (distinct co_1 co_5))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000000) read_t0s0a)))
(assert ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_5_4 (= (bvadd read_t0s1a #x00000002) read_t0s1a)))
(assert ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert (=> rf_1_6 (= #x00000000 read_t1s0a)))
(assert (=> rf_5_6 (= (bvadd read_t0s1a #x00000002) read_t1s0a)))
(assert ((_ pbeq 1 1 1) rf_1_6 rf_5_6))
(assert (=> rf_1_8 (= #x00000000 read_t1s2b)))
(assert (=> rf_5_8 (= (bvadd read_t0s1a #x00000002) read_t1s2b)))
(assert ((_ pbeq 1 1 1) rf_1_8 rf_5_8))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_1))
                    (and rf_5_4 (bvult co_5 co_1)))
                (bvult co_1 co_5))))
  (not a!1)))
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
(assert (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false (bvult co_0 co_3) or (and true false))
    (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
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
(assert (=> (or false rf_1_8 false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true rf_1_8)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
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
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_8)))
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
(assert (=> (or false rf_5_8 false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true rf_5_8)) (bvult topo_T_5 topo_T_8)))
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
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or true false false (and rf_1_6 false) (and rf_5_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true true false (and rf_1_6 false) (and rf_5_6 false) (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_5_8 (bvult co_5 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_5_8 (bvult co_5 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_5))
        (and rf_5_8 (bvult co_5 co_5)))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_5_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_5_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_3 #b01) (= final_x (bvadd read_t0s0a #x00000000))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_5 #b01) (= final_y (bvadd read_t0s1a #x00000002))))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s2b)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_1_8 true)
    (distinct rf_5_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s2b)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 true)
    (distinct rf_5_6 false)
    (distinct rf_1_8 false)
    (distinct rf_5_8 true)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t1s0a)
    (distinct #x00000002 read_t1s2b)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_1_8 false)
    (distinct rf_5_8 true)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b00 co_1)
    (distinct #b01 co_5)))
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_1_4 () Bool true)
(model-add rf_5_4 () Bool false)
(model-add input_b () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add final_x () (_ BitVec 32) read_t0s0a)
(model-del k!680)
(model-add read_t0s0a
           ()
           (_ BitVec 32)
           (ite k!680 #x00000000 (bvnot #x00000000)))
(model-del k!681)
(model-add topo_U_7
           ()
           (_ BitVec 4)
           (ite (or k!681 (= #x9 #x0)) #x9 (bvsub #x9 #x1)))
(model-del k!682)
(model-add topo_T_7
           ()
           (_ BitVec 4)
           (ite (or k!682 (= #x9 #x0)) #x9 (bvsub #x9 #x1)))
(model-del k!683)
(model-add k!681 () Bool (not k!683))
(model-del k!684)
(model-add k!682 () Bool (not k!684))
(model-add k!680 () Bool true)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add topo_T_4 () (_ BitVec 4) #x5)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_T_5 () (_ BitVec 4) #x8)
(model-add read_t1s2b () (_ BitVec 32) #x00000000)
(model-add topo_U_4 () (_ BitVec 4) #x1)
(model-add rf_1_8 () Bool true)
(model-add topo_U_5 () (_ BitVec 4) #x5)
(model-add topo_U_3 () (_ BitVec 4) #x3)
(model-add k!683 () Bool true)
(model-add k!684 () Bool true)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add rf_5_8 () Bool false)
(model-add topo_U_2 () (_ BitVec 4) #x2)
(model-add topo_T_6 () (_ BitVec 4) #x2)
(model-add topo_U_8 () (_ BitVec 4) #x4)
(model-add rf_0_2 () Bool true)
(model-add topo_T_8 () (_ BitVec 4) #x3)
(model-add co_3 () (_ BitVec 2) #b01)
(model-add rf_1_6 () Bool true)
(model-add co_5 () (_ BitVec 2) #b01)
(model-add topo_T_2 () (_ BitVec 4) #x1)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add rf_5_6 () Bool false)
(model-add topo_T_3 () (_ BitVec 4) #x4)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_U_6 () (_ BitVec 4) #x1)
(model-add rf_3_2 () Bool false)

(check-sat)
