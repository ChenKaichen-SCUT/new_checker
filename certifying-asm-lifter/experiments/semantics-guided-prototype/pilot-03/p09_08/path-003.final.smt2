(declare-fun rf_6_2 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_0_2 () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun final_x () (_ BitVec 32))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_4_7 () Bool)
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
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0_a) false))
(assert (= input_b false))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_6 #b10))
(assert (distinct co_0 co_6))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_4 #b10))
(assert (distinct co_1 co_4))
(assert (=> rf_0_2 (= #x00000000 read_t0_a)))
(assert (=> rf_6_2 (= (bvadd read_t1_no #x00000002) read_t0_a)))
(assert ((_ pbeq 1 1 1) rf_0_2 rf_6_2))
(assert (=> rf_1_3 (= #x00000000 read_t0_no)))
(assert (=> rf_4_3 (= (bvadd read_t0_no #x00000002) read_t0_no)))
(assert ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert (=> rf_0_5 (= #x00000000 read_t1_no)))
(assert (=> rf_6_5 (= (bvadd read_t1_no #x00000002) read_t1_no)))
(assert ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert (=> rf_1_7 (= #x00000000 read_t1_b)))
(assert (=> rf_4_7 (= (bvadd read_t0_no #x00000002) read_t1_b)))
(assert ((_ pbeq 1 1 1) rf_1_7 rf_4_7))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_4_3 (bvult co_4 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
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
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
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
(assert (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false (bvult co_1 co_4) or (and true false))
    (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_6_2 (bvult co_6 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_6_2 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_6_2 (bvult co_6 co_6)))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false (and rf_0_2 false) (and rf_6_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false rf_4_7 false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true rf_4_7)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_6_5 (bvult co_6 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_6_5 (bvult co_6 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
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
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_4_7 (bvult co_4 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_4_7 (bvult co_4 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_4_7 (bvult co_4 co_4)))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_4_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_6 #b01) (= final_x (bvadd read_t1_no #x00000002))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_4 #b01) (= final_y (bvadd read_t0_no #x00000002))))
(assert (or (distinct input_b false)
    (distinct #x00000002 read_t0_a)
    (distinct #x00000000 read_t0_no)
    (distinct #x00000000 read_t1_no)
    (distinct #x00000000 read_t1_b)
    (distinct rf_0_2 false)
    (distinct rf_6_2 true)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 true)
    (distinct rf_4_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_4)))
(assert (or (distinct input_b false)
    (distinct #x00000002 read_t0_a)
    (distinct #x00000000 read_t0_no)
    (distinct #x00000000 read_t1_no)
    (distinct #x00000002 read_t1_b)
    (distinct rf_0_2 false)
    (distinct rf_6_2 true)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 false)
    (distinct rf_4_7 true)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_4)))
(model-add rf_6_2 () Bool true)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add read_t0_a () (_ BitVec 32) #x00000002)
(model-add rf_4_3 () Bool false)
(model-add rf_1_3 () Bool true)
(model-add read_t1_no () (_ BitVec 32) #x00000000)
(model-add input_b () Bool false)
(model-add rf_6_5 () Bool false)
(model-add read_t0_no () (_ BitVec 32) #x00000000)
(model-add rf_0_5 () Bool true)
(model-add rf_0_2 () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add final_x () (_ BitVec 32) #x00000002)
(model-add topo_T_7 () (_ BitVec 4) #x6)
(model-add topo_T_4 () (_ BitVec 4) #x7)
(model-add rf_1_7 () Bool true)
(model-add topo_U_7 () (_ BitVec 4) #x4)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_T_2 () (_ BitVec 4) #x5)
(model-add co_6 () (_ BitVec 2) #b01)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_T_3 () (_ BitVec 4) #x6)
(model-add topo_T_5 () (_ BitVec 4) #x1)
(model-add topo_U_4 () (_ BitVec 4) #x5)
(model-add topo_U_5 () (_ BitVec 4) #x1)
(model-add topo_U_3 () (_ BitVec 4) #x4)
(model-add rf_4_7 () Bool false)
(model-add read_t1_b () (_ BitVec 32) #x00000000)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add topo_U_6 () (_ BitVec 4) #x2)
(model-add topo_U_2 () (_ BitVec 4) #x3)
(model-add co_4 () (_ BitVec 2) #b01)
(model-add topo_T_6 () (_ BitVec 4) #x4)

(check-sat)
