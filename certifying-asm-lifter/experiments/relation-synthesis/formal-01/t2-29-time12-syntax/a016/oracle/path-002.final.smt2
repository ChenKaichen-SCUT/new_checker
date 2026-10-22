(declare-fun rf_7_6 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun rf_9_8 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun co_1 () (_ BitVec 3))
(declare-fun rf_5_4 () Bool)
(declare-fun input_b () Bool)
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_9 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 3))
(declare-fun co_7 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_9_2 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t0s2b () (_ BitVec 32))
(declare-fun rf_7_4 () Bool)
(declare-fun rf_11_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_11_6 () Bool)
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_0_10 () Bool)
(declare-fun rf_3_10 () Bool)
(declare-fun rf_9_10 () Bool)
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
(assert (= (not input_b) false))
(assert (= input_b true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_3 #b11))
(assert (bvult co_9 #b11))
(assert (distinct co_0 co_3 co_9))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_5 #b100))
(assert (bvult co_7 #b100))
(assert (bvult co_11 #b100))
(assert (distinct co_1 co_5 co_7 co_11))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000001) read_t0s0a)))
(assert (=> rf_9_2 (= (bvadd read_t1s0a #x00000002) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_9_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_5_4 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert (=> rf_7_4 (= (bvadd read_t0s2b #x00000002) read_t0s1a)))
(assert (=> rf_11_4 (= #x00000002 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_4 rf_5_4 rf_7_4 rf_11_4))
(assert (=> rf_1_6 (= #x00000000 read_t0s2b)))
(assert (=> rf_5_6 (= (bvadd read_t0s1a #x00000001) read_t0s2b)))
(assert (=> rf_7_6 (= (bvadd read_t0s2b #x00000002) read_t0s2b)))
(assert (=> rf_11_6 (= #x00000002 read_t0s2b)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_6 rf_5_6 rf_7_6 rf_11_6))
(assert (=> rf_0_8 (= #x00000000 read_t1s0a)))
(assert (=> rf_3_8 (= (bvadd read_t0s0a #x00000001) read_t1s0a)))
(assert (=> rf_9_8 (= (bvadd read_t1s0a #x00000002) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1) rf_0_8 rf_3_8 rf_9_8))
(assert (=> rf_0_10 (= #x00000000 read_t1s1a)))
(assert (=> rf_3_10 (= (bvadd read_t0s0a #x00000001) read_t1s1a)))
(assert (=> rf_9_10 (= (bvadd read_t1s0a #x00000002) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_10 rf_3_10 rf_9_10))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0))
                    (and rf_9_2 (bvult co_9 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_9))
                    (and rf_3_2 (bvult co_3 co_9))
                    (and rf_9_2 (bvult co_9 co_9)))
                (bvult co_9 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false)) false)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_5_6 false)
              (and rf_7_6 false)
              (and rf_11_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_5_6 (bvult co_5 co_1))
                    (and rf_7_6 (bvult co_7 co_1))
                    (and rf_11_6 (bvult co_11 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false)
              (and rf_5_6 false)
              (and rf_7_6 false)
              (and rf_11_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_11))
                    (and rf_5_6 (bvult co_5 co_11))
                    (and rf_7_6 (bvult co_7 co_11))
                    (and rf_11_6 (bvult co_11 co_11)))
                (bvult co_11 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_4 false)
              (and rf_5_4 false)
              (and rf_7_4 false)
              (and rf_11_4 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_1))
                    (and rf_5_4 (bvult co_5 co_1))
                    (and rf_7_4 (bvult co_7 co_1))
                    (and rf_11_4 (bvult co_11 co_1)))
                (bvult co_1 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_1_4 false)
              (and rf_5_4 false)
              (and rf_7_4 false)
              (and rf_11_4 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_11))
                    (and rf_5_4 (bvult co_5 co_11))
                    (and rf_7_4 (bvult co_7 co_11))
                    (and rf_11_4 (bvult co_11 co_11)))
                (bvult co_11 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_0))
                    (and rf_3_8 (bvult co_3 co_0))
                    (and rf_9_8 (bvult co_9 co_0)))
                (bvult co_0 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_8 (bvult co_0 co_3))
                    (and rf_3_8 (bvult co_3 co_3))
                    (and rf_9_8 (bvult co_9 co_3)))
                (bvult co_3 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false)) false)))
(assert (not (and (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false)) false)))
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
(assert (=> (or false false (bvult co_0 co_9) or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false (bvult co_0 co_9) or (and true false))
    (bvult topo_T_0 topo_T_9)))
(assert (=> (or false rf_0_10 false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true rf_0_10)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_11)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false (bvult co_1 co_11) or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false (bvult co_1 co_11) or (and true false))
    (bvult topo_T_1 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_9_2 (bvult co_9 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_9_2 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_9_2 (bvult co_9 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_9_2 (bvult co_9 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_9_2 (bvult co_9 co_9)))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_9_2 (bvult co_9 co_9))
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false))
    (bvult topo_U_2 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_9_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_11)))
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
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false (bvult co_3 co_9) or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false (bvult co_3 co_9) or (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false rf_3_10 false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true rf_3_10)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_7_4 (bvult co_7 co_1))
        (and rf_11_4 (bvult co_11 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_7_4 (bvult co_7 co_1))
        (and rf_11_4 (bvult co_11 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_7_4 (bvult co_7 co_5))
        (and rf_11_4 (bvult co_11 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_7_4 (bvult co_7 co_5))
        (and rf_11_4 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_5_4 (bvult co_5 co_7))
        (and rf_7_4 (bvult co_7 co_7))
        (and rf_11_4 (bvult co_11 co_7)))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_7))
        (and rf_5_4 (bvult co_5 co_7))
        (and rf_7_4 (bvult co_7 co_7))
        (and rf_11_4 (bvult co_11 co_7))
        (and false false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_5_4 false)
        (and rf_7_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_11))
        (and rf_5_4 (bvult co_5 co_11))
        (and rf_7_4 (bvult co_7 co_11))
        (and rf_11_4 (bvult co_11 co_11)))
    (bvult topo_U_4 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_11))
        (and rf_5_4 (bvult co_5 co_11))
        (and rf_7_4 (bvult co_7 co_11))
        (and rf_11_4 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_4 topo_T_11)))
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
(assert (=> (or true rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or true false false or (and false rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or true false (bvult co_5 co_7) or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or true false (bvult co_5 co_7) or (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false (bvult co_5 co_11) or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false (bvult co_5 co_11) or (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_11_6 (bvult co_11 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_5_6 (bvult co_5 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_11_6 (bvult co_11 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_7_6 (bvult co_7 co_5))
        (and rf_11_6 (bvult co_11 co_5)))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_7_6 (bvult co_7 co_5))
        (and rf_11_6 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_5_6 (bvult co_5 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_11_6 (bvult co_11 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_5_6 (bvult co_5 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_11_6 (bvult co_11 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_5_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_11))
        (and rf_5_6 (bvult co_5 co_11))
        (and rf_7_6 (bvult co_7 co_11))
        (and rf_11_6 (bvult co_11 co_11)))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_11))
        (and rf_5_6 (bvult co_5 co_11))
        (and rf_7_6 (bvult co_7 co_11))
        (and rf_11_6 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and false rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false (bvult co_7 co_5) or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false (bvult co_7 co_5) or (and false false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false (bvult co_7 co_11) or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false (bvult co_7 co_11) or (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0))
        (and rf_9_8 (bvult co_9 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0))
        (and rf_9_8 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_9_8 (bvult co_9 co_3)))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_9_8 (bvult co_9 co_3))
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_3_8 (bvult co_3 co_9))
        (and rf_9_8 (bvult co_9 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_3_8 (bvult co_3 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false))
    (bvult topo_U_8 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_9_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false false (bvult co_9 co_0) or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false (bvult co_9 co_0) or (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_1)))
(assert (=> (or false rf_9_2 false or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false false or (and true rf_9_2)) (bvult topo_T_9 topo_T_2)))
(assert (=> (or false false (bvult co_9 co_3) or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false (bvult co_9 co_3) or (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true rf_9_10 false or) (bvult topo_U_9 topo_U_10)))
(assert (=> (or true false false or (and false rf_9_10)) (bvult topo_T_9 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_11)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_9 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_3_10 (bvult co_3 co_0))
        (and rf_9_10 (bvult co_9 co_0)))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_3_10 (bvult co_3 co_0))
        (and rf_9_10 (bvult co_9 co_0))
        (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_3))
        (and rf_3_10 (bvult co_3 co_3))
        (and rf_9_10 (bvult co_9 co_3)))
    (bvult topo_U_10 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_3))
        (and rf_3_10 (bvult co_3 co_3))
        (and rf_9_10 (bvult co_9 co_3))
        (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_9))
        (and rf_3_10 (bvult co_3 co_9))
        (and rf_9_10 (bvult co_9 co_9)))
    (bvult topo_U_10 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_9))
        (and rf_3_10 (bvult co_3 co_9))
        (and rf_9_10 (bvult co_9 co_9))
        (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false))
    (bvult topo_U_10 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_9_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false (bvult co_11 co_1) or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false (bvult co_11 co_1) or (and true false))
    (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false rf_11_4 false or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false false or (and true rf_11_4)) (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false (bvult co_11 co_5) or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false (bvult co_11 co_5) or (and true false))
    (bvult topo_T_11 topo_T_5)))
(assert (=> (or false rf_11_6 false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true rf_11_6)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false (bvult co_11 co_7) or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false (bvult co_11 co_7) or (and true false))
    (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_3 #b10) (= final_x (bvadd read_t0s0a #x00000001))))
(assert (=> (= co_9 #b10) (= final_x (bvadd read_t1s0a #x00000002))))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_5 #b011) (= final_y (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_7 #b011) (= final_y (bvadd read_t0s2b #x00000002))))
(assert (=> (= co_11 #b011) (= #x00000002 final_y)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2b)
    (distinct #x00000001 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_9_2 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 false)
    (distinct rf_3_8 true)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b010 co_7)
    (distinct #b011 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b010 co_7)
    (distinct #b011 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 true)
    (distinct rf_9_10 false)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b010 co_7)
    (distinct #b011 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000002 read_t0s1a)
    (distinct #x00000003 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 false)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 true)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b010 co_5)
    (distinct #b011 co_7)
    (distinct #b001 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000002 read_t0s1a)
    (distinct #x00000003 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 false)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 true)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 true)
    (distinct rf_9_10 false)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b010 co_5)
    (distinct #b011 co_7)
    (distinct #b001 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000002 read_t0s1a)
    (distinct #x00000003 read_t0s2b)
    (distinct #x00000001 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_9_2 false)
    (distinct rf_1_4 false)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 true)
    (distinct rf_1_6 false)
    (distinct rf_5_6 true)
    (distinct rf_7_6 false)
    (distinct rf_11_6 false)
    (distinct rf_0_8 false)
    (distinct rf_3_8 true)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_9)
    (distinct #b000 co_1)
    (distinct #b010 co_5)
    (distinct #b011 co_7)
    (distinct #b001 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t0s2b)
    (distinct #x00000001 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 true)
    (distinct rf_3_2 false)
    (distinct rf_9_2 false)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 false)
    (distinct rf_7_6 false)
    (distinct rf_11_6 true)
    (distinct rf_0_8 false)
    (distinct rf_3_8 true)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b01 co_3)
    (distinct #b10 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b011 co_7)
    (distinct #b010 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000002 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 false)
    (distinct rf_7_6 false)
    (distinct rf_11_6 true)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 false)
    (distinct rf_9_10 true)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b011 co_7)
    (distinct #b010 co_11)))
(assert (or (distinct input_b true)
    (distinct #x00000002 read_t0s0a)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000002 read_t0s2b)
    (distinct #x00000000 read_t1s0a)
    (distinct #x00000003 read_t1s1a)
    (distinct rf_0_2 false)
    (distinct rf_3_2 false)
    (distinct rf_9_2 true)
    (distinct rf_1_4 true)
    (distinct rf_5_4 false)
    (distinct rf_7_4 false)
    (distinct rf_11_4 false)
    (distinct rf_1_6 false)
    (distinct rf_5_6 false)
    (distinct rf_7_6 false)
    (distinct rf_11_6 true)
    (distinct rf_0_8 true)
    (distinct rf_3_8 false)
    (distinct rf_9_8 false)
    (distinct rf_0_10 false)
    (distinct rf_3_10 true)
    (distinct rf_9_10 false)
    (distinct #b00 co_0)
    (distinct #b10 co_3)
    (distinct #b01 co_9)
    (distinct #b000 co_1)
    (distinct #b001 co_5)
    (distinct #b011 co_7)
    (distinct #b010 co_11)))
(model-add rf_7_6 () Bool false)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add rf_9_8 () Bool false)
(model-add rf_3_2 () Bool false)
(model-add co_1 () (_ BitVec 3) #b000)
(model-add rf_5_4 () Bool false)
(model-add input_b () Bool true)
(model-add rf_1_4 () Bool true)
(model-add rf_3_8 () Bool true)
(model-add co_7 () (_ BitVec 3) #b010)
(model-add read_t0s0a () (_ BitVec 32) #x00000000)
(model-add topo_U_10 () (_ BitVec 4) #x6)
(model-add topo_U_11 () (_ BitVec 4) #x9)
(model-add rf_0_8 () Bool false)
(model-add topo_U_4 () (_ BitVec 4) #x1)
(model-add topo_U_5 () (_ BitVec 4) #x3)
(model-add rf_9_2 () Bool false)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add topo_T_9 () (_ BitVec 4) #x8)
(model-add rf_3_10 () Bool false)
(model-add read_t0s2b () (_ BitVec 32) #x00000001)
(model-add co_3 () (_ BitVec 2) #b01)
(model-add topo_T_10 () (_ BitVec 4) #xa)
(model-add topo_T_3 () (_ BitVec 4) #x2)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add rf_11_6 () Bool false)
(model-add topo_U_6 () (_ BitVec 4) #x4)
(model-add co_11 () (_ BitVec 3) #b011)
(model-add co_5 () (_ BitVec 3) #b001)
(model-add read_t1s0a () (_ BitVec 32) #x00000001)
(model-add topo_T_4 () (_ BitVec 4) #x4)
(model-add topo_T_1 () (_ BitVec 4) #x1)
(model-add topo_U_9 () (_ BitVec 4) #x5)
(model-add topo_T_5 () (_ BitVec 4) #x5)
(model-add topo_T_11 () (_ BitVec 4) #xb)
(model-add rf_11_4 () Bool false)
(model-add rf_9_10 () Bool true)
(model-add topo_U_3 () (_ BitVec 4) #x3)
(model-add rf_7_4 () Bool false)
(model-add read_t1s1a () (_ BitVec 32) #x00000003)
(model-add topo_U_2 () (_ BitVec 4) #x2)
(model-add topo_T_6 () (_ BitVec 4) #x9)
(model-add rf_0_2 () Bool true)
(model-add topo_U_8 () (_ BitVec 4) #x4)
(model-add topo_T_7 () (_ BitVec 4) #xa)
(model-add topo_T_8 () (_ BitVec 4) #x3)
(model-add rf_1_6 () Bool false)
(model-add final_x () (_ BitVec 32) #x00000003)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add topo_U_7 () (_ BitVec 4) #x8)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_T_2 () (_ BitVec 4) #x1)
(model-add rf_5_6 () Bool true)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add co_9 () (_ BitVec 2) #b10)
(model-add rf_0_10 () Bool false)

(check-sat)
