(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_10 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_3 () (_ BitVec 3))
(declare-fun co_7 () (_ BitVec 3))
(declare-fun co_12 () (_ BitVec 3))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t2s2a () (_ BitVec 32))
(declare-fun rf_12_2 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_10_5 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_3_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_12_6 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_1_9 () Bool)
(declare-fun rf_3_9 () Bool)
(declare-fun rf_7_9 () Bool)
(declare-fun rf_12_9 () Bool)
(declare-fun rf_1_11 () Bool)
(declare-fun rf_3_11 () Bool)
(declare-fun rf_7_11 () Bool)
(declare-fun rf_12_11 () Bool)
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
(declare-fun topo_U_11 () (_ BitVec 4))
(declare-fun topo_U_12 () (_ BitVec 4))
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
(declare-fun topo_T_11 () (_ BitVec 4))
(declare-fun topo_T_12 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (not input_b) false))
(assert (= (not input_b) true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_10 #b11))
(assert (distinct co_0 co_4 co_10))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_3 #b100))
(assert (bvult co_7 #b100))
(assert (bvult co_12 #b100))
(assert (distinct co_1 co_3 co_7 co_12))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2
    (= (bvadd read_t0s0a (ite input_b #x00000001 #x00000002)) read_t0s0a)))
(assert (=> rf_7_2 (= (bvadd read_t1s1a #x00000001) read_t0s0a)))
(assert (=> rf_12_2 (= (bvadd read_t2s2a #x00000000) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_2 rf_3_2 rf_7_2 rf_12_2))
(assert (=> rf_0_5 (= #x00000000 read_t1s0a)))
(assert (=> rf_4_5 (= (ite input_b #x00000001 #x00000002) read_t1s0a)))
(assert (=> rf_10_5 (= #x00000001 read_t1s0a)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_4_5 rf_10_5))
(assert (=> rf_1_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_3_6
    (= (bvadd read_t0s0a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert (=> rf_7_6 (= (bvadd read_t1s1a #x00000001) read_t1s1a)))
(assert (=> rf_12_6 (= (bvadd read_t2s2a #x00000000) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_6 rf_3_6 rf_7_6 rf_12_6))
(assert (=> rf_1_9 (= #x00000000 read_t2s0a)))
(assert (=> rf_3_9
    (= (bvadd read_t0s0a (ite input_b #x00000001 #x00000002)) read_t2s0a)))
(assert (=> rf_7_9 (= (bvadd read_t1s1a #x00000001) read_t2s0a)))
(assert (=> rf_12_9 (= (bvadd read_t2s2a #x00000000) read_t2s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_9 rf_3_9 rf_7_9 rf_12_9))
(assert (=> rf_1_11 (= #x00000000 read_t2s2a)))
(assert (=> rf_3_11
    (= (bvadd read_t0s0a (ite input_b #x00000001 #x00000002)) read_t2s2a)))
(assert (=> rf_7_11 (= (bvadd read_t1s1a #x00000001) read_t2s2a)))
(assert (=> rf_12_11 (= (bvadd read_t2s2a #x00000000) read_t2s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_11 rf_3_11 rf_7_11 rf_12_11))
(assert (not (and (or (and rf_1_2 false)
              (and rf_3_2 false)
              (and rf_7_2 false)
              (and rf_12_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1))
                    (and rf_7_2 (bvult co_7 co_1))
                    (and rf_12_2 (bvult co_12 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_7))
                    (and rf_3_2 (bvult co_3 co_7))
                    (and rf_7_2 (bvult co_7 co_7))
                    (and rf_12_2 (bvult co_12 co_7)))
                (bvult co_7 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_2 false)
              (and rf_3_2 false)
              (and rf_7_2 false)
              (and rf_12_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_12))
                    (and rf_3_2 (bvult co_3 co_12))
                    (and rf_7_2 (bvult co_7 co_12))
                    (and rf_12_2 (bvult co_12 co_12)))
                (bvult co_12 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_3_6 false)
              (and rf_7_6 false)
              (and rf_12_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_3_6 (bvult co_3 co_1))
                    (and rf_7_6 (bvult co_7 co_1))
                    (and rf_12_6 (bvult co_12 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_3))
                    (and rf_3_6 (bvult co_3 co_3))
                    (and rf_7_6 (bvult co_7 co_3))
                    (and rf_12_6 (bvult co_12 co_3)))
                (bvult co_3 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_3_6 false)
              (and rf_7_6 false)
              (and rf_12_6 false))
          false)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_3_6 false)
              (and rf_7_6 false)
              (and rf_12_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_12))
                    (and rf_3_6 (bvult co_3 co_12))
                    (and rf_7_6 (bvult co_7 co_12))
                    (and rf_12_6 (bvult co_12 co_12)))
                (bvult co_12 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_11 false)
              (and rf_3_11 false)
              (and rf_7_11 false)
              (and rf_12_11 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_11 (bvult co_1 co_1))
                    (and rf_3_11 (bvult co_3 co_1))
                    (and rf_7_11 (bvult co_7 co_1))
                    (and rf_12_11 (bvult co_12 co_1)))
                (bvult co_1 co_12))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_11 (bvult co_1 co_3))
                    (and rf_3_11 (bvult co_3 co_3))
                    (and rf_7_11 (bvult co_7 co_3))
                    (and rf_12_11 (bvult co_12 co_3)))
                (bvult co_3 co_12))))
  (not a!1)))
(assert (not (and (or (and rf_1_11 false)
              (and rf_3_11 false)
              (and rf_7_11 false)
              (and rf_12_11 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_11 (bvult co_1 co_7))
                    (and rf_3_11 (bvult co_3 co_7))
                    (and rf_7_11 (bvult co_7 co_7))
                    (and rf_12_11 (bvult co_12 co_7)))
                (bvult co_7 co_12))))
  (not a!1)))
(assert (bvult topo_U_0 #xd))
(assert (bvult topo_U_1 #xd))
(assert (bvult topo_U_2 #xd))
(assert (bvult topo_U_3 #xd))
(assert (bvult topo_U_4 #xd))
(assert (bvult topo_U_5 #xd))
(assert (bvult topo_U_6 #xd))
(assert (bvult topo_U_7 #xd))
(assert (bvult topo_U_8 #xd))
(assert (bvult topo_U_9 #xd))
(assert (bvult topo_U_10 #xd))
(assert (bvult topo_U_11 #xd))
(assert (bvult topo_U_12 #xd))
(assert (bvult topo_T_0 #xd))
(assert (bvult topo_T_1 #xd))
(assert (bvult topo_T_2 #xd))
(assert (bvult topo_T_3 #xd))
(assert (bvult topo_T_4 #xd))
(assert (bvult topo_T_5 #xd))
(assert (bvult topo_T_6 #xd))
(assert (bvult topo_T_7 #xd))
(assert (bvult topo_T_8 #xd))
(assert (bvult topo_T_9 #xd))
(assert (bvult topo_T_10 #xd))
(assert (bvult topo_T_11 #xd))
(assert (bvult topo_T_12 #xd))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false (bvult co_0 co_10) or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false (bvult co_0 co_10) or (and true false))
    (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_12)))
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
(assert (=> (or false rf_1_9 false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true rf_1_9)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false rf_1_11 false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true rf_1_11)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false false (bvult co_1 co_12) or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false (bvult co_1 co_12) or (and true false))
    (bvult topo_T_1 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_7_2 (bvult co_7 co_1))
        (and rf_12_2 (bvult co_12 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_7_2 (bvult co_7 co_1))
        (and rf_12_2 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_7_2 (bvult co_7 co_3))
        (and rf_12_2 (bvult co_12 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_7_2 (bvult co_7 co_3))
        (and rf_12_2 (bvult co_12 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_7))
        (and rf_3_2 (bvult co_3 co_7))
        (and rf_7_2 (bvult co_7 co_7))
        (and rf_12_2 (bvult co_12 co_7)))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_7))
        (and rf_3_2 (bvult co_3 co_7))
        (and rf_7_2 (bvult co_7 co_7))
        (and rf_12_2 (bvult co_12 co_7))
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false))
    (bvult topo_U_2 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_7_2 false)
        (and rf_12_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_12))
        (and rf_3_2 (bvult co_3 co_12))
        (and rf_7_2 (bvult co_7 co_12))
        (and rf_12_2 (bvult co_12 co_12)))
    (bvult topo_U_2 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_12))
        (and rf_3_2 (bvult co_3 co_12))
        (and rf_7_2 (bvult co_7 co_12))
        (and rf_12_2 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_2 topo_T_12)))
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
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false (bvult co_3 co_7) or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false (bvult co_3 co_7) or (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false rf_3_9 false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true rf_3_9)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false rf_3_11 false or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false false or (and true rf_3_11)) (bvult topo_T_3 topo_T_11)))
(assert (=> (or false false (bvult co_3 co_12) or) (bvult topo_U_3 topo_U_12)))
(assert (=> (or false false (bvult co_3 co_12) or (and true false))
    (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false (bvult co_4 co_0) or (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false (bvult co_4 co_10) or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false (bvult co_4 co_10) or (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_10_5 (bvult co_10 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_10_5 (bvult co_10 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_10_5 (bvult co_10 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_10_5 (bvult co_10 co_4))
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_4_5 (bvult co_4 co_10))
        (and rf_10_5 (bvult co_10 co_10)))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_4_5 (bvult co_4 co_10))
        (and rf_10_5 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false))
    (bvult topo_U_5 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_3_6 (bvult co_3 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_12_6 (bvult co_12 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_3_6 (bvult co_3 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_12_6 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_3))
        (and rf_3_6 (bvult co_3 co_3))
        (and rf_7_6 (bvult co_7 co_3))
        (and rf_12_6 (bvult co_12 co_3)))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_3))
        (and rf_3_6 (bvult co_3 co_3))
        (and rf_7_6 (bvult co_7 co_3))
        (and rf_12_6 (bvult co_12 co_3))
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_3_6 (bvult co_3 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_12_6 (bvult co_12 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_3_6 (bvult co_3 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_12_6 (bvult co_12 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_3_6 false)
        (and rf_7_6 false)
        (and rf_12_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_12))
        (and rf_3_6 (bvult co_3 co_12))
        (and rf_7_6 (bvult co_7 co_12))
        (and rf_12_6 (bvult co_12 co_12)))
    (bvult topo_U_6 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_12))
        (and rf_3_6 (bvult co_3 co_12))
        (and rf_7_6 (bvult co_7 co_12))
        (and rf_12_6 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_6 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false (bvult co_7 co_3) or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false (bvult co_7 co_3) or (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false rf_7_9 false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and true rf_7_9)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_10)))
(assert (=> (or false rf_7_11 false or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false false or (and true rf_7_11)) (bvult topo_T_7 topo_T_11)))
(assert (=> (or false false (bvult co_7 co_12) or) (bvult topo_U_7 topo_U_12)))
(assert (=> (or false false (bvult co_7 co_12) or (and true false))
    (bvult topo_T_7 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_3_9 (bvult co_3 co_1))
        (and rf_7_9 (bvult co_7 co_1))
        (and rf_12_9 (bvult co_12 co_1)))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_3_9 (bvult co_3 co_1))
        (and rf_7_9 (bvult co_7 co_1))
        (and rf_12_9 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_3))
        (and rf_3_9 (bvult co_3 co_3))
        (and rf_7_9 (bvult co_7 co_3))
        (and rf_12_9 (bvult co_12 co_3)))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_3))
        (and rf_3_9 (bvult co_3 co_3))
        (and rf_7_9 (bvult co_7 co_3))
        (and rf_12_9 (bvult co_12 co_3))
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_7))
        (and rf_3_9 (bvult co_3 co_7))
        (and rf_7_9 (bvult co_7 co_7))
        (and rf_12_9 (bvult co_12 co_7)))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_7))
        (and rf_3_9 (bvult co_3 co_7))
        (and rf_7_9 (bvult co_7 co_7))
        (and rf_12_9 (bvult co_12 co_7))
        (and true false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_7_9 false)
        (and rf_12_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_12))
        (and rf_3_9 (bvult co_3 co_12))
        (and rf_7_9 (bvult co_7 co_12))
        (and rf_12_9 (bvult co_12 co_12)))
    (bvult topo_U_9 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_12))
        (and rf_3_9 (bvult co_3 co_12))
        (and rf_7_9 (bvult co_7 co_12))
        (and rf_12_9 (bvult co_12 co_12))
        (and false false))
    (bvult topo_T_9 topo_T_12)))
(assert (=> (or false false (bvult co_10 co_0) or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false (bvult co_10 co_0) or (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false (bvult co_10 co_4) or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false (bvult co_10 co_4) or (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false rf_10_5 false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true rf_10_5)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_12)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_10 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_1))
        (and rf_3_11 (bvult co_3 co_1))
        (and rf_7_11 (bvult co_7 co_1))
        (and rf_12_11 (bvult co_12 co_1)))
    (bvult topo_U_11 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_1))
        (and rf_3_11 (bvult co_3 co_1))
        (and rf_7_11 (bvult co_7 co_1))
        (and rf_12_11 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_11 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_3))
        (and rf_3_11 (bvult co_3 co_3))
        (and rf_7_11 (bvult co_7 co_3))
        (and rf_12_11 (bvult co_12 co_3)))
    (bvult topo_U_11 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_3))
        (and rf_3_11 (bvult co_3 co_3))
        (and rf_7_11 (bvult co_7 co_3))
        (and rf_12_11 (bvult co_12 co_3))
        (and true false))
    (bvult topo_T_11 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_7))
        (and rf_3_11 (bvult co_3 co_7))
        (and rf_7_11 (bvult co_7 co_7))
        (and rf_12_11 (bvult co_12 co_7)))
    (bvult topo_U_11 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_11 (bvult co_1 co_7))
        (and rf_3_11 (bvult co_3 co_7))
        (and rf_7_11 (bvult co_7 co_7))
        (and rf_12_11 (bvult co_12 co_7))
        (and true false))
    (bvult topo_T_11 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false))
    (bvult topo_U_11 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_11 false)
        (and rf_3_11 false)
        (and rf_7_11 false)
        (and rf_12_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or true
        false
        false
        (and rf_1_11 (bvult co_1 co_12))
        (and rf_3_11 (bvult co_3 co_12))
        (and rf_7_11 (bvult co_7 co_12))
        (and rf_12_11 (bvult co_12 co_12)))
    (bvult topo_U_11 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_1_11 (bvult co_1 co_12))
        (and rf_3_11 (bvult co_3 co_12))
        (and rf_7_11 (bvult co_7 co_12))
        (and rf_12_11 (bvult co_12 co_12))
        (and false false))
    (bvult topo_T_11 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_0)))
(assert (=> (or false false (bvult co_12 co_1) or) (bvult topo_U_12 topo_U_1)))
(assert (=> (or false false (bvult co_12 co_1) or (and true false))
    (bvult topo_T_12 topo_T_1)))
(assert (=> (or false rf_12_2 false or) (bvult topo_U_12 topo_U_2)))
(assert (=> (or false false false or (and true rf_12_2)) (bvult topo_T_12 topo_T_2)))
(assert (=> (or false false (bvult co_12 co_3) or) (bvult topo_U_12 topo_U_3)))
(assert (=> (or false false (bvult co_12 co_3) or (and true false))
    (bvult topo_T_12 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_5)))
(assert (=> (or false rf_12_6 false or) (bvult topo_U_12 topo_U_6)))
(assert (=> (or false false false or (and true rf_12_6)) (bvult topo_T_12 topo_T_6)))
(assert (=> (or false false (bvult co_12 co_7) or) (bvult topo_U_12 topo_U_7)))
(assert (=> (or false false (bvult co_12 co_7) or (and true false))
    (bvult topo_T_12 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_8)))
(assert (=> (or false rf_12_9 false or) (bvult topo_U_12 topo_U_9)))
(assert (=> (or false false false or (and false rf_12_9)) (bvult topo_T_12 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_12 topo_T_10)))
(assert (=> (or false rf_12_11 false or) (bvult topo_U_12 topo_U_11)))
(assert (=> (or false false false or (and false rf_12_11)) (bvult topo_T_12 topo_T_11)))
(assert (=> (or false false (bvult co_12 co_12) or) (bvult topo_U_12 topo_U_12)))
(assert (=> (or false false (bvult co_12 co_12) or (and false false))
    (bvult topo_T_12 topo_T_12)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_4 #b10) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_10 #b10) (= #x00000001 final_x)))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_3 #b011)
    (= final_y (bvadd read_t0s0a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_7 #b011) (= final_y (bvadd read_t1s1a #x00000001))))
(assert (=> (= co_12 #b011) (= final_y (bvadd read_t2s2a #x00000000))))

(check-sat)
