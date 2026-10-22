(declare-fun rf_9_8 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_5_4 () Bool)
(declare-fun input_b () Bool)
(declare-fun k!1373 () Bool)
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun k!1374 () Bool)
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun k!1375 () Bool)
(declare-fun k!1376 () Bool)
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_9 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_6_2 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_9_2 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_1_8 () Bool)
(declare-fun rf_6_8 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b true))
(assert (= (not input_b) false))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_3 #b11))
(assert (bvult co_5 #b11))
(assert (distinct co_0 co_3 co_5))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_6 #b11))
(assert (bvult co_9 #b11))
(assert (distinct co_1 co_6 co_9))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_6_2 (= #x00000001 read_t0s0a)))
(assert (=> rf_9_2
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1) rf_1_2 rf_6_2 rf_9_2))
(assert (=> rf_0_4 (= #x00000000 read_t0s2a)))
(assert (=> rf_3_4 (= #x00000000 read_t0s2a)))
(assert (=> rf_5_4
    (= (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_4 rf_3_4 rf_5_4))
(assert (=> rf_1_8 (= #x00000000 read_t1s2b)))
(assert (=> rf_6_8 (= #x00000001 read_t1s2b)))
(assert (=> rf_9_8
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t1s2b)))
(assert ((_ pbeq 1 1 1 1) rf_1_8 rf_6_8 rf_9_8))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_0))
                    (and rf_3_4 (bvult co_3 co_0))
                    (and rf_5_4 (bvult co_5 co_0)))
                (bvult co_0 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false)) false)))
(assert (not (and (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false)) false)))
(assert (not (and (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false)) false)))
(assert (not (and (or (and rf_1_8 false) (and rf_6_8 false) (and rf_9_8 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_1))
                    (and rf_6_8 (bvult co_6 co_1))
                    (and rf_9_8 (bvult co_9 co_1)))
                (bvult co_1 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_1_8 false) (and rf_6_8 false) (and rf_9_8 false)) false)))
(assert (not (and (or (and rf_1_8 false) (and rf_6_8 false) (and rf_9_8 false)) false)))
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
(assert (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false (bvult co_0 co_3) or (and true false))
    (bvult topo_T_0 topo_T_3)))
(assert (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false (bvult co_0 co_5) or (and true false))
    (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false (bvult co_1 co_6) or (and true false))
    (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false rf_1_8 false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true rf_1_8)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false (bvult co_1 co_9) or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false (bvult co_1 co_9) or (and true false))
    (bvult topo_T_1 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_6_2 (bvult co_6 co_1))
        (and rf_9_2 (bvult co_9 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_6_2 (bvult co_6 co_1))
        (and rf_9_2 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and rf_9_2 (bvult co_9 co_6)))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and rf_9_2 (bvult co_9 co_6))
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_9))
        (and rf_6_2 (bvult co_6 co_9))
        (and rf_9_2 (bvult co_9 co_9)))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_9))
        (and rf_6_2 (bvult co_6 co_9))
        (and rf_9_2 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert (=> (or false false (bvult co_3 co_0) or (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert (=> (or false false (bvult co_3 co_3) or (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false false or (and false rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or true false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or true false (bvult co_3 co_5) or (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_3_4 (bvult co_3 co_0))
        (and rf_5_4 (bvult co_5 co_0)))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_3_4 (bvult co_3 co_0))
        (and rf_5_4 (bvult co_5 co_0))
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3)))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3))
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false (bvult co_5 co_0) or (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false (bvult co_5 co_3) or (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false (bvult co_6 co_1) or (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or true rf_6_8 false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or true true false or (and false rf_6_8)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or true false (bvult co_6 co_9) or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or true true (bvult co_6 co_9) or (and false false))
    (bvult topo_T_6 topo_T_9)))
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
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6)))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false (bvult co_9 co_1) or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false (bvult co_9 co_1) or (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false rf_9_2 false or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false false or (and true rf_9_2)) (bvult topo_T_9 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false (bvult co_9 co_6) or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false (bvult co_9 co_6) or (and false false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_3 #b10) (= #x00000000 final_x)))
(assert (=> (= co_5 #b10)
    (= final_x (bvadd read_t0s2a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_6 #b10) (= #x00000001 final_y)))
(assert (=> (= co_9 #b10)
    (= final_y (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)))))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000001 read_t1s2b)
    (distinct rf_1_2 false)
    (distinct rf_6_2 false)
    (distinct rf_9_2 true)
    (distinct rf_0_4 false)
    (distinct rf_3_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_8 false)
    (distinct rf_6_8 true)
    (distinct rf_9_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_5)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_9)))
(assert (or (distinct input_b true)
    (distinct #x00000001 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000001 read_t1s2b)
    (distinct rf_1_2 false)
    (distinct rf_6_2 true)
    (distinct rf_9_2 false)
    (distinct rf_0_4 false)
    (distinct rf_3_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_8 false)
    (distinct rf_6_8 true)
    (distinct rf_9_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_5)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_9)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000001 read_t1s2b)
    (distinct rf_1_2 true)
    (distinct rf_6_2 false)
    (distinct rf_9_2 false)
    (distinct rf_0_4 false)
    (distinct rf_3_4 true)
    (distinct rf_5_4 false)
    (distinct rf_1_8 false)
    (distinct rf_6_8 true)
    (distinct rf_9_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_5)
    (distinct #b00 co_1)
    (distinct #b01 co_6)
    (distinct #b10 co_9)))
(model-add rf_9_8 () Bool false)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_5_4 () Bool false)
(model-add input_b () Bool true)
(model-del k!1373)
(model-add topo_U_7
           ()
           (_ BitVec 4)
           (ite (or k!1373 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1374)
(model-add topo_T_7
           ()
           (_ BitVec 4)
           (ite (or k!1374 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1375)
(model-add k!1373 () Bool (not k!1375))
(model-del k!1376)
(model-add k!1374 () Bool (not k!1376))
(model-add topo_T_4 () (_ BitVec 4) #x7)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add read_t0s0a () (_ BitVec 32) #x00000002)
(model-add topo_U_9 () (_ BitVec 4) #x5)
(model-add topo_T_5 () (_ BitVec 4) #x8)
(model-add co_6 () (_ BitVec 2) #b01)
(model-add rf_0_4 () Bool false)
(model-add read_t1s2b () (_ BitVec 32) #x00000001)
(model-add k!1375 () Bool true)
(model-add rf_1_8 () Bool false)
(model-add topo_U_4 () (_ BitVec 4) #x8)
(model-add topo_U_3 () (_ BitVec 4) #x1)
(model-add rf_9_2 () Bool true)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add topo_U_5 () (_ BitVec 4) #x9)
(model-add topo_T_9 () (_ BitVec 4) #x3)
(model-add read_t0s2a () (_ BitVec 32) #x00000000)
(model-add topo_U_2 () (_ BitVec 4) #x9)
(model-add topo_T_6 () (_ BitVec 4) #x1)
(model-add topo_U_8 () (_ BitVec 4) #x3)
(model-add rf_1_2 () Bool false)
(model-add rf_6_8 () Bool true)
(model-add co_3 () (_ BitVec 2) #b01)
(model-add co_5 () (_ BitVec 2) #b10)
(model-add rf_3_4 () Bool true)
(model-add topo_T_2 () (_ BitVec 4) #x5)
(model-add topo_T_8 () (_ BitVec 4) #x2)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add final_x () (_ BitVec 32) #x00000001)
(model-add k!1376 () Bool true)
(model-add topo_T_3 () (_ BitVec 4) #x6)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add rf_6_2 () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add topo_U_6 () (_ BitVec 4) #x1)
(model-add co_9 () (_ BitVec 2) #b10)

(check-sat)
