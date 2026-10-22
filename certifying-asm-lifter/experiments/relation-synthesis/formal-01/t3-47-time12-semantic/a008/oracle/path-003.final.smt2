(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_2 () (_ BitVec 3))
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_5 () (_ BitVec 3))
(declare-fun co_8 () (_ BitVec 3))
(declare-fun read_t0s2b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_5_3 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_8_3 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun rf_4_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_8_6 () Bool)
(declare-fun rf_1_7 () Bool)
(declare-fun rf_2_7 () Bool)
(declare-fun rf_4_7 () Bool)
(declare-fun rf_5_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun read_t2s1a () (_ BitVec 32))
(declare-fun rf_0_10 () Bool)
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
(declare-fun topo_U_10 () (_ BitVec 4))
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
(declare-fun topo_T_10 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) false))
(assert (= input_b false))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b101))
(assert (= co_1 #b000))
(assert (bvult co_2 #b101))
(assert (bvult co_4 #b101))
(assert (bvult co_5 #b101))
(assert (bvult co_8 #b101))
(assert (distinct co_1 co_2 co_4 co_5 co_8))
(assert (=> rf_1_3 (= #x00000000 read_t0s2b)))
(assert (=> rf_2_3 (= #x00000002 read_t0s2b)))
(assert (=> rf_4_3 (= (bvadd read_t0s2b #x00000000) read_t0s2b)))
(assert (=> rf_5_3 (= #x00000002 read_t0s2b)))
(assert (=> rf_8_3
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t0s2b)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_3 rf_2_3 rf_4_3 rf_5_3 rf_8_3))
(assert (=> rf_1_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_2_6 (= #x00000002 read_t1s1a)))
(assert (=> rf_4_6 (= (bvadd read_t0s2b #x00000000) read_t1s1a)))
(assert (=> rf_5_6 (= #x00000002 read_t1s1a)))
(assert (=> rf_8_6
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_6 rf_2_6 rf_4_6 rf_5_6 rf_8_6))
(assert (=> rf_1_7 (= #x00000000 read_t1s2b)))
(assert (=> rf_2_7 (= #x00000002 read_t1s2b)))
(assert (=> rf_4_7 (= (bvadd read_t0s2b #x00000000) read_t1s2b)))
(assert (=> rf_5_7 (= #x00000002 read_t1s2b)))
(assert (=> rf_8_7
    (= (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)) read_t1s2b)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_7 rf_2_7 rf_4_7 rf_5_7 rf_8_7))
(assert (=> rf_0_10 (= #x00000000 read_t2s1a)))
(assert ((_ pbeq 1 1) rf_0_10))
(assert (not (and (or (and rf_1_3 false)
              (and rf_2_3 false)
              (and rf_4_3 false)
              (and rf_5_3 false)
              (and rf_8_3 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_2_3 (bvult co_2 co_1))
                    (and rf_4_3 (bvult co_4 co_1))
                    (and rf_5_3 (bvult co_5 co_1))
                    (and rf_8_3 (bvult co_8 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_5))
                    (and rf_2_3 (bvult co_2 co_5))
                    (and rf_4_3 (bvult co_4 co_5))
                    (and rf_5_3 (bvult co_5 co_5))
                    (and rf_8_3 (bvult co_8 co_5)))
                (bvult co_5 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_8))
                    (and rf_2_3 (bvult co_2 co_8))
                    (and rf_4_3 (bvult co_4 co_8))
                    (and rf_5_3 (bvult co_5 co_8))
                    (and rf_8_3 (bvult co_8 co_8)))
                (bvult co_8 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false)
              (and rf_2_7 false)
              (and rf_4_7 false)
              (and rf_5_7 false)
              (and rf_8_7 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_1))
                    (and rf_2_7 (bvult co_2 co_1))
                    (and rf_4_7 (bvult co_4 co_1))
                    (and rf_5_7 (bvult co_5 co_1))
                    (and rf_8_7 (bvult co_8 co_1)))
                (bvult co_1 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_2))
                    (and rf_2_7 (bvult co_2 co_2))
                    (and rf_4_7 (bvult co_4 co_2))
                    (and rf_5_7 (bvult co_5 co_2))
                    (and rf_8_7 (bvult co_8 co_2)))
                (bvult co_2 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_4))
                    (and rf_2_7 (bvult co_2 co_4))
                    (and rf_4_7 (bvult co_4 co_4))
                    (and rf_5_7 (bvult co_5 co_4))
                    (and rf_8_7 (bvult co_8 co_4)))
                (bvult co_4 co_8))))
  (not a!1)))
(assert (bvult topo_U_0 #xb))
(assert (bvult topo_U_1 #xb))
(assert (bvult topo_U_2 #xb))
(assert (bvult topo_U_3 #xb))
(assert (bvult topo_U_4 #xb))
(assert (bvult topo_U_5 #xb))
(assert (bvult topo_U_6 #xb))
(assert (bvult topo_U_7 #xb))
(assert (bvult topo_U_8 #xb))
(assert (bvult topo_U_9 #xb))
(assert (bvult topo_U_10 #xb))
(assert (bvult topo_T_0 #xb))
(assert (bvult topo_T_1 #xb))
(assert (bvult topo_T_2 #xb))
(assert (bvult topo_T_3 #xb))
(assert (bvult topo_T_4 #xb))
(assert (bvult topo_T_5 #xb))
(assert (bvult topo_T_6 #xb))
(assert (bvult topo_T_7 #xb))
(assert (bvult topo_T_8 #xb))
(assert (bvult topo_T_9 #xb))
(assert (bvult topo_T_10 #xb))
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
(assert (=> (or false rf_0_10 false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true rf_0_10)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert (=> (or false false (bvult co_1 co_1) or (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or false false (bvult co_1 co_2) or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false (bvult co_1 co_2) or (and true false))
    (bvult topo_T_1 topo_T_2)))
(assert (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false (bvult co_1 co_4) or (and true false))
    (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false (bvult co_1 co_5) or (and true false))
    (bvult topo_T_1 topo_T_5)))
(assert (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false (bvult co_1 co_8) or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false (bvult co_1 co_8) or (and true false))
    (bvult topo_T_1 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false (bvult co_2 co_1) or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false (bvult co_2 co_1) or (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or true false false or (and false rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or true false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or true false (bvult co_2 co_4) or (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false (bvult co_2 co_5) or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false (bvult co_2 co_5) or (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false rf_2_7 false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true rf_2_7)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false (bvult co_2 co_8) or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false (bvult co_2 co_8) or (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_2_3 (bvult co_2 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_5_3 (bvult co_5 co_1))
        (and rf_8_3 (bvult co_8 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_2_3 (bvult co_2 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_5_3 (bvult co_5 co_1))
        (and rf_8_3 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2))
        (and rf_5_3 (bvult co_5 co_2))
        (and rf_8_3 (bvult co_8 co_2)))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2))
        (and rf_5_3 (bvult co_5 co_2))
        (and rf_8_3 (bvult co_8 co_2))
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_5_3 (bvult co_5 co_4))
        (and rf_8_3 (bvult co_8 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_5_3 (bvult co_5 co_4))
        (and rf_8_3 (bvult co_8 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_5))
        (and rf_2_3 (bvult co_2 co_5))
        (and rf_4_3 (bvult co_4 co_5))
        (and rf_5_3 (bvult co_5 co_5))
        (and rf_8_3 (bvult co_8 co_5)))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_5))
        (and rf_2_3 (bvult co_2 co_5))
        (and rf_4_3 (bvult co_4 co_5))
        (and rf_5_3 (bvult co_5 co_5))
        (and rf_8_3 (bvult co_8 co_5))
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_8))
        (and rf_2_3 (bvult co_2 co_8))
        (and rf_4_3 (bvult co_4 co_8))
        (and rf_5_3 (bvult co_5 co_8))
        (and rf_8_3 (bvult co_8 co_8)))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_8))
        (and rf_2_3 (bvult co_2 co_8))
        (and rf_4_3 (bvult co_4 co_8))
        (and rf_5_3 (bvult co_5 co_8))
        (and rf_8_3 (bvult co_8 co_8))
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and rf_5_3 false)
        (and rf_8_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false (bvult co_4 co_1) or (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false (bvult co_4 co_2) or (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false (bvult co_4 co_5) or (and true false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false rf_4_6 false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true rf_4_6)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false rf_4_7 false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true rf_4_7)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false (bvult co_4 co_8) or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false (bvult co_4 co_8) or (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false (bvult co_5 co_1) or (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false (bvult co_5 co_2) or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false (bvult co_5 co_2) or (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false (bvult co_5 co_4) or (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and false rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or true rf_5_7 false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or true false false or (and false rf_5_7)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or true false (bvult co_5 co_8) or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or true false (bvult co_5 co_8) or (and false false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_8_6 (bvult co_8 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_8_6 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_4_6 (bvult co_4 co_2))
        (and rf_5_6 (bvult co_5 co_2))
        (and rf_8_6 (bvult co_8 co_2)))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_4_6 (bvult co_4 co_2))
        (and rf_5_6 (bvult co_5 co_2))
        (and rf_8_6 (bvult co_8 co_2))
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_2_6 (bvult co_2 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_5_6 (bvult co_5 co_4))
        (and rf_8_6 (bvult co_8 co_4)))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_2_6 (bvult co_2 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_5_6 (bvult co_5 co_4))
        (and rf_8_6 (bvult co_8 co_4))
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_2_6 (bvult co_2 co_5))
        (and rf_4_6 (bvult co_4 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_8_6 (bvult co_8 co_5)))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_2_6 (bvult co_2 co_5))
        (and rf_4_6 (bvult co_4 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_8_6 (bvult co_8 co_5))
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_8))
        (and rf_2_6 (bvult co_2 co_8))
        (and rf_4_6 (bvult co_4 co_8))
        (and rf_5_6 (bvult co_5 co_8))
        (and rf_8_6 (bvult co_8 co_8)))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_8))
        (and rf_2_6 (bvult co_2 co_8))
        (and rf_4_6 (bvult co_4 co_8))
        (and rf_5_6 (bvult co_5 co_8))
        (and rf_8_6 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_4_6 false)
        (and rf_5_6 false)
        (and rf_8_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_2_7 (bvult co_2 co_1))
        (and rf_4_7 (bvult co_4 co_1))
        (and rf_5_7 (bvult co_5 co_1))
        (and rf_8_7 (bvult co_8 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_2_7 (bvult co_2 co_1))
        (and rf_4_7 (bvult co_4 co_1))
        (and rf_5_7 (bvult co_5 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_2))
        (and rf_2_7 (bvult co_2 co_2))
        (and rf_4_7 (bvult co_4 co_2))
        (and rf_5_7 (bvult co_5 co_2))
        (and rf_8_7 (bvult co_8 co_2)))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_2))
        (and rf_2_7 (bvult co_2 co_2))
        (and rf_4_7 (bvult co_4 co_2))
        (and rf_5_7 (bvult co_5 co_2))
        (and rf_8_7 (bvult co_8 co_2))
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_2_7 (bvult co_2 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_5_7 (bvult co_5 co_4))
        (and rf_8_7 (bvult co_8 co_4)))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_4))
        (and rf_2_7 (bvult co_2 co_4))
        (and rf_4_7 (bvult co_4 co_4))
        (and rf_5_7 (bvult co_5 co_4))
        (and rf_8_7 (bvult co_8 co_4))
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_5))
        (and rf_2_7 (bvult co_2 co_5))
        (and rf_4_7 (bvult co_4 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_8_7 (bvult co_8 co_5)))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_5))
        (and rf_2_7 (bvult co_2 co_5))
        (and rf_4_7 (bvult co_4 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_8_7 (bvult co_8 co_5))
        (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_2_7 (bvult co_2 co_8))
        (and rf_4_7 (bvult co_4 co_8))
        (and rf_5_7 (bvult co_5 co_8))
        (and rf_8_7 (bvult co_8 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_2_7 (bvult co_2 co_8))
        (and rf_4_7 (bvult co_4 co_8))
        (and rf_5_7 (bvult co_5 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_2_7 false)
        (and rf_4_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false (bvult co_8 co_2) or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false (bvult co_8 co_2) or (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false rf_8_3 false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true rf_8_3)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false (bvult co_8 co_4) or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false (bvult co_8 co_4) or (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false (bvult co_8 co_5) or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false (bvult co_8 co_5) or (and false false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false rf_8_6 false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and false rf_8_6)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_10)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_10)))
(assert (=> (or false false false (and rf_0_10 (bvult co_0 co_0)))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false (and rf_0_10 (bvult co_0 co_0)) (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false (and rf_0_10 false) (and true false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false (and rf_0_10 false) (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false false (and rf_0_10 false)) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false false (and rf_0_10 false) (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b100) (= #x00000000 final_y)))
(assert (=> (= co_2 #b100) (= #x00000002 final_y)))
(assert (=> (= co_4 #b100) (= final_y (bvadd read_t0s2b #x00000000))))
(assert (=> (= co_5 #b100) (= #x00000002 final_y)))
(assert (=> (= co_8 #b100)
    (= final_y (bvadd read_t1s2b (ite input_b #x00000001 #x00000002)))))

(check-sat)
