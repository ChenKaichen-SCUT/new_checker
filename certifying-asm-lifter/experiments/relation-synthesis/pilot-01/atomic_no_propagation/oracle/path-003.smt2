(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_7 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_7_3 () Bool)
(declare-fun read_t2s2a () (_ BitVec 32))
(declare-fun rf_11_3 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_4_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_11_6 () Bool)
(declare-fun read_t1s2b () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_1_10 () Bool)
(declare-fun rf_4_10 () Bool)
(declare-fun rf_7_10 () Bool)
(declare-fun rf_11_10 () Bool)
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
(assert (= input_b false))
(assert (= (= #x00000000 #x00000000) false))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b100))
(assert (= co_1 #b000))
(assert (bvult co_4 #b100))
(assert (bvult co_7 #b100))
(assert (bvult co_11 #b100))
(assert (distinct co_1 co_4 co_7 co_11))
(assert (=> rf_1_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000000) read_t0s1a)))
(assert (=> rf_7_3 (= (bvadd read_t1s0a #x00000001) read_t0s1a)))
(assert (=> rf_11_3 (= (bvadd read_t2s2a #x00000001) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_3 rf_4_3 rf_7_3 rf_11_3))
(assert (=> rf_1_6 (= #x00000000 read_t1s0a)))
(assert (=> rf_4_6 (= (bvadd read_t0s1a #x00000000) read_t1s0a)))
(assert (=> rf_7_6 (= (bvadd read_t1s0a #x00000001) read_t1s0a)))
(assert (=> rf_11_6 (= (bvadd read_t2s2a #x00000001) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_6 rf_4_6 rf_7_6 rf_11_6))
(assert (=> rf_0_8 (= #x00000000 read_t1s2b)))
(assert ((_ pbeq 1 1) rf_0_8))
(assert (=> rf_1_10 (= #x00000000 read_t2s2a)))
(assert (=> rf_4_10 (= (bvadd read_t0s1a #x00000000) read_t2s2a)))
(assert (=> rf_7_10 (= (bvadd read_t1s0a #x00000001) read_t2s2a)))
(assert (=> rf_11_10 (= (bvadd read_t2s2a #x00000001) read_t2s2a)))
(assert ((_ pbeq 1 1 1 1 1) rf_1_10 rf_4_10 rf_7_10 rf_11_10))
(assert (not (and (or (and rf_1_6 false)
              (and rf_4_6 false)
              (and rf_7_6 false)
              (and rf_11_6 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_1))
                    (and rf_4_6 (bvult co_4 co_1))
                    (and rf_7_6 (bvult co_7 co_1))
                    (and rf_11_6 (bvult co_11 co_1)))
                (bvult co_1 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_4))
                    (and rf_4_6 (bvult co_4 co_4))
                    (and rf_7_6 (bvult co_7 co_4))
                    (and rf_11_6 (bvult co_11 co_4)))
                (bvult co_4 co_7))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_6 (bvult co_1 co_11))
                    (and rf_4_6 (bvult co_4 co_11))
                    (and rf_7_6 (bvult co_7 co_11))
                    (and rf_11_6 (bvult co_11 co_11)))
                (bvult co_11 co_7))))
  (not a!1)))
(assert (not (and (or (and rf_1_10 false)
              (and rf_4_10 false)
              (and rf_7_10 false)
              (and rf_11_10 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_10 (bvult co_1 co_1))
                    (and rf_4_10 (bvult co_4 co_1))
                    (and rf_7_10 (bvult co_7 co_1))
                    (and rf_11_10 (bvult co_11 co_1)))
                (bvult co_1 co_11))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_10 (bvult co_1 co_4))
                    (and rf_4_10 (bvult co_4 co_4))
                    (and rf_7_10 (bvult co_7 co_4))
                    (and rf_11_10 (bvult co_11 co_4)))
                (bvult co_4 co_11))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_10 (bvult co_1 co_7))
                    (and rf_4_10 (bvult co_4 co_7))
                    (and rf_7_10 (bvult co_7 co_7))
                    (and rf_11_10 (bvult co_11 co_7)))
                (bvult co_7 co_11))))
  (not a!1)))
(assert (not (and (or (and rf_1_3 false)
              (and rf_4_3 false)
              (and rf_7_3 false)
              (and rf_11_3 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_1))
                    (and rf_4_3 (bvult co_4 co_1))
                    (and rf_7_3 (bvult co_7 co_1))
                    (and rf_11_3 (bvult co_11 co_1)))
                (bvult co_1 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_7))
                    (and rf_4_3 (bvult co_4 co_7))
                    (and rf_7_3 (bvult co_7 co_7))
                    (and rf_11_3 (bvult co_11 co_7)))
                (bvult co_7 co_4))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_3 (bvult co_1 co_11))
                    (and rf_4_3 (bvult co_4 co_11))
                    (and rf_7_3 (bvult co_7 co_11))
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
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_11)))
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
(assert (=> (or false rf_1_10 false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true rf_1_10)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false (bvult co_1 co_11) or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false (bvult co_1 co_11) or (and true false))
    (bvult topo_T_1 topo_T_11)))
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
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_7_3 (bvult co_7 co_1))
        (and rf_11_3 (bvult co_11 co_1)))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_1))
        (and rf_4_3 (bvult co_4 co_1))
        (and rf_7_3 (bvult co_7 co_1))
        (and rf_11_3 (bvult co_11 co_1))
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_7_3 (bvult co_7 co_4))
        (and rf_11_3 (bvult co_11 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_3 (bvult co_1 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_7_3 (bvult co_7 co_4))
        (and rf_11_3 (bvult co_11 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_7))
        (and rf_4_3 (bvult co_4 co_7))
        (and rf_7_3 (bvult co_7 co_7))
        (and rf_11_3 (bvult co_11 co_7)))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_7))
        (and rf_4_3 (bvult co_4 co_7))
        (and rf_7_3 (bvult co_7 co_7))
        (and rf_11_3 (bvult co_11 co_7))
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 false)
        (and rf_4_3 false)
        (and rf_7_3 false)
        (and rf_11_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_7_3 (bvult co_7 co_11))
        (and rf_11_3 (bvult co_11 co_11)))
    (bvult topo_U_3 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_3 (bvult co_1 co_11))
        (and rf_4_3 (bvult co_4 co_11))
        (and rf_7_3 (bvult co_7 co_11))
        (and rf_11_3 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_3 topo_T_11)))
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
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false rf_4_6 false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true rf_4_6)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false (bvult co_4 co_7) or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false (bvult co_4 co_7) or (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false rf_4_10 false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true rf_4_10)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false (bvult co_4 co_11) or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false (bvult co_4 co_11) or (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_11_6 (bvult co_11 co_1)))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_1))
        (and rf_4_6 (bvult co_4 co_1))
        (and rf_7_6 (bvult co_7 co_1))
        (and rf_11_6 (bvult co_11 co_1))
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_7_6 (bvult co_7 co_4))
        (and rf_11_6 (bvult co_11 co_4)))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_4))
        (and rf_4_6 (bvult co_4 co_4))
        (and rf_7_6 (bvult co_7 co_4))
        (and rf_11_6 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_4_6 (bvult co_4 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_11_6 (bvult co_11 co_7)))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or true
        false
        false
        (and rf_1_6 (bvult co_1 co_7))
        (and rf_4_6 (bvult co_4 co_7))
        (and rf_7_6 (bvult co_7 co_7))
        (and rf_11_6 (bvult co_11 co_7))
        (and false false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 false)
        (and rf_4_6 false)
        (and rf_7_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_11))
        (and rf_4_6 (bvult co_4 co_11))
        (and rf_7_6 (bvult co_7 co_11))
        (and rf_11_6 (bvult co_11 co_11)))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_6 (bvult co_1 co_11))
        (and rf_4_6 (bvult co_4 co_11))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false rf_7_3 false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true rf_7_3)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false (bvult co_7 co_4) or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false (bvult co_7 co_4) or (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false (bvult co_7 co_7) or (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false rf_7_10 false or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false false or (and true rf_7_10)) (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false (bvult co_7 co_11) or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false (bvult co_7 co_11) or (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false false false (and rf_0_8 (bvult co_0 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false (and rf_0_8 (bvult co_0 co_0)) (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false (and rf_0_8 false) (and false false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false (and rf_0_8 false) (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false false (and rf_0_8 false) (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_10)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false false (and rf_0_8 false)) (bvult topo_U_8 topo_U_11)))
(assert (=> (or false false false (and rf_0_8 false) (and true false))
    (bvult topo_T_8 topo_T_11)))
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
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_9 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_1))
        (and rf_4_10 (bvult co_4 co_1))
        (and rf_7_10 (bvult co_7 co_1))
        (and rf_11_10 (bvult co_11 co_1)))
    (bvult topo_U_10 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_1))
        (and rf_4_10 (bvult co_4 co_1))
        (and rf_7_10 (bvult co_7 co_1))
        (and rf_11_10 (bvult co_11 co_1))
        (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_4))
        (and rf_4_10 (bvult co_4 co_4))
        (and rf_7_10 (bvult co_7 co_4))
        (and rf_11_10 (bvult co_11 co_4)))
    (bvult topo_U_10 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_4))
        (and rf_4_10 (bvult co_4 co_4))
        (and rf_7_10 (bvult co_7 co_4))
        (and rf_11_10 (bvult co_11 co_4))
        (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_7))
        (and rf_4_10 (bvult co_4 co_7))
        (and rf_7_10 (bvult co_7 co_7))
        (and rf_11_10 (bvult co_11 co_7)))
    (bvult topo_U_10 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_10 (bvult co_1 co_7))
        (and rf_4_10 (bvult co_4 co_7))
        (and rf_7_10 (bvult co_7 co_7))
        (and rf_11_10 (bvult co_11 co_7))
        (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_10 false)
        (and rf_4_10 false)
        (and rf_7_10 false)
        (and rf_11_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_1_10 (bvult co_1 co_11))
        (and rf_4_10 (bvult co_4 co_11))
        (and rf_7_10 (bvult co_7 co_11))
        (and rf_11_10 (bvult co_11 co_11)))
    (bvult topo_U_10 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_1_10 (bvult co_1 co_11))
        (and rf_4_10 (bvult co_4 co_11))
        (and rf_7_10 (bvult co_7 co_11))
        (and rf_11_10 (bvult co_11 co_11))
        (and false false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false (bvult co_11 co_1) or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false (bvult co_11 co_1) or (and true false))
    (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false rf_11_3 false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true rf_11_3)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false (bvult co_11 co_4) or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false (bvult co_11 co_4) or (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_5)))
(assert (=> (or false rf_11_6 false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true rf_11_6)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false (bvult co_11 co_7) or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false (bvult co_11 co_7) or (and true false))
    (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false rf_11_10 false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false rf_11_10)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b011) (= #x00000000 final_y)))
(assert (=> (= co_4 #b011) (= final_y (bvadd read_t0s1a #x00000000))))
(assert (=> (= co_7 #b011) (= final_y (bvadd read_t1s0a #x00000001))))
(assert (=> (= co_11 #b011) (= final_y (bvadd read_t2s2a #x00000001))))

(check-sat)
