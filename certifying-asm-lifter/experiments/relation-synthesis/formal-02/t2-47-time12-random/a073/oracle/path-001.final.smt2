(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun input_b () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_8_2 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_7_3 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_8_5 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_4_6 () Bool)
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
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b false))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_7 #b11))
(assert (distinct co_0 co_4 co_7))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_8 #b10))
(assert (distinct co_1 co_8))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_8_2 (= #x00000001 read_t0s0a)))
(assert ((_ pbeq 1 1 1) rf_1_2 rf_8_2))
(assert (=> rf_0_3 (= #x00000000 read_t0s2a)))
(assert (=> rf_4_3
    (= (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)) read_t0s2a)))
(assert (=> rf_7_3
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_3 rf_4_3 rf_7_3))
(assert (=> rf_1_5 (= #x00000000 read_t1s0a)))
(assert (=> rf_8_5 (= #x00000001 read_t1s0a)))
(assert ((_ pbeq 1 1 1) rf_1_5 rf_8_5))
(assert (=> rf_0_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_4_6
    (= (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert (=> rf_7_6
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_6 rf_4_6 rf_7_6))
(assert (let ((a!1 (and (or (and rf_0_6 (bvult co_0 co_0))
                    (and rf_4_6 (bvult co_4 co_0))
                    (and rf_7_6 (bvult co_7 co_0)))
                (bvult co_0 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_0_6 false) (and rf_4_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_6 (bvult co_0 co_4))
                    (and rf_4_6 (bvult co_4 co_4))
                    (and rf_7_6 (bvult co_7 co_4)))
                (bvult co_4 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0))
                    (and rf_7_3 (bvult co_7 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false) (and rf_7_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_7))
                    (and rf_4_3 (bvult co_4 co_7))
                    (and rf_7_3 (bvult co_7 co_7)))
                (bvult co_7 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false) (and rf_7_3 false)) false)))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false (bvult co_0 co_7) or (and true false))
    (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false (bvult co_1 co_8) or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false (bvult co_1 co_8) or (and true false))
    (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_8_2 (bvult co_8 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_8_2 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_8_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_8_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_8))
        (and rf_8_2 (bvult co_8 co_8)))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_7_3 (bvult co_7 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_7_3 (bvult co_7 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_7_3 (bvult co_7 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_7_3 (bvult co_7 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_7))
        (and rf_4_3 (bvult co_4 co_7))
        (and rf_7_3 (bvult co_7 co_7)))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_7))
        (and rf_4_3 (bvult co_4 co_7))
        (and rf_7_3 (bvult co_7 co_7))
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
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
(assert (=> (or false rf_4_6 false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true rf_4_6)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false (bvult co_4 co_7) or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false (bvult co_4 co_7) or (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_8_5 (bvult co_8 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_8_5 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false (and rf_1_5 false) (and rf_8_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_8))
        (and rf_8_5 (bvult co_8 co_8)))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_8))
        (and rf_8_5 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_4_6 (bvult co_4 co_0))
        (and rf_7_6 (bvult co_7 co_0)))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_4_6 (bvult co_4 co_0))
        (and rf_7_6 (bvult co_7 co_0))
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_7_6 (bvult co_7 co_4)))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_7_6 (bvult co_7 co_4))
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_0_6 (bvult co_0 co_7))
        (and rf_4_6 (bvult co_4 co_7))
        (and rf_7_6 (bvult co_7 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_6 (bvult co_0 co_7))
        (and rf_4_6 (bvult co_4 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false (bvult co_7 co_0) or (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false rf_7_3 false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true rf_7_3)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false (bvult co_7 co_4) or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false (bvult co_7 co_4) or (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false rf_8_5 false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and false rf_8_5)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_4 #b10)
    (= final_x (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_7 #b10)
    (= final_x (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_8 #b01) (= #x00000001 final_y)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct rf_1_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_7_3 false)
    (distinct rf_1_5 true)
    (distinct rf_8_5 false)
    (distinct rf_0_6 false)
    (distinct rf_4_6 true)
    (distinct rf_7_6 false)
    (distinct #b00 co_0)
    (distinct #b01 co_4)
    (distinct #b10 co_7)
    (distinct #b00 co_1)
    (distinct #b01 co_8)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000002 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct rf_1_2 true)
    (distinct rf_8_2 false)
    (distinct rf_0_3 false)
    (distinct rf_4_3 false)
    (distinct rf_7_3 true)
    (distinct rf_1_5 true)
    (distinct rf_8_5 false)
    (distinct rf_0_6 true)
    (distinct rf_4_6 false)
    (distinct rf_7_6 false)
    (distinct #b00 co_0)
    (distinct #b10 co_4)
    (distinct #b01 co_7)
    (distinct #b00 co_1)
    (distinct #b01 co_8)))
(assert (or (distinct input_b false)
    (distinct #x00000001 read_t0s0a)
    (distinct #x00000002 read_t0s2a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000000 read_t1s1a)
    (distinct rf_1_2 false)
    (distinct rf_8_2 true)
    (distinct rf_0_3 false)
    (distinct rf_4_3 false)
    (distinct rf_7_3 true)
    (distinct rf_1_5 true)
    (distinct rf_8_5 false)
    (distinct rf_0_6 true)
    (distinct rf_4_6 false)
    (distinct rf_7_6 false)
    (distinct #b00 co_0)
    (distinct #b10 co_4)
    (distinct #b01 co_7)
    (distinct #b00 co_1)
    (distinct #b01 co_8)))
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add rf_7_6 () Bool false)
(model-add input_b () Bool false)
(model-add final_y () (_ BitVec 32) #x00000001)
(model-add co_8 () (_ BitVec 2) #b01)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_7_3 () Bool false)
(model-add rf_4_6 () Bool true)
(model-add topo_T_4 () (_ BitVec 4) #x3)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add read_t0s0a () (_ BitVec 32) #x00000000)
(model-add topo_T_5 () (_ BitVec 4) #x1)
(model-add topo_U_4 () (_ BitVec 4) #x3)
(model-add topo_U_5 () (_ BitVec 4) #x1)
(model-add topo_U_3 () (_ BitVec 4) #x2)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add read_t1s1a () (_ BitVec 32) #x00000002)
(model-add read_t0s2a () (_ BitVec 32) #x00000000)
(model-add rf_8_5 () Bool false)
(model-add topo_U_2 () (_ BitVec 4) #x1)
(model-add co_4 () (_ BitVec 2) #b01)
(model-add topo_U_8 () (_ BitVec 4) #x8)
(model-add rf_1_2 () Bool true)
(model-add topo_T_6 () (_ BitVec 4) #x4)
(model-add topo_T_7 () (_ BitVec 4) #x5)
(model-add topo_T_8 () (_ BitVec 4) #x8)
(model-add final_x () (_ BitVec 32) #x00000004)
(model-add rf_1_5 () Bool true)
(model-add rf_0_3 () Bool true)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add rf_0_6 () Bool false)
(model-add co_7 () (_ BitVec 2) #b10)
(model-add topo_U_7 () (_ BitVec 4) #x8)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_T_2 () (_ BitVec 4) #x1)
(model-add topo_T_3 () (_ BitVec 4) #x2)
(model-add topo_U_6 () (_ BitVec 4) #x4)
(model-add rf_8_2 () Bool false)

(check-sat)
