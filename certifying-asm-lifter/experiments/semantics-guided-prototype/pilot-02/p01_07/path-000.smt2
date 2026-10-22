(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_6_5 () Bool)
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
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_2 #b11))
(assert (bvult co_6 #b11))
(assert (distinct co_0 co_2 co_6))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_4 #b10))
(assert (distinct co_1 co_4))
(assert (=> rf_1_3 (= #x00000000 read_t1_a)))
(assert (=> rf_4_3 (= (bvadd read_t1_a #x00000001) read_t1_a)))
(assert ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert (=> rf_0_5 (= #x00000000 read_t1_b)))
(assert (=> rf_2_5 (= #x00000001 read_t1_b)))
(assert (=> rf_6_5 (= (bvadd read_t1_b #x00000002) read_t1_b)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_6_5))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_2_5 (bvult co_2 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_2))
                    (and rf_2_5 (bvult co_2 co_2))
                    (and rf_6_5 (bvult co_6 co_2)))
                (bvult co_2 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_4_3 (bvult co_4 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
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
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
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
(assert (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false (bvult co_2 co_0) or (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false (bvult co_2 co_6) or (and true false))
    (bvult topo_T_2 topo_T_6)))
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
        (and true false))
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
(assert (=> (or true
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false (and rf_1_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false (bvult co_4 co_1) or (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_6_5 (bvult co_6 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_6_5 (bvult co_6 co_2)))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_6_5 (bvult co_6 co_2))
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_2_5 (bvult co_2 co_6))
        (and rf_6_5 (bvult co_6 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_2_5 (bvult co_2 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false (bvult co_6 co_2) or (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_2 #b10) (= #x00000001 final_x)))
(assert (=> (= co_6 #b10) (= final_x (bvadd read_t1_b #x00000002))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_4 #b01) (= final_y (bvadd read_t1_a #x00000001))))

(check-sat)
