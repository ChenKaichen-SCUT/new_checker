(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_6_7 () Bool)
(declare-fun rf_9_8 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun input_b () Bool)
(declare-fun rf_1_8 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun final_x () (_ BitVec 32))
(declare-fun k!1253 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!1254 () Bool)
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun k!1255 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!1256 () Bool)
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun k!1257 () Bool)
(declare-fun k!1258 () Bool)
(declare-fun k!1259 () Bool)
(declare-fun k!1260 () Bool)
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_9 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_6_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) true))
(assert (= (= #x00000000 read_t1s1a) false))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_6 #b10))
(assert (distinct co_0 co_6))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_9 #b10))
(assert (distinct co_1 co_9))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_6_3 (= (bvadd read_t1s0a #x00000002) read_t0s1a)))
(assert ((_ pbeq 1 1 1) rf_0_3 rf_6_3))
(assert (=> rf_0_5 (= #x00000000 read_t1s0a)))
(assert (=> rf_6_5 (= (bvadd read_t1s0a #x00000002) read_t1s0a)))
(assert ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert (=> rf_0_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_6_7 (= (bvadd read_t1s0a #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_0_7 rf_6_7))
(assert (=> rf_1_8 (= #x00000000 read_t1s2b)))
(assert (=> rf_9_8 (= (bvadd read_t1s2b #x00000002) read_t1s2b)))
(assert ((_ pbeq 1 1 1) rf_1_8 rf_9_8))
(assert (not (and (or (and rf_1_8 false) (and rf_9_8 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_1))
                    (and rf_9_8 (bvult co_9 co_1)))
                (bvult co_1 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
(assert (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false rf_1_8 false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true rf_1_8)) (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false (bvult co_1 co_9) or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false (bvult co_1 co_9) or (and true false))
    (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_6_3 (bvult co_6 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_6_3 (bvult co_6 co_6)))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_6_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
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
(assert (=> (or true false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false (and rf_0_5 false) (and rf_6_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true rf_6_7 false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false rf_6_7)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_6_7 (bvult co_6 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_6_7 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_6))
        (and rf_6_7 (bvult co_6 co_6)))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_6))
        (and rf_6_7 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_0_7 false) (and rf_6_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_6_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_9_8 (bvult co_9 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_9_8 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false (and rf_1_8 false) (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false (bvult co_9 co_1) or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false (bvult co_9 co_1) or (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_6 #b01) (= final_x (bvadd read_t1s0a #x00000002))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_9 #b01) (= final_y (bvadd read_t1s2b #x00000002))))
(assert (or (distinct input_b false)
    (distinct #x00000002 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000000 read_t1s2b)
    (distinct rf_0_3 false)
    (distinct rf_6_3 true)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_0_7 false)
    (distinct rf_6_7 true)
    (distinct rf_1_8 true)
    (distinct rf_9_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_9)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000000 read_t1s2b)
    (distinct rf_0_3 true)
    (distinct rf_6_3 false)
    (distinct rf_0_5 true)
    (distinct rf_6_5 false)
    (distinct rf_0_7 false)
    (distinct rf_6_7 true)
    (distinct rf_1_8 true)
    (distinct rf_9_8 false)
    (distinct #b00 co_0)
    (distinct #b01 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_9)))
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_0_7 () Bool false)
(model-add rf_6_7 () Bool true)
(model-add rf_9_8 () Bool false)
(model-add rf_6_5 () Bool false)
(model-add input_b () Bool false)
(model-add rf_1_8 () Bool true)
(model-add read_t1s1a () (_ BitVec 32) (bvsub #x00000000 #xfffffffe))
(model-add rf_0_5 () Bool true)
(model-add read_t1s2b () (_ BitVec 32) #x00000000)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add final_x () (_ BitVec 32) #x00000002)
(model-del k!1253)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!1253 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1254)
(model-add topo_U_4
           ()
           (_ BitVec 4)
           (ite (or k!1254 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1255)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!1255 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1256)
(model-add topo_T_4
           ()
           (_ BitVec 4)
           (ite (or k!1256 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1257)
(model-add k!1253 () Bool (not k!1257))
(model-del k!1258)
(model-add k!1254 () Bool (not k!1258))
(model-del k!1259)
(model-add k!1255 () Bool (not k!1259))
(model-del k!1260)
(model-add k!1256 () Bool (not k!1260))
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_U_9 () (_ BitVec 4) #x3)
(model-add topo_T_5 () (_ BitVec 4) #x1)
(model-add k!1258 () Bool true)
(model-add co_6 () (_ BitVec 2) #b01)
(model-add topo_U_5 () (_ BitVec 4) #x4)
(model-add topo_U_3 () (_ BitVec 4) #x7)
(model-add topo_T_9 () (_ BitVec 4) #x7)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add rf_6_3 () Bool true)
(model-add topo_T_6 () (_ BitVec 4) #x2)
(model-add topo_U_8 () (_ BitVec 4) #x2)
(model-add topo_T_7 () (_ BitVec 4) #x4)
(model-add k!1257 () Bool true)
(model-add topo_T_8 () (_ BitVec 4) #x6)
(model-add read_t0s1a () (_ BitVec 32) #x00000002)
(model-add rf_0_3 () Bool false)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_U_7 () (_ BitVec 4) #x7)
(model-add k!1259 () Bool true)
(model-add topo_T_3 () (_ BitVec 4) #x3)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_U_6 () (_ BitVec 4) #x6)
(model-add co_9 () (_ BitVec 2) #b01)
(model-add k!1260 () Bool true)

(check-sat)
