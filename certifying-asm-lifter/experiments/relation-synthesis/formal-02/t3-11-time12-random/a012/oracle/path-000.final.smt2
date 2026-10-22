(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_5 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_2 () (_ BitVec 3))
(declare-fun co_7 () (_ BitVec 3))
(declare-fun co_10 () (_ BitVec 3))
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_10_6 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_4_8 () Bool)
(declare-fun rf_5_8 () Bool)
(declare-fun rf_11_8 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_0_9 () Bool)
(declare-fun rf_4_9 () Bool)
(declare-fun rf_5_9 () Bool)
(declare-fun rf_11_9 () Bool)
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
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b true))
(assert (= (not input_b) true))
(assert (bvult co_0 #b100))
(assert (= co_0 #b000))
(assert (bvult co_4 #b100))
(assert (bvult co_5 #b100))
(assert (bvult co_11 #b100))
(assert (distinct co_0 co_4 co_5 co_11))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_2 #b100))
(assert (bvult co_7 #b100))
(assert (bvult co_10 #b100))
(assert (distinct co_1 co_2 co_7 co_10))
(assert (=> rf_1_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_2_6 (= #x00000001 read_t1s1a)))
(assert (=> rf_7_6
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert (=> rf_10_6 (= #x00000002 read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_6 rf_2_6 rf_7_6 rf_10_6))
(assert (=> rf_0_8 (= #x00000000 read_t1s2a)))
(assert (=> rf_4_8 (= #x00000002 read_t1s2a)))
(assert (=> rf_5_8 (= (ite input_b #x00000001 #x00000002) read_t1s2a)))
(assert (=> rf_11_8 (= (ite input_b #x00000001 #x00000002) read_t1s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_8 rf_4_8 rf_5_8 rf_11_8))
(assert (=> rf_0_9 (= #x00000000 read_t2s0a)))
(assert (=> rf_4_9 (= #x00000002 read_t2s0a)))
(assert (=> rf_5_9 (= (ite input_b #x00000001 #x00000002) read_t2s0a)))
(assert (=> rf_11_9 (= (ite input_b #x00000001 #x00000002) read_t2s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_9 rf_4_9 rf_5_9 rf_11_9))
(assert (not (and (or (and rf_1_6 false)
              (and rf_2_6 false)
              (and rf_7_6 false)
              (and rf_10_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_2_6 (bvult co_2 co_1))
                    (and rf_7_6 (bvult co_7 co_1))
                    (and rf_10_6 (bvult co_10 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_2))
                    (and rf_2_6 (bvult co_2 co_2))
                    (and rf_7_6 (bvult co_7 co_2))
                    (and rf_10_6 (bvult co_10 co_2)))
                (bvult co_2 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_2_6 false)
              (and rf_7_6 false)
              (and rf_10_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_10))
                    (and rf_2_6 (bvult co_2 co_10))
                    (and rf_7_6 (bvult co_7 co_10))
                    (and rf_10_6 (bvult co_10 co_10)))
                (bvult co_10 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_2_6 false)
              (and rf_7_6 false)
              (and rf_10_6 false))
          false)))
(assert (bvult topo_U_0 #xc))
(assert (bvult topo_U_1 #xc))
(assert (bvult topo_U_2 #xc))
(assert (bvult topo_U_3 #xc))
(assert (bvult topo_U_4 #xc))
(assert (bvult topo_U_5 #xc))
(assert (bvult topo_U_6 #xc))
(assert (bvult topo_U_7 #xc))
(assert (bvult topo_U_8 #xc))
(assert (bvult topo_U_9 #xc))
(assert (bvult topo_U_10 #xc))
(assert (bvult topo_U_11 #xc))
(assert (bvult topo_T_0 #xc))
(assert (bvult topo_T_1 #xc))
(assert (bvult topo_T_2 #xc))
(assert (bvult topo_T_3 #xc))
(assert (bvult topo_T_4 #xc))
(assert (bvult topo_T_5 #xc))
(assert (bvult topo_T_6 #xc))
(assert (bvult topo_T_7 #xc))
(assert (bvult topo_T_8 #xc))
(assert (bvult topo_T_9 #xc))
(assert (bvult topo_T_10 #xc))
(assert (bvult topo_T_11 #xc))
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
(assert (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false (bvult co_0 co_5) or (and true false))
    (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false rf_0_9 false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true rf_0_9)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false (bvult co_0 co_11) or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false (bvult co_0 co_11) or (and true false))
    (bvult topo_T_0 topo_T_11)))
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
(assert (=> (or false false (bvult co_1 co_10) or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false (bvult co_1 co_10) or (and true false))
    (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
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
(assert (=> (or true true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false (bvult co_2 co_7) or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false (bvult co_2 co_7) or (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false (bvult co_2 co_10) or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false (bvult co_2 co_10) or (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_11)))
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
(assert (=> (or false false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false (bvult co_4 co_5) or (and true false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false rf_4_8 false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true rf_4_8)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false rf_4_9 false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true rf_4_9)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false (bvult co_4 co_11) or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false (bvult co_4 co_11) or (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false (bvult co_5 co_0) or (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false (bvult co_5 co_4) or (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or true rf_5_8 false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and false rf_5_8)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false rf_5_9 false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true rf_5_9)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false (bvult co_5 co_11) or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false (bvult co_5 co_11) or (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_10_6 (bvult co_10 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_2_6 (bvult co_2 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_10_6 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_7_6 (bvult co_7 co_2))
        (and rf_10_6 (bvult co_10 co_2)))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_2))
        (and rf_2_6 (bvult co_2 co_2))
        (and rf_7_6 (bvult co_7 co_2))
        (and rf_10_6 (bvult co_10 co_2))
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_2_6 (bvult co_2 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_10_6 (bvult co_10 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_2_6 (bvult co_2 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_10_6 (bvult co_10 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_10))
        (and rf_2_6 (bvult co_2 co_10))
        (and rf_7_6 (bvult co_7 co_10))
        (and rf_10_6 (bvult co_10 co_10)))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_10))
        (and rf_2_6 (bvult co_2 co_10))
        (and rf_7_6 (bvult co_7 co_10))
        (and rf_10_6 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_2_6 false)
        (and rf_7_6 false)
        (and rf_10_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_11)))
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
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false (bvult co_7 co_10) or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false (bvult co_7 co_10) or (and true false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_11_8 (bvult co_11 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_11_8 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_5_8 (bvult co_5 co_4))
        (and rf_11_8 (bvult co_11 co_4)))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_5_8 (bvult co_5 co_4))
        (and rf_11_8 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_4_8 (bvult co_4 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_11_8 (bvult co_11 co_5)))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_4_8 (bvult co_4 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_11_8 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_5_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_4_8 (bvult co_4 co_11))
        (and rf_5_8 (bvult co_5 co_11))
        (and rf_11_8 (bvult co_11 co_11)))
    (bvult topo_U_8 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_4_8 (bvult co_4 co_11))
        (and rf_5_8 (bvult co_5 co_11))
        (and rf_11_8 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_5_9 (bvult co_5 co_0))
        (and rf_11_9 (bvult co_11 co_0)))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_5_9 (bvult co_5 co_0))
        (and rf_11_9 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_5_9 (bvult co_5 co_4))
        (and rf_11_9 (bvult co_11 co_4)))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_5_9 (bvult co_5 co_4))
        (and rf_11_9 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_5))
        (and rf_4_9 (bvult co_4 co_5))
        (and rf_5_9 (bvult co_5 co_5))
        (and rf_11_9 (bvult co_11 co_5)))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_5))
        (and rf_4_9 (bvult co_4 co_5))
        (and rf_5_9 (bvult co_5 co_5))
        (and rf_11_9 (bvult co_11 co_5))
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_5_9 false)
        (and rf_11_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_5_9 (bvult co_5 co_11))
        (and rf_11_9 (bvult co_11 co_11)))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_5_9 (bvult co_5 co_11))
        (and rf_11_9 (bvult co_11 co_11))
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false (bvult co_10 co_1) or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false (bvult co_10 co_1) or (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false (bvult co_10 co_2) or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false (bvult co_10 co_2) or (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false rf_10_6 false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and true rf_10_6)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false (bvult co_10 co_7) or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false (bvult co_10 co_7) or (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false (bvult co_11 co_4) or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false (bvult co_11 co_4) or (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false (bvult co_11 co_5) or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false (bvult co_11 co_5) or (and true false))
    (bvult topo_T_11 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false rf_11_8 false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and true rf_11_8)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false rf_11_9 false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false rf_11_9)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (= co_0 #b011) (= #x00000000 final_x)))
(assert (=> (= co_4 #b011) (= #x00000002 final_x)))
(assert (=> (= co_5 #b011) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_11 #b011) (= final_x (ite input_b #x00000001 #x00000002))))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_2 #b011) (= #x00000001 final_y)))
(assert (=> (= co_7 #b011)
    (= final_y (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_10 #b011) (= #x00000002 final_y)))

(check-sat)
