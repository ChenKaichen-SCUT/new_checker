(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun input_b () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun k!0 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!1 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!2 () Bool)
(declare-fun k!3 () Bool)
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_10 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun read_t2s1a () (_ BitVec 32))
(declare-fun rf_10_3 () Bool)
(declare-fun rf_11_3 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_10_5 () Bool)
(declare-fun rf_11_5 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_4_8 () Bool)
(declare-fun rf_10_8 () Bool)
(declare-fun rf_11_8 () Bool)
(declare-fun rf_0_9 () Bool)
(declare-fun rf_4_9 () Bool)
(declare-fun rf_10_9 () Bool)
(declare-fun rf_11_9 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
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
(assert (= input_b input_b))
(assert true)
(assert (= input_b true))
(assert (= input_b true))
(assert (bvult co_0 #b100))
(assert (= co_0 #b000))
(assert (bvult co_4 #b100))
(assert (bvult co_10 #b100))
(assert (bvult co_11 #b100))
(assert (distinct co_0 co_4 co_10 co_11))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_7 #b10))
(assert (distinct co_1 co_7))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert (=> rf_10_3 (= (bvadd read_t2s1a #x00000000) read_t0s1a)))
(assert (=> rf_11_3 (= #x00000000 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_3 rf_4_3 rf_10_3 rf_11_3))
(assert (=> rf_0_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_4_5 (= (bvadd read_t0s1a #x00000001) read_t0s2a)))
(assert (=> rf_10_5 (= (bvadd read_t2s1a #x00000000) read_t0s2a)))
(assert (=> rf_11_5 (= #x00000000 read_t0s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_5 rf_4_5 rf_10_5 rf_11_5))
(assert (=> rf_1_6 (= #x00000000 read_t1s1a)))
(assert (=> rf_7_6
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1) rf_1_6 rf_7_6))
(assert (=> rf_0_8 (= #x00000000 read_t2s0a)))
(assert (=> rf_4_8 (= (bvadd read_t0s1a #x00000001) read_t2s0a)))
(assert (=> rf_10_8 (= (bvadd read_t2s1a #x00000000) read_t2s0a)))
(assert (=> rf_11_8 (= #x00000000 read_t2s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_8 rf_4_8 rf_10_8 rf_11_8))
(assert (=> rf_0_9 (= #x00000000 read_t2s1a)))
(assert (=> rf_4_9 (= (bvadd read_t0s1a #x00000001) read_t2s1a)))
(assert (=> rf_10_9 (= (bvadd read_t2s1a #x00000000) read_t2s1a)))
(assert (=> rf_11_9 (= #x00000000 read_t2s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_0_9 rf_4_9 rf_10_9 rf_11_9))
(assert (let ((a!1 (and (or (and rf_0_9 (bvult co_0 co_0))
                    (and rf_4_9 (bvult co_4 co_0))
                    (and rf_10_9 (bvult co_10 co_0))
                    (and rf_11_9 (bvult co_11 co_0)))
                (bvult co_0 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_0_9 false)
              (and rf_4_9 false)
              (and rf_10_9 false)
              (and rf_11_9 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_9 (bvult co_0 co_4))
                    (and rf_4_9 (bvult co_4 co_4))
                    (and rf_10_9 (bvult co_10 co_4))
                    (and rf_11_9 (bvult co_11 co_4)))
                (bvult co_4 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_0_9 false)
              (and rf_4_9 false)
              (and rf_10_9 false)
              (and rf_11_9 false))
          false)))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_7_6 (bvult co_7 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (not (and (or (and rf_1_6 false) (and rf_7_6 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0))
                    (and rf_10_3 (bvult co_10 co_0))
                    (and rf_11_3 (bvult co_11 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false)
              (and rf_4_3 false)
              (and rf_10_3 false)
              (and rf_11_3 false))
          false)))
(assert (not (and (or (and rf_0_3 false)
              (and rf_4_3 false)
              (and rf_10_3 false)
              (and rf_11_3 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_10))
                    (and rf_4_3 (bvult co_4 co_10))
                    (and rf_10_3 (bvult co_10 co_10))
                    (and rf_11_3 (bvult co_11 co_10)))
                (bvult co_10 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_11))
                    (and rf_4_3 (bvult co_4 co_11))
                    (and rf_10_3 (bvult co_10 co_11))
                    (and rf_11_3 (bvult co_11 co_11)))
                (bvult co_11 co_4))))
  (not a!1)))
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
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false rf_0_9 false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true rf_0_9)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false (bvult co_0 co_10) or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false (bvult co_0 co_10) or (and true false))
    (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false (bvult co_0 co_11) or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false (bvult co_0 co_11) or (and true false))
    (bvult topo_T_0 topo_T_11)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
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
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_10_3 (bvult co_10 co_0))
        (and rf_11_3 (bvult co_11 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_10_3 (bvult co_10 co_0))
        (and rf_11_3 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_10_3 (bvult co_10 co_4))
        (and rf_11_3 (bvult co_11 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_10_3 (bvult co_10 co_4))
        (and rf_11_3 (bvult co_11 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_10_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_10))
        (and rf_4_3 (bvult co_4 co_10))
        (and rf_10_3 (bvult co_10 co_10))
        (and rf_11_3 (bvult co_11 co_10)))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_10))
        (and rf_4_3 (bvult co_4 co_10))
        (and rf_10_3 (bvult co_10 co_10))
        (and rf_11_3 (bvult co_11 co_10))
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_10_3 (bvult co_10 co_11))
        (and rf_11_3 (bvult co_11 co_11)))
    (bvult topo_U_3 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_10_3 (bvult co_10 co_11))
        (and rf_11_3 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_3 topo_T_11)))
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
(assert (=> (or true rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false or (and false rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false rf_4_8 false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true rf_4_8)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false rf_4_9 false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true rf_4_9)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false (bvult co_4 co_10) or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false (bvult co_4 co_10) or (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false (bvult co_4 co_11) or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false (bvult co_4 co_11) or (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_10_5 (bvult co_10 co_0))
        (and rf_11_5 (bvult co_11 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_10_5 (bvult co_10 co_0))
        (and rf_11_5 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_10_5 (bvult co_10 co_4))
        (and rf_11_5 (bvult co_11 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_10_5 (bvult co_10 co_4))
        (and rf_11_5 (bvult co_11 co_4))
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_10_5 false)
        (and rf_11_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_4_5 (bvult co_4 co_10))
        (and rf_10_5 (bvult co_10 co_10))
        (and rf_11_5 (bvult co_11 co_10)))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_10))
        (and rf_4_5 (bvult co_4 co_10))
        (and rf_10_5 (bvult co_10 co_10))
        (and rf_11_5 (bvult co_11 co_10))
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_11))
        (and rf_4_5 (bvult co_4 co_11))
        (and rf_10_5 (bvult co_10 co_11))
        (and rf_11_5 (bvult co_11 co_11)))
    (bvult topo_U_5 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_11))
        (and rf_4_5 (bvult co_4 co_11))
        (and rf_10_5 (bvult co_10 co_11))
        (and rf_11_5 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_7_6 (bvult co_7 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_7_6 (bvult co_7 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false false (and rf_1_6 false) (and rf_7_6 false))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_7_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false (bvult co_7 co_1) or (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_10_8 (bvult co_10 co_0))
        (and rf_11_8 (bvult co_11 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_4_8 (bvult co_4 co_0))
        (and rf_10_8 (bvult co_10 co_0))
        (and rf_11_8 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_10_8 (bvult co_10 co_4))
        (and rf_11_8 (bvult co_11 co_4)))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_4))
        (and rf_4_8 (bvult co_4 co_4))
        (and rf_10_8 (bvult co_10 co_4))
        (and rf_11_8 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 false)
        (and rf_4_8 false)
        (and rf_10_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_10))
        (and rf_4_8 (bvult co_4 co_10))
        (and rf_10_8 (bvult co_10 co_10))
        (and rf_11_8 (bvult co_11 co_10)))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_10))
        (and rf_4_8 (bvult co_4 co_10))
        (and rf_10_8 (bvult co_10 co_10))
        (and rf_11_8 (bvult co_11 co_10))
        (and false false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_4_8 (bvult co_4 co_11))
        (and rf_10_8 (bvult co_10 co_11))
        (and rf_11_8 (bvult co_11 co_11)))
    (bvult topo_U_8 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_4_8 (bvult co_4 co_11))
        (and rf_10_8 (bvult co_10 co_11))
        (and rf_11_8 (bvult co_11 co_11))
        (and false false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_10_9 (bvult co_10 co_0))
        (and rf_11_9 (bvult co_11 co_0)))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_0))
        (and rf_4_9 (bvult co_4 co_0))
        (and rf_10_9 (bvult co_10 co_0))
        (and rf_11_9 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_10_9 (bvult co_10 co_4))
        (and rf_11_9 (bvult co_11 co_4)))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 (bvult co_0 co_4))
        (and rf_4_9 (bvult co_4 co_4))
        (and rf_10_9 (bvult co_10 co_4))
        (and rf_11_9 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_9 false)
        (and rf_4_9 false)
        (and rf_10_9 false)
        (and rf_11_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_10))
        (and rf_4_9 (bvult co_4 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and rf_11_9 (bvult co_11 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_10))
        (and rf_4_9 (bvult co_4 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and rf_11_9 (bvult co_11 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_10_9 (bvult co_10 co_11))
        (and rf_11_9 (bvult co_11 co_11)))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_9 (bvult co_0 co_11))
        (and rf_4_9 (bvult co_4 co_11))
        (and rf_10_9 (bvult co_10 co_11))
        (and rf_11_9 (bvult co_11 co_11))
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false false (bvult co_10 co_0) or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false (bvult co_10 co_0) or (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false rf_10_3 false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true rf_10_3)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false (bvult co_10 co_4) or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false (bvult co_10 co_4) or (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false rf_10_5 false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true rf_10_5)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false rf_10_8 false or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false false or (and false rf_10_8)) (bvult topo_T_10 topo_T_8)))
(assert (=> (or false rf_10_9 false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false rf_10_9)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or true false (bvult co_10 co_11) or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or true false (bvult co_10 co_11) or (and false false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false rf_11_3 false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true rf_11_3)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false (bvult co_11 co_4) or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false (bvult co_11 co_4) or (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false rf_11_5 false or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false false or (and true rf_11_5)) (bvult topo_T_11 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false rf_11_8 false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and false rf_11_8)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false rf_11_9 false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false rf_11_9)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false (bvult co_11 co_10) or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false (bvult co_11 co_10) or (and false false))
    (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (= co_0 #b011) (= #x00000000 final_x)))
(assert (=> (= co_4 #b011) (= final_x (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_10 #b011) (= final_x (bvadd read_t2s1a #x00000000))))
(assert (=> (= co_11 #b011) (= #x00000000 final_x)))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_7 #b01)
    (= final_y (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000000 read_t2s1a)
    (distinct rf_0_3 false)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 true)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_10_5 false)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 true)
    (distinct rf_4_9 false)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b011 co_4)
    (distinct #b001 co_10)
    (distinct #b010 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_10_5 false)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 false)
    (distinct rf_10_5 true)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 false)
    (distinct rf_10_5 false)
    (distinct rf_11_5 true)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000001 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 false)
    (distinct rf_10_5 true)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 false)
    (distinct rf_4_8 true)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000001 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 false)
    (distinct rf_10_5 false)
    (distinct rf_11_5 true)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 false)
    (distinct rf_4_8 true)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000000 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000000 read_t2s1a)
    (distinct rf_0_3 false)
    (distinct rf_4_3 false)
    (distinct rf_10_3 true)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 false)
    (distinct rf_10_5 false)
    (distinct rf_11_5 true)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 true)
    (distinct rf_4_9 false)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b010 co_4)
    (distinct #b001 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct #x00000000 read_t2s1a)
    (distinct rf_0_3 false)
    (distinct rf_4_3 false)
    (distinct rf_10_3 true)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_10_5 false)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 true)
    (distinct rf_4_8 false)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 true)
    (distinct rf_4_9 false)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b010 co_4)
    (distinct #b001 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000001 read_t2s0a)
    (distinct #x00000001 read_t2s1a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_10_3 false)
    (distinct rf_11_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_10_5 false)
    (distinct rf_11_5 false)
    (distinct rf_1_6 true)
    (distinct rf_7_6 false)
    (distinct rf_0_8 false)
    (distinct rf_4_8 true)
    (distinct rf_10_8 false)
    (distinct rf_11_8 false)
    (distinct rf_0_9 false)
    (distinct rf_4_9 true)
    (distinct rf_10_9 false)
    (distinct rf_11_9 false)
    (distinct #b000 co_0)
    (distinct #b001 co_4)
    (distinct #b010 co_10)
    (distinct #b011 co_11)
    (distinct #b00 co_1)
    (distinct #b01 co_7)))
(model-add read_t1s1a () (_ BitVec 32) #x00000000)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add rf_7_6 () Bool false)
(model-add rf_1_6 () Bool true)
(model-add co_0 () (_ BitVec 3) #b000)
(model-add input_b () Bool true)
(model-add final_y () (_ BitVec 32) #x00000001)
(model-del k!0)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!0 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!1)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!1 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!2)
(model-add k!0 () Bool (not k!2))
(model-del k!3)
(model-add k!1 () Bool (not k!3))
(model-add rf_10_9 () Bool false)
(model-add read_t2s0a () (_ BitVec 32) #x00000000)
(model-add read_t2s1a () (_ BitVec 32) #x00000000)
(model-add topo_T_4 () (_ BitVec 4) #xa)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_U_9 () (_ BitVec 4) #x2)
(model-add rf_0_9 () Bool true)
(model-add rf_11_5 () Bool false)
(model-add rf_11_3 () Bool true)
(model-add rf_0_5 () Bool false)
(model-add rf_4_8 () Bool false)
(model-add rf_10_5 () Bool false)
(model-add rf_0_8 () Bool true)
(model-add k!2 () Bool true)
(model-add topo_U_4 () (_ BitVec 4) #x8)
(model-add topo_U_3 () (_ BitVec 4) #x7)
(model-add rf_4_9 () Bool false)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add topo_U_5 () (_ BitVec 4) #xb)
(model-add topo_U_10 () (_ BitVec 4) #x3)
(model-add rf_10_8 () Bool false)
(model-add read_t0s2a () (_ BitVec 32) #x00000001)
(model-add topo_U_11 () (_ BitVec 4) #x4)
(model-add rf_11_9 () Bool false)
(model-add co_4 () (_ BitVec 3) #b011)
(model-add topo_T_5 () (_ BitVec 4) #xb)
(model-add topo_T_6 () (_ BitVec 4) #x1)
(model-add topo_U_8 () (_ BitVec 4) #x1)
(model-add topo_T_7 () (_ BitVec 4) #x3)
(model-add topo_T_9 () (_ BitVec 4) #x2)
(model-add topo_T_11 () (_ BitVec 4) #x8)
(model-add topo_T_8 () (_ BitVec 4) #x1)
(model-add topo_T_10 () (_ BitVec 4) #x3)
(model-add rf_11_8 () Bool false)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add rf_0_3 () Bool false)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_U_7 () (_ BitVec 4) #x2)
(model-add k!3 () Bool true)
(model-add co_10 () (_ BitVec 3) #b001)
(model-add co_7 () (_ BitVec 2) #b01)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add topo_T_3 () (_ BitVec 4) #x9)
(model-add final_x () (_ BitVec 32) #x00000001)
(model-add rf_10_3 () Bool false)
(model-add topo_U_6 () (_ BitVec 4) #x1)
(model-add co_11 () (_ BitVec 3) #b010)
(model-add rf_4_5 () Bool true)

(check-sat)
