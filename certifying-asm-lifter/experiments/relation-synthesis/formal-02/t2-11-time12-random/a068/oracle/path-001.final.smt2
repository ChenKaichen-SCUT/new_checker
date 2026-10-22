(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_3 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun co_9 () (_ BitVec 3))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_9_2 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun rf_9_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_9_5 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_1_8 () Bool)
(declare-fun rf_3_8 () Bool)
(declare-fun rf_6_8 () Bool)
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
(assert (= input_b true))
(assert (= input_b false))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_3 #b100))
(assert (bvult co_6 #b100))
(assert (bvult co_9 #b100))
(assert (distinct co_1 co_3 co_6 co_9))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000000) read_t0s0a)))
(assert (=> rf_6_2 (= (bvadd read_t0s2a #x00000001) read_t0s0a)))
(assert (=> rf_9_2 (= (bvadd read_t1s2b #x00000002) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_2 rf_3_2 rf_6_2 rf_9_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_3_4 (= (bvadd read_t0s0a #x00000000) read_t0s1a)))
(assert (=> rf_6_4 (= (bvadd read_t0s2a #x00000001) read_t0s1a)))
(assert (=> rf_9_4 (= (bvadd read_t1s2b #x00000002) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_4 rf_3_4 rf_6_4 rf_9_4))
(assert (=> rf_1_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_3_5 (= (bvadd read_t0s0a #x00000000) read_t0s2a)))
(assert (=> rf_6_5 (= (bvadd read_t0s2a #x00000001) read_t0s2a)))
(assert (=> rf_9_5 (= (bvadd read_t1s2b #x00000002) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_5 rf_3_5 rf_6_5 rf_9_5))
(assert (=> rf_0_7 (= #x00000000 read_t1s0a)))
(assert ((_ pbeq 1 1) rf_0_7))
(assert (=> rf_1_8 (= #x00000000 read_t1s2b)))
(assert (=> rf_3_8 (= (bvadd read_t0s0a #x00000000) read_t1s2b)))
(assert (=> rf_6_8 (= (bvadd read_t0s2a #x00000001) read_t1s2b)))
(assert (=> rf_9_8 (= (bvadd read_t1s2b #x00000002) read_t1s2b)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_8 rf_3_8 rf_6_8 rf_9_8))
(assert (not (and (or (and rf_1_2 false)
              (and rf_3_2 false)
              (and rf_6_2 false)
              (and rf_9_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1))
                    (and rf_6_2 (bvult co_6 co_1))
                    (and rf_9_2 (bvult co_9 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_9))
                    (and rf_3_2 (bvult co_3 co_9))
                    (and rf_6_2 (bvult co_6 co_9))
                    (and rf_9_2 (bvult co_9 co_9)))
                (bvult co_9 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_8 false)
              (and rf_3_8 false)
              (and rf_6_8 false)
              (and rf_9_8 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_1))
                    (and rf_3_8 (bvult co_3 co_1))
                    (and rf_6_8 (bvult co_6 co_1))
                    (and rf_9_8 (bvult co_9 co_1)))
                (bvult co_1 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_3))
                    (and rf_3_8 (bvult co_3 co_3))
                    (and rf_6_8 (bvult co_6 co_3))
                    (and rf_9_8 (bvult co_9 co_3)))
                (bvult co_3 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_6))
                    (and rf_3_8 (bvult co_3 co_6))
                    (and rf_6_8 (bvult co_6 co_6))
                    (and rf_9_8 (bvult co_9 co_6)))
                (bvult co_6 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_1_5 false)
              (and rf_3_5 false)
              (and rf_6_5 false)
              (and rf_9_5 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_1))
                    (and rf_3_5 (bvult co_3 co_1))
                    (and rf_6_5 (bvult co_6 co_1))
                    (and rf_9_5 (bvult co_9 co_1)))
                (bvult co_1 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_9))
                    (and rf_3_5 (bvult co_3 co_9))
                    (and rf_6_5 (bvult co_6 co_9))
                    (and rf_9_5 (bvult co_9 co_9)))
                (bvult co_9 co_6))))
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
(assert (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false (bvult co_1 co_3) or (and true false))
    (bvult topo_T_1 topo_T_3)))
(assert (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
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
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_6_2 (bvult co_6 co_1))
        (and rf_9_2 (bvult co_9 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_6_2 (bvult co_6 co_1))
        (and rf_9_2 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_6_2 (bvult co_6 co_3))
        (and rf_9_2 (bvult co_9 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_6_2 (bvult co_6 co_3))
        (and rf_9_2 (bvult co_9 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_6))
        (and rf_3_2 (bvult co_3 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and rf_9_2 (bvult co_9 co_6)))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_6))
        (and rf_3_2 (bvult co_3 co_6))
        (and rf_6_2 (bvult co_6 co_6))
        (and rf_9_2 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_6_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_6_2 (bvult co_6 co_9))
        (and rf_9_2 (bvult co_9 co_9)))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_6_2 (bvult co_6 co_9))
        (and rf_9_2 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_2 topo_T_9)))
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
(assert (=> (or true rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false false or (and false rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or true rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or true false false or (and false rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or true false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or true false (bvult co_3 co_6) or (and false false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false (bvult co_3 co_9) or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false (bvult co_3 co_9) or (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_3_4 (bvult co_3 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_9_4 (bvult co_9 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_3_4 (bvult co_3 co_1))
        (and rf_6_4 (bvult co_6 co_1))
        (and rf_9_4 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_6_4 (bvult co_6 co_3))
        (and rf_9_4 (bvult co_9 co_3)))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_6_4 (bvult co_6 co_3))
        (and rf_9_4 (bvult co_9 co_3))
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_3_4 (bvult co_3 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_9_4 (bvult co_9 co_6)))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_6))
        (and rf_3_4 (bvult co_3 co_6))
        (and rf_6_4 (bvult co_6 co_6))
        (and rf_9_4 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_6_4 false)
        (and rf_9_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_9))
        (and rf_3_4 (bvult co_3 co_9))
        (and rf_6_4 (bvult co_6 co_9))
        (and rf_9_4 (bvult co_9 co_9)))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_9))
        (and rf_3_4 (bvult co_3 co_9))
        (and rf_6_4 (bvult co_6 co_9))
        (and rf_9_4 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_3_5 (bvult co_3 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_9_5 (bvult co_9 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_3_5 (bvult co_3 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_9_5 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_6_5 (bvult co_6 co_3))
        (and rf_9_5 (bvult co_9 co_3)))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_6_5 (bvult co_6 co_3))
        (and rf_9_5 (bvult co_9 co_3))
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_3_5 (bvult co_3 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_3_5 (bvult co_3 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_9))
        (and rf_3_5 (bvult co_3 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9)))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_9))
        (and rf_3_5 (bvult co_3 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false (bvult co_6 co_1) or (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and false rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false (bvult co_6 co_3) or (and false false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false rf_6_8 false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or false false false or (and true rf_6_8)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false (bvult co_6 co_9) or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or false false (bvult co_6 co_9) or (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false (and rf_0_7 (bvult co_0 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false (and rf_0_7 (bvult co_0 co_0)) (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false (and rf_0_7 false) (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false false (and rf_0_7 false) (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false (and rf_0_7 false) (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false (and rf_0_7 false)) (bvult topo_U_7 topo_U_9)))
(assert (=> (or true false false (and rf_0_7 false) (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_3_8 (bvult co_3 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_3_8 (bvult co_3 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_6_8 (bvult co_6 co_3))
        (and rf_9_8 (bvult co_9 co_3)))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_6_8 (bvult co_6 co_3))
        (and rf_9_8 (bvult co_9 co_3))
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_3_8 (bvult co_3 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6)))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_3_8 (bvult co_3 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6))
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_3_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_3_8 (bvult co_3 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_3_8 (bvult co_3 co_9))
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
(assert (=> (or false false (bvult co_9 co_3) or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false (bvult co_9 co_3) or (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false rf_9_4 false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true rf_9_4)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false rf_9_5 false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and true rf_9_5)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false (bvult co_9 co_6) or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false (bvult co_9 co_6) or (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_3 #b011) (= final_y (bvadd read_t0s0a #x00000000))))
(assert (=> (= co_6 #b011) (= final_y (bvadd read_t0s2a #x00000001))))
(assert (=> (= co_9 #b011) (= final_y (bvadd read_t1s2b #x00000002))))

(check-sat)
