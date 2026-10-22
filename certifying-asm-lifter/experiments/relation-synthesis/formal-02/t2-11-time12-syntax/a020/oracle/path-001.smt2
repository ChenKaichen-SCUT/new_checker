(declare-fun input_b () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_9 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_5_3 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_9_3 () Bool)
(declare-fun rf_0_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_9_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_0_8 () Bool)
(declare-fun rf_5_8 () Bool)
(declare-fun rf_9_8 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (= (= #x00000000 read_t1s1a) false))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_5 #b11))
(assert (bvult co_9 #b11))
(assert (distinct co_0 co_5 co_9))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_2 #b11))
(assert (bvult co_7 #b11))
(assert (distinct co_1 co_2 co_7))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_5_3 (= (bvadd read_t0s2a #x00000000) read_t0s1a)))
(assert (=> rf_9_3
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_3 rf_5_3 rf_9_3))
(assert (=> rf_0_4 (= #x00000000 read_t0s2a)))
(assert (=> rf_5_4 (= (bvadd read_t0s2a #x00000000) read_t0s2a)))
(assert (=> rf_9_4
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_4 rf_5_4 rf_9_4))
(assert (=> rf_1_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_2_6 (= #x00000001 read_t1s1a)))
(assert (=> rf_7_6 (= (bvadd read_t1s1a #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_6 rf_2_6 rf_7_6))
(assert (=> rf_0_8 (= #x00000000 read_t1s2b)))
(assert (=> rf_5_8 (= (bvadd read_t0s2a #x00000000) read_t1s2b)))
(assert (=> rf_9_8
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t1s2b)))
(assert ((_ pbeq 1 1 1 1) rf_0_8 rf_5_8 rf_9_8))
(assert (not (and (or (and rf_1_6 false) (and rf_2_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_2_6 (bvult co_2 co_1))
                    (and rf_7_6 (bvult co_7 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_2))
                    (and rf_2_6 (bvult co_2 co_2))
                    (and rf_7_6 (bvult co_7 co_2)))
                (bvult co_2 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false) (and rf_2_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_0))
                    (and rf_5_4 (bvult co_5 co_0))
                    (and rf_9_4 (bvult co_9 co_0)))
                (bvult co_0 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_0_4 false) (and rf_5_4 false) (and rf_9_4 false)) false)))
(assert (not (and (or (and rf_0_4 false) (and rf_5_4 false) (and rf_9_4 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_9))
                    (and rf_5_4 (bvult co_5 co_9))
                    (and rf_9_4 (bvult co_9 co_9)))
                (bvult co_9 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_0))
                    (and rf_5_8 (bvult co_5 co_0))
                    (and rf_9_8 (bvult co_9 co_0)))
                (bvult co_0 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_0_8 false) (and rf_5_8 false) (and rf_9_8 false)) false)))
(assert (not (and (or (and rf_0_8 false) (and rf_5_8 false) (and rf_9_8 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_5))
                    (and rf_5_8 (bvult co_5 co_5))
                    (and rf_9_8 (bvult co_9 co_5)))
                (bvult co_5 co_9))))
  (not a!1)))
(assert (bvult topo_U_0 #xa))
(assert (bvult topo_U_1 #xa))
(assert (bvult topo_U_2 #xa))
(assert (bvult topo_U_3 #xa))
(assert (bvult topo_U_4 #xa))
(assert (bvult topo_U_5 #xa))
(assert (bvult topo_U_6 #xa))
(assert (bvult topo_U_7 #xa))
(assert (bvult topo_U_8 #xa))
(assert (bvult topo_U_9 #xa))
(assert (bvult topo_T_0 #xa))
(assert (bvult topo_T_1 #xa))
(assert (bvult topo_T_2 #xa))
(assert (bvult topo_T_3 #xa))
(assert (bvult topo_T_4 #xa))
(assert (bvult topo_T_5 #xa))
(assert (bvult topo_T_6 #xa))
(assert (bvult topo_T_7 #xa))
(assert (bvult topo_T_8 #xa))
(assert (bvult topo_T_9 #xa))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false (bvult co_0 co_5) or (and true false))
    (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false (bvult co_0 co_9) or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false (bvult co_0 co_9) or (and true false))
    (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false (bvult co_1 co_2) or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false (bvult co_1 co_2) or (and true false))
    (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false (bvult co_1 co_7) or (and true false))
    (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false (bvult co_2 co_1) or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false (bvult co_2 co_1) or (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false (bvult co_2 co_7) or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false (bvult co_2 co_7) or (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_5_3 (bvult co_5 co_0))
        (and rf_9_3 (bvult co_9 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_5_3 (bvult co_5 co_0))
        (and rf_9_3 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_5))
        (and rf_5_3 (bvult co_5 co_5))
        (and rf_9_3 (bvult co_9 co_5)))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_5))
        (and rf_5_3 (bvult co_5 co_5))
        (and rf_9_3 (bvult co_9 co_5))
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_5_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_9))
        (and rf_5_3 (bvult co_5 co_9))
        (and rf_9_3 (bvult co_9 co_9)))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_9))
        (and rf_5_3 (bvult co_5 co_9))
        (and rf_9_3 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_5_4 (bvult co_5 co_0))
        (and rf_9_4 (bvult co_9 co_0)))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_5_4 (bvult co_5 co_0))
        (and rf_9_4 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_9_4 (bvult co_9 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_9_4 (bvult co_9 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_9))
        (and rf_5_4 (bvult co_5 co_9))
        (and rf_9_4 (bvult co_9 co_9)))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_9))
        (and rf_5_4 (bvult co_5 co_9))
        (and rf_9_4 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false (bvult co_5 co_0) or (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and false rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false rf_5_8 false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true rf_5_8)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false (bvult co_5 co_9) or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false (bvult co_5 co_9) or (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_7_6 (bvult co_7 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_7_6 (bvult co_7 co_2)))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_7_6 (bvult co_7 co_2))
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_2_6 (bvult co_2 co_7))
        (and rf_7_6 (bvult co_7 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_2_6 (bvult co_2 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false (bvult co_7 co_2) or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false (bvult co_7 co_2) or (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_9_8 (bvult co_9 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_9_8 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_9_8 (bvult co_9 co_5)))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_9_8 (bvult co_9 co_5))
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_5_8 (bvult co_5 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_5_8 (bvult co_5 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false (bvult co_9 co_0) or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false (bvult co_9 co_0) or (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_2)))
(assert (=> (or false rf_9_3 false or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false false or (and true rf_9_3)) (bvult topo_T_9 topo_T_3)))
(assert (=> (or false rf_9_4 false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true rf_9_4)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false (bvult co_9 co_5) or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false (bvult co_9 co_5) or (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_5 #b10) (= final_x (bvadd read_t0s2a #x00000000))))
(assert (=> (= co_9 #b10)
    (= final_x (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_2 #b10) (= #x00000001 final_y)))
(assert (=> (= co_7 #b10) (= final_y (bvadd read_t1s1a #x00000002))))

(check-sat)
