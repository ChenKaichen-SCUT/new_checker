(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_7_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
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
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_3 #b10))
(assert (distinct co_0 co_3))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_5 #b11))
(assert (bvult co_7 #b11))
(assert (distinct co_1 co_5 co_7))
(assert (=> rf_0_2 (= #x00000000 read_t0_a)))
(assert (=> rf_3_2 (= (bvadd read_t0_a #x00000001) read_t0_a)))
(assert ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert (=> rf_1_4 (= #x00000000 read_t0_b)))
(assert (=> rf_5_4 (= (bvadd read_t0_b #x00000002) read_t0_b)))
(assert (=> rf_7_4 (= (bvadd read_t1_a #x00000001) read_t0_b)))
(assert ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_7_4))
(assert (=> rf_1_6 (= #x00000000 read_t1_a)))
(assert (=> rf_5_6 (= (bvadd read_t0_b #x00000002) read_t1_a)))
(assert (=> rf_7_6 (= (bvadd read_t1_a #x00000001) read_t1_a)))
(assert ((_ pbeq 1 1 1 1) rf_1_6 rf_5_6 rf_7_6))
(assert (=> rf_0_8 (= #x00000000 read_t1_b)))
(assert (=> rf_3_8 (= (bvadd read_t0_a #x00000001) read_t1_b)))
(assert ((_ pbeq 1 1 1) rf_0_8 rf_3_8))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert (not (and (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_5_6 (bvult co_5 co_1))
                    (and rf_7_6 (bvult co_7 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_5))
                    (and rf_5_6 (bvult co_5 co_5))
                    (and rf_7_6 (bvult co_7 co_5)))
                (bvult co_5 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_1))
                    (and rf_5_4 (bvult co_5 co_1))
                    (and rf_7_4 (bvult co_7 co_1)))
                (bvult co_1 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_7))
                    (and rf_5_4 (bvult co_5 co_7))
                    (and rf_7_4 (bvult co_7 co_7)))
                (bvult co_7 co_5))))
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
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
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
(assert (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false (bvult co_1 co_7) or (and true false))
    (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
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
(assert (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_7_4 (bvult co_7 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_7_4 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_7_4 (bvult co_7 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_7_4 (bvult co_7 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_5_4 (bvult co_5 co_7))
        (and rf_7_4 (bvult co_7 co_7)))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_5_4 (bvult co_5 co_7))
        (and rf_7_4 (bvult co_7 co_7))
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
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
(assert (=> (or false false (bvult co_5 co_7) or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false (bvult co_5 co_7) or (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_7_6 (bvult co_7 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_7_6 (bvult co_7 co_5)))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_7_6 (bvult co_7 co_5))
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_5_6 (bvult co_5 co_7))
        (and rf_7_6 (bvult co_7 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_5_6 (bvult co_5 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
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
(assert (=> (or false false (bvult co_7 co_5) or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false (bvult co_7 co_5) or (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3)))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false (and rf_0_8 false) (and rf_3_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_3 #b01) (= final_x (bvadd read_t0_a #x00000001))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_5 #b10) (= final_y (bvadd read_t0_b #x00000002))))
(assert (=> (= co_7 #b10) (= final_y (bvadd read_t1_a #x00000001))))

(check-sat)
