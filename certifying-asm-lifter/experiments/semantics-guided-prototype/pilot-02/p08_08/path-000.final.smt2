(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_3_2 () Bool)
(declare-fun input_b () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_1_2 () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun final_x () (_ BitVec 32))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_3_7 () Bool)
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
(assert (= input_b true))
(assert (= input_b true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_6 #b10))
(assert (distinct co_0 co_6))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_3 #b10))
(assert (distinct co_1 co_3))
(assert (=> rf_1_2 (= #x00000000 read_t0_yes)))
(assert (=> rf_3_2 (= (bvadd read_t0_yes #x00000001) read_t0_yes)))
(assert ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert (=> rf_0_4 (= #x00000000 read_t0_b)))
(assert (=> rf_6_4 (= (bvadd read_t1_yes #x00000001) read_t0_b)))
(assert ((_ pbeq 1 1 1) rf_0_4 rf_6_4))
(assert (=> rf_0_5 (= #x00000000 read_t1_yes)))
(assert (=> rf_6_5 (= (bvadd read_t1_yes #x00000001) read_t1_yes)))
(assert ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert (=> rf_1_7 (= #x00000000 read_t1_b)))
(assert (=> rf_3_7 (= (bvadd read_t0_yes #x00000001) read_t1_b)))
(assert ((_ pbeq 1 1 1) rf_1_7 rf_3_7))
(assert (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
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
(assert (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
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
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false (and rf_1_2 false) (and rf_3_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and true false))
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
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_6_4 (bvult co_6 co_0)))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_6_4 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_6))
        (and rf_6_4 (bvult co_6 co_6)))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false (and rf_0_4 false) (and rf_6_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_6_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
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
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
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
        (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_1_7 false) (and rf_3_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and false false))
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
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_6 #b01) (= final_x (bvadd read_t1_yes #x00000001))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_3 #b01) (= final_y (bvadd read_t0_yes #x00000001))))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0_yes)
    (distinct #x00000001 read_t0_b)
    (distinct #x00000000 read_t1_yes)
    (distinct #x00000000 read_t1_b)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_4 false)
    (distinct rf_6_4 true)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 true)
    (distinct rf_3_7 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0_yes)
    (distinct #x00000000 read_t0_b)
    (distinct #x00000000 read_t1_yes)
    (distinct #x00000001 read_t1_b)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_4 true)
    (distinct rf_6_4 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 false)
    (distinct rf_3_7 true)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0_yes)
    (distinct #x00000001 read_t0_b)
    (distinct #x00000000 read_t1_yes)
    (distinct #x00000001 read_t1_b)
    (distinct rf_1_2 true)
    (distinct rf_3_2 false)
    (distinct rf_0_4 false)
    (distinct rf_6_4 true)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 false)
    (distinct rf_3_7 true)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_3)))
(model-add read_t1_yes () (_ BitVec 32) #x00000000)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_3_2 () Bool false)
(model-add input_b () Bool true)
(model-add rf_6_5 () Bool false)
(model-add read_t0_yes () (_ BitVec 32) #x00000000)
(model-add rf_0_5 () Bool true)
(model-add rf_1_2 () Bool true)
(model-add final_y () (_ BitVec 32) #x00000001)
(model-add final_x () (_ BitVec 32) #x00000001)
(model-add topo_T_7 () (_ BitVec 4) #x4)
(model-add co_3 () (_ BitVec 2) #b01)
(model-add read_t0_b () (_ BitVec 32) #x00000001)
(model-add topo_T_4 () (_ BitVec 4) #x6)
(model-add rf_1_7 () Bool true)
(model-add topo_U_7 () (_ BitVec 4) #x4)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add rf_6_4 () Bool true)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add co_6 () (_ BitVec 2) #b01)
(model-add rf_0_4 () Bool false)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_T_2 () (_ BitVec 4) #x4)
(model-add topo_U_4 () (_ BitVec 4) #x5)
(model-add topo_U_5 () (_ BitVec 4) #x1)
(model-add topo_T_3 () (_ BitVec 4) #x5)
(model-add topo_U_3 () (_ BitVec 4) #x5)
(model-add topo_U_6 () (_ BitVec 4) #x4)
(model-add read_t1_b () (_ BitVec 32) #x00000000)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add topo_T_5 () (_ BitVec 4) #x2)
(model-add rf_3_7 () Bool false)
(model-add topo_U_2 () (_ BitVec 4) #x4)
(model-add topo_T_6 () (_ BitVec 4) #x3)

(check-sat)
