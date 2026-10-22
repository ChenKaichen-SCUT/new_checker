(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_4_7 () Bool)
(declare-fun final_x () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun input_b () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun rf_8_3 () Bool)
(declare-fun rf_1_3 () Bool)
(declare-fun k!1036 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun k!1037 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!1038 () Bool)
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun k!1039 () Bool)
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun k!1040 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!1041 () Bool)
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun k!1042 () Bool)
(declare-fun k!1043 () Bool)
(declare-fun k!1044 () Bool)
(declare-fun k!1045 () Bool)
(declare-fun k!1046 () Bool)
(declare-fun k!1047 () Bool)
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun read_t0s2b () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_8_5 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_4_6 () Bool)
(declare-fun rf_8_6 () Bool)
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) false))
(assert (= (= #x00000000 read_t1s1a) false))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_8 #b11))
(assert (distinct co_1 co_4 co_8))
(assert (=> rf_1_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert (=> rf_8_3
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_8_3))
(assert (=> rf_1_5 (= #x00000000 read_t0s2b)))
(assert (=> rf_4_5 (= (bvadd read_t0s1a #x00000001) read_t0s2b)))
(assert (=> rf_8_5
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t0s2b)))
(assert ((_ pbeq 1 1 1 1) rf_1_5 rf_4_5 rf_8_5))
(assert (=> rf_1_6 (= #x00000000 read_t1s0a)))
(assert (=> rf_4_6 (= (bvadd read_t0s1a #x00000001) read_t1s0a)))
(assert (=> rf_8_6
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1) rf_1_6 rf_4_6 rf_8_6))
(assert (=> rf_1_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_4_7 (= (bvadd read_t0s1a #x00000001) read_t1s1a)))
(assert (=> rf_8_7
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_7 rf_4_7 rf_8_7))
(assert (not (and (or (and rf_1_3 false) (and rf_4_3 false) (and rf_8_3 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_4_3 (bvult co_4 co_1))
                    (and rf_8_3 (bvult co_8 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_8))
                    (and rf_4_3 (bvult co_4 co_8))
                    (and rf_8_3 (bvult co_8 co_8)))
                (bvult co_8 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false) (and rf_4_7 false) (and rf_8_7 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_1))
                    (and rf_4_7 (bvult co_4 co_1))
                    (and rf_8_7 (bvult co_8 co_1)))
                (bvult co_1 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_4))
                    (and rf_4_7 (bvult co_4 co_4))
                    (and rf_8_7 (bvult co_8 co_4)))
                (bvult co_4 co_8))))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
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
(assert (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false (bvult co_1 co_8) or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false (bvult co_1 co_8) or (and true false))
    (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
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
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_5)))
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
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_8_3 (bvult co_8 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_8_3 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_8_3 (bvult co_8 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_8_3 (bvult co_8 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_8))
        (and rf_4_3 (bvult co_4 co_8))
        (and rf_8_3 (bvult co_8 co_8)))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_8))
        (and rf_4_3 (bvult co_4 co_8))
        (and rf_8_3 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
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
(assert (=> (or true rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false or (and false rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false rf_4_6 false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true rf_4_6)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false rf_4_7 false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true rf_4_7)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false (bvult co_4 co_8) or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false (bvult co_4 co_8) or (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_4_5 (bvult co_4 co_1))
        (and rf_8_5 (bvult co_8 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_4_5 (bvult co_4 co_1))
        (and rf_8_5 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_8_5 (bvult co_8 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_8_5 (bvult co_8 co_4))
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_8))
        (and rf_4_5 (bvult co_4 co_8))
        (and rf_8_5 (bvult co_8 co_8)))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_8))
        (and rf_4_5 (bvult co_4 co_8))
        (and rf_8_5 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_4_5 false)
        (and rf_8_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_8_6 (bvult co_8 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_8_6 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_8_6 (bvult co_8 co_4)))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_8_6 (bvult co_8 co_4))
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_8))
        (and rf_4_6 (bvult co_4 co_8))
        (and rf_8_6 (bvult co_8 co_8)))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_8))
        (and rf_4_6 (bvult co_4 co_8))
        (and rf_8_6 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_8_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_4_7 (bvult co_4 co_1))
        (and rf_8_7 (bvult co_8 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_4_7 (bvult co_4 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_8_7 (bvult co_8 co_4)))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_8_7 (bvult co_8 co_4))
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_4_7 (bvult co_4 co_8))
        (and rf_8_7 (bvult co_8 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_4_7 (bvult co_4 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_4_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false rf_8_3 false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true rf_8_3)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false (bvult co_8 co_4) or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false (bvult co_8 co_4) or (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false rf_8_5 false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and true rf_8_5)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false rf_8_6 false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and false rf_8_6)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_4 #b10) (= final_y (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_8 #b10)
    (= final_y (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000001 read_t1s1a)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_8_3 false)
    (distinct rf_1_5 false)
    (distinct rf_4_5 false)
    (distinct rf_8_5 true)
    (distinct rf_1_6 true)
    (distinct rf_4_6 false)
    (distinct rf_8_6 false)
    (distinct rf_1_7 false)
    (distinct rf_4_7 true)
    (distinct rf_8_7 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_4)
    (distinct #b10 co_8)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000001 read_t1s1a)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_8_3 false)
    (distinct rf_1_5 false)
    (distinct rf_4_5 true)
    (distinct rf_8_5 false)
    (distinct rf_1_6 true)
    (distinct rf_4_6 false)
    (distinct rf_8_6 false)
    (distinct rf_1_7 false)
    (distinct rf_4_7 true)
    (distinct rf_8_7 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_4)
    (distinct #b10 co_8)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2b)
    (distinct #x00000001 read_t1s0a)
    (distinct #x00000001 read_t1s1a)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_8_3 false)
    (distinct rf_1_5 false)
    (distinct rf_4_5 true)
    (distinct rf_8_5 false)
    (distinct rf_1_6 false)
    (distinct rf_4_6 true)
    (distinct rf_8_6 false)
    (distinct rf_1_7 false)
    (distinct rf_4_7 true)
    (distinct rf_8_7 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_4)
    (distinct #b10 co_8)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t0s2b)
    (distinct #x00000001 read_t1s0a)
    (distinct #x00000001 read_t1s1a)
    (distinct rf_1_3 true)
    (distinct rf_4_3 false)
    (distinct rf_8_3 false)
    (distinct rf_1_5 false)
    (distinct rf_4_5 false)
    (distinct rf_8_5 true)
    (distinct rf_1_6 false)
    (distinct rf_4_6 true)
    (distinct rf_8_6 false)
    (distinct rf_1_7 false)
    (distinct rf_4_7 true)
    (distinct rf_8_7 false)
    (distinct #b0 co_0)
    (distinct #b00 co_1)
    (distinct #b01 co_4)
    (distinct #b10 co_8)))
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add rf_4_7 () Bool true)
(model-add final_x () (_ BitVec 32) #x00000000)
(model-add rf_1_7 () Bool false)
(model-add read_t0s1a () (_ BitVec 32) (bvadd #xffffffff read_t1s1a))
(model-add co_0 () (_ BitVec 1) #b0)
(model-add input_b () Bool true)
(model-add rf_8_7 () Bool false)
(model-add rf_8_3 () Bool false)
(model-add rf_1_3 () Bool true)
(model-add read_t1s1a () (_ BitVec 32) #x00000001)
(model-del k!1036)
(model-add topo_U_0
           ()
           (_ BitVec 4)
           (ite (or k!1036 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1037)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!1037 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1038)
(model-add topo_U_9
           ()
           (_ BitVec 4)
           (ite (or k!1038 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1039)
(model-add topo_T_0
           ()
           (_ BitVec 4)
           (ite (or k!1039 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1040)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!1040 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1041)
(model-add topo_T_9
           ()
           (_ BitVec 4)
           (ite (or k!1041 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1042)
(model-add k!1036 () Bool (not k!1042))
(model-del k!1043)
(model-add k!1037 () Bool (not k!1043))
(model-del k!1044)
(model-add k!1038 () Bool (not k!1044))
(model-del k!1045)
(model-add k!1039 () Bool (not k!1045))
(model-del k!1046)
(model-add k!1040 () Bool (not k!1046))
(model-del k!1047)
(model-add k!1041 () Bool (not k!1047))
(model-add co_8 () (_ BitVec 2) #b10)
(model-add read_t1s0a () (_ BitVec 32) #x00000000)
(model-add rf_4_6 () Bool false)
(model-add k!1047 () Bool true)
(model-add topo_T_4 () (_ BitVec 4) #x2)
(model-add k!1042 () Bool true)
(model-add k!1046 () Bool true)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_T_5 () (_ BitVec 4) #x9)
(model-add k!1043 () Bool true)
(model-add topo_U_4 () (_ BitVec 4) #x3)
(model-add topo_U_5 () (_ BitVec 4) #x8)
(model-add topo_U_3 () (_ BitVec 4) #x2)
(model-add rf_8_6 () Bool false)
(model-add k!1045 () Bool true)
(model-add rf_8_5 () Bool true)
(model-add co_4 () (_ BitVec 2) #b01)
(model-add topo_U_8 () (_ BitVec 4) #x5)
(model-add read_t0s2b () (_ BitVec 32) #x00000002)
(model-add topo_T_6 () (_ BitVec 4) #x1)
(model-add topo_T_7 () (_ BitVec 4) #x3)
(model-add topo_T_8 () (_ BitVec 4) #x8)
(model-add rf_1_6 () Bool true)
(model-add rf_1_5 () Bool false)
(model-add topo_U_7 () (_ BitVec 4) #x4)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_3 () (_ BitVec 4) #x1)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add topo_U_6 () (_ BitVec 4) #x1)
(model-add rf_4_5 () Bool false)
(model-add k!1044 () Bool true)

(check-sat)
