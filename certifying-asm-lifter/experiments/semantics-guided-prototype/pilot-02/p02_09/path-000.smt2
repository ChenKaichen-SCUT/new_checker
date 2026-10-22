(declare-fun input_b () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
(assert (= (= #x00000000 read_t1_a) true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_3 #b11))
(assert (bvult co_6 #b11))
(assert (distinct co_0 co_3 co_6))
(assert (bvult co_1 #b1))
(assert (= co_1 #b0))
(assert (distinct co_1))
(assert (=> rf_0_2 (= #x00000000 read_t0_a)))
(assert (=> rf_3_2 (= (bvadd read_t0_a #x00000001) read_t0_a)))
(assert (=> rf_6_2 (= (bvadd read_t1_yes #x00000001) read_t0_a)))
(assert ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_6_2))
(assert (=> rf_1_4 (= #x00000000 read_t1_a)))
(assert ((_ pbeq 1 1) rf_1_4))
(assert (=> rf_0_5 (= #x00000000 read_t1_yes)))
(assert (=> rf_3_5 (= (bvadd read_t0_a #x00000001) read_t1_yes)))
(assert (=> rf_6_5 (= (bvadd read_t1_yes #x00000001) read_t1_yes)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_3_5 rf_6_5))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0))
                    (and rf_6_2 (bvult co_6 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_6))
                    (and rf_3_2 (bvult co_3 co_6))
                    (and rf_6_2 (bvult co_6 co_6)))
                (bvult co_6 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_3_5 (bvult co_3 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_3))
                    (and rf_3_5 (bvult co_3 co_3))
                    (and rf_6_5 (bvult co_6 co_3)))
                (bvult co_3 co_6))))
  (not a!1)))
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
(assert (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false (bvult co_0 co_3) or (and true false))
    (bvult topo_T_0 topo_T_3)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_6_2 (bvult co_6 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_6_2 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_6_2 (bvult co_6 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_6_2 (bvult co_6 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_3_2 (bvult co_3 co_6))
        (and rf_6_2 (bvult co_6 co_6)))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_6))
        (and rf_3_2 (bvult co_3 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and true false))
    (bvult topo_T_2 topo_T_6)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false (bvult co_3 co_6) or (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false (and rf_1_4 false) (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false (and rf_1_4 (bvult co_1 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false (and rf_1_4 (bvult co_1 co_1)) (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false (and rf_1_4 false) (and true false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false (and rf_1_4 false) (and true false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false false (and rf_1_4 false) (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false (and rf_1_4 false) (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false (and rf_1_4 false)) (bvult topo_U_4 topo_U_6)))
(assert (=> (or true false false (and rf_1_4 false) (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_3_5 (bvult co_3 co_0))
        (and rf_6_5 (bvult co_6 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_3_5 (bvult co_3 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_6_5 (bvult co_6 co_3)))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_6_5 (bvult co_6 co_3))
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_3_5 (bvult co_3 co_6))
        (and rf_6_5 (bvult co_6 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_3_5 (bvult co_3 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false (bvult co_6 co_3) or (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_3 #b10) (= final_x (bvadd read_t0_a #x00000001))))
(assert (=> (= co_6 #b10) (= final_x (bvadd read_t1_yes #x00000001))))
(assert (=> (= co_1 #b0) (= #x00000000 final_y)))

(check-sat)
