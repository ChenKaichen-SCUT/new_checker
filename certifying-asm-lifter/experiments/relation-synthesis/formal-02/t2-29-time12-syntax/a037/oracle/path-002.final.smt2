(declare-fun final_y () (_ BitVec 32))
(declare-fun rf_4_7 () Bool)
(declare-fun co_1 () (_ BitVec 1))
(declare-fun rf_9_8 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun k!1264 () Bool)
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun k!1265 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!1266 () Bool)
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun k!1267 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!1268 () Bool)
(declare-fun k!1269 () Bool)
(declare-fun k!1270 () Bool)
(declare-fun k!1271 () Bool)
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun co_9 () (_ BitVec 3))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_9_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_9_5 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_6_7 () Bool)
(declare-fun rf_9_7 () Bool)
(declare-fun rf_0_8 () Bool)
(declare-fun rf_4_8 () Bool)
(declare-fun rf_6_8 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) false))
(assert (= (= #x00000000 read_t1s1a) true))
(assert (bvult co_0 #b100))
(assert (= co_0 #b000))
(assert (bvult co_4 #b100))
(assert (bvult co_6 #b100))
(assert (bvult co_9 #b100))
(assert (distinct co_0 co_4 co_6 co_9))
(assert (bvult co_1 #b1))
(assert (= co_1 #b0))
(assert (distinct co_1))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (ite input_b #x00000001 #x00000002) read_t0s1a)))
(assert (=> rf_6_3 (= (bvadd read_t1s0a #x00000002) read_t0s1a)))
(assert (=> rf_9_3
    (= (bvadd read_t1s2a (ite input_b #x00000001 #x00000002)) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_3 rf_4_3 rf_6_3 rf_9_3))
(assert (=> rf_0_5 (= #x00000000 read_t1s0a)))
(assert (=> rf_4_5 (= (ite input_b #x00000001 #x00000002) read_t1s0a)))
(assert (=> rf_6_5 (= (bvadd read_t1s0a #x00000002) read_t1s0a)))
(assert (=> rf_9_5
    (= (bvadd read_t1s2a (ite input_b #x00000001 #x00000002)) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_5 rf_4_5 rf_6_5 rf_9_5))
(assert (=> rf_0_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_4_7 (= (ite input_b #x00000001 #x00000002) read_t1s1a)))
(assert (=> rf_6_7 (= (bvadd read_t1s0a #x00000002) read_t1s1a)))
(assert (=> rf_9_7
    (= (bvadd read_t1s2a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_7 rf_4_7 rf_6_7 rf_9_7))
(assert (=> rf_0_8 (= #x00000000 read_t1s2a)))
(assert (=> rf_4_8 (= (ite input_b #x00000001 #x00000002) read_t1s2a)))
(assert (=> rf_6_8 (= (bvadd read_t1s0a #x00000002) read_t1s2a)))
(assert (=> rf_9_8
    (= (bvadd read_t1s2a (ite input_b #x00000001 #x00000002)) read_t1s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_8 rf_4_8 rf_6_8 rf_9_8))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_0))
                    (and rf_4_8 (bvult co_4 co_0))
                    (and rf_6_8 (bvult co_6 co_0))
                    (and rf_9_8 (bvult co_9 co_0)))
                (bvult co_0 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_0_8 false)
              (and rf_4_8 false)
              (and rf_6_8 false)
              (and rf_9_8 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_4))
                    (and rf_4_8 (bvult co_4 co_4))
                    (and rf_6_8 (bvult co_6 co_4))
                    (and rf_9_8 (bvult co_9 co_4)))
                (bvult co_4 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_4_5 (bvult co_4 co_0))
                    (and rf_6_5 (bvult co_6 co_0))
                    (and rf_9_5 (bvult co_9 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false)
              (and rf_4_5 false)
              (and rf_6_5 false)
              (and rf_9_5 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_4))
                    (and rf_4_5 (bvult co_4 co_4))
                    (and rf_6_5 (bvult co_6 co_4))
                    (and rf_9_5 (bvult co_9 co_4)))
                (bvult co_4 co_6))))
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
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
(assert (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_8)))
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
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and rf_9_3 (bvult co_9 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and rf_9_3 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4))
        (and rf_9_3 (bvult co_9 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4))
        (and rf_9_3 (bvult co_9 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_9_3 (bvult co_9 co_6)))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and rf_9_3 (bvult co_9 co_6))
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and rf_9_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_9))
        (and rf_4_3 (bvult co_4 co_9))
        (and rf_6_3 (bvult co_6 co_9))
        (and rf_9_3 (bvult co_9 co_9)))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_9))
        (and rf_4_3 (bvult co_4 co_9))
        (and rf_6_3 (bvult co_6 co_9))
        (and rf_9_3 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_3 topo_T_9)))
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
(assert (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false (bvult co_4 co_6) or (and true false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false rf_4_7 false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true rf_4_7)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false rf_4_8 false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true rf_4_8)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false (bvult co_4 co_9) or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false (bvult co_4 co_9) or (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_9_5 (bvult co_9 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and rf_9_5 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4))
        (and rf_9_5 (bvult co_9 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4))
        (and rf_9_5 (bvult co_9 co_4))
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_9))
        (and rf_4_5 (bvult co_4 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9)))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_9))
        (and rf_4_5 (bvult co_4 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9))
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
(assert (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false (bvult co_6 co_4) or (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true rf_6_7 false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or true false false or (and false rf_6_7)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or true rf_6_8 false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or true false false or (and false rf_6_8)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or true false (bvult co_6 co_9) or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or true false (bvult co_6 co_9) or (and false false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_4_7 (bvult co_4 co_0))
        (and rf_6_7 (bvult co_6 co_0))
        (and rf_9_7 (bvult co_9 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_4_7 (bvult co_4 co_0))
        (and rf_6_7 (bvult co_6 co_0))
        (and rf_9_7 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_6_7 (bvult co_6 co_4))
        (and rf_9_7 (bvult co_9 co_4)))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_6_7 (bvult co_6 co_4))
        (and rf_9_7 (bvult co_9 co_4))
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_6))
        (and rf_4_7 (bvult co_4 co_6))
        (and rf_6_7 (bvult co_6 co_6))
        (and rf_9_7 (bvult co_9 co_6)))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_6))
        (and rf_4_7 (bvult co_4 co_6))
        (and rf_6_7 (bvult co_6 co_6))
        (and rf_9_7 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_4_7 false)
        (and rf_6_7 false)
        (and rf_9_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_9))
        (and rf_4_7 (bvult co_4 co_9))
        (and rf_6_7 (bvult co_6 co_9))
        (and rf_9_7 (bvult co_9 co_9)))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_7 (bvult co_0 co_9))
        (and rf_4_7 (bvult co_4 co_9))
        (and rf_6_7 (bvult co_6 co_9))
        (and rf_9_7 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_6_8 (bvult co_6 co_0))
        (and rf_9_8 (bvult co_9 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_6_8 (bvult co_6 co_0))
        (and rf_9_8 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_6_8 (bvult co_6 co_4))
        (and rf_9_8 (bvult co_9 co_4)))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_6_8 (bvult co_6 co_4))
        (and rf_9_8 (bvult co_9 co_4))
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_6))
        (and rf_4_8 (bvult co_4 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6)))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_6))
        (and rf_4_8 (bvult co_4 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_4_8 (bvult co_4 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_4_8 (bvult co_4 co_9))
        (and rf_6_8 (bvult co_6 co_9))
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
(assert (=> (or false false (bvult co_9 co_4) or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false (bvult co_9 co_4) or (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false rf_9_5 false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and false rf_9_5)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false (bvult co_9 co_6) or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false (bvult co_9 co_6) or (and false false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false rf_9_7 false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false rf_9_7)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b011) (= #x00000000 final_x)))
(assert (=> (= co_4 #b011) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_6 #b011) (= final_x (bvadd read_t1s0a #x00000002))))
(assert (=> (= co_9 #b011)
    (= final_x (bvadd read_t1s2a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_1 #b0) (= #x00000000 final_y)))
(model-add final_y () (_ BitVec 32) #x00000000)
(model-add rf_4_7 () Bool false)
(model-add co_1 () (_ BitVec 1) #b0)
(model-add rf_9_8 () Bool false)
(model-add rf_6_5 () Bool false)
(model-add read_t1s1a () (_ BitVec 32) #x00000000)
(model-add input_b () Bool true)
(model-add co_0 () (_ BitVec 3) #b000)
(model-del k!1264)
(model-add topo_U_1
           ()
           (_ BitVec 4)
           (ite (or k!1264 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1265)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!1265 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1266)
(model-add topo_T_1
           ()
           (_ BitVec 4)
           (ite (or k!1266 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1267)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!1267 (= #xa #x0)) #xa (bvsub #xa #x1)))
(model-del k!1268)
(model-add k!1264 () Bool (not k!1268))
(model-del k!1269)
(model-add k!1265 () Bool (not k!1269))
(model-del k!1270)
(model-add k!1266 () Bool (not k!1270))
(model-del k!1271)
(model-add k!1267 () Bool (not k!1271))

(check-sat)
