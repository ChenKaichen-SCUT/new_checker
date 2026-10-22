(declare-fun co_0 () (_ BitVec 3))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_11_10 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_13_12 () Bool)
(declare-fun rf_1_12 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun read_t2s2a () (_ BitVec 32))
(declare-fun rf_5_4 () Bool)
(declare-fun rf_9_4 () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun co_3 () (_ BitVec 3))
(declare-fun co_5 () (_ BitVec 3))
(declare-fun co_9 () (_ BitVec 3))
(declare-fun co_11 () (_ BitVec 3))
(declare-fun co_13 () (_ BitVec 2))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun rf_9_2 () Bool)
(declare-fun read_t2s1a () (_ BitVec 32))
(declare-fun rf_11_2 () Bool)
(declare-fun rf_0_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_11_4 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_9_6 () Bool)
(declare-fun rf_11_6 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun rf_5_7 () Bool)
(declare-fun rf_9_7 () Bool)
(declare-fun rf_11_7 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
(declare-fun rf_5_8 () Bool)
(declare-fun rf_9_8 () Bool)
(declare-fun rf_11_8 () Bool)
(declare-fun rf_0_10 () Bool)
(declare-fun rf_3_10 () Bool)
(declare-fun rf_5_10 () Bool)
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
(declare-fun topo_U_12 () (_ BitVec 4))
(declare-fun topo_U_13 () (_ BitVec 4))
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
(declare-fun topo_T_13 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) true))
(assert (bvult co_0 #b101))
(assert (= co_0 #b000))
(assert (bvult co_3 #b101))
(assert (bvult co_5 #b101))
(assert (bvult co_9 #b101))
(assert (bvult co_11 #b101))
(assert (distinct co_0 co_3 co_5 co_9 co_11))
(assert (bvult co_1 #b10))
(assert (= co_1 #b00))
(assert (bvult co_13 #b10))
(assert (distinct co_1 co_13))
(assert (=> rf_0_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000001) read_t0s0a)))
(assert (=> rf_5_2 (= (bvadd read_t0s1a #x00000002) read_t0s0a)))
(assert (=> rf_9_2 (= #x00000001 read_t0s0a)))
(assert (=> rf_11_2 (= (bvadd read_t2s1a #x00000002) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_2 rf_3_2 rf_5_2 rf_9_2 rf_11_2))
(assert (=> rf_0_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_3_4 (= (bvadd read_t0s0a #x00000001) read_t0s1a)))
(assert (=> rf_5_4 (= (bvadd read_t0s1a #x00000002) read_t0s1a)))
(assert (=> rf_9_4 (= #x00000001 read_t0s1a)))
(assert (=> rf_11_4 (= (bvadd read_t2s1a #x00000002) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_4 rf_3_4 rf_5_4 rf_9_4 rf_11_4))
(assert (=> rf_0_6 (= #x00000000 read_t0s2a)))
(assert (=> rf_3_6 (= (bvadd read_t0s0a #x00000001) read_t0s2a)))
(assert (=> rf_5_6 (= (bvadd read_t0s1a #x00000002) read_t0s2a)))
(assert (=> rf_9_6 (= #x00000001 read_t0s2a)))
(assert (=> rf_11_6 (= (bvadd read_t2s1a #x00000002) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_6 rf_3_6 rf_5_6 rf_9_6 rf_11_6))
(assert (=> rf_0_7 (= #x00000000 read_t1s0a)))
(assert (=> rf_3_7 (= (bvadd read_t0s0a #x00000001) read_t1s0a)))
(assert (=> rf_5_7 (= (bvadd read_t0s1a #x00000002) read_t1s0a)))
(assert (=> rf_9_7 (= #x00000001 read_t1s0a)))
(assert (=> rf_11_7 (= (bvadd read_t2s1a #x00000002) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_7 rf_3_7 rf_5_7 rf_9_7 rf_11_7))
(assert (=> rf_0_8 (= #x00000000 read_t1s2a)))
(assert (=> rf_3_8 (= (bvadd read_t0s0a #x00000001) read_t1s2a)))
(assert (=> rf_5_8 (= (bvadd read_t0s1a #x00000002) read_t1s2a)))
(assert (=> rf_9_8 (= #x00000001 read_t1s2a)))
(assert (=> rf_11_8 (= (bvadd read_t2s1a #x00000002) read_t1s2a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_8 rf_3_8 rf_5_8 rf_9_8 rf_11_8))
(assert (=> rf_0_10 (= #x00000000 read_t2s1a)))
(assert (=> rf_3_10 (= (bvadd read_t0s0a #x00000001) read_t2s1a)))
(assert (=> rf_5_10 (= (bvadd read_t0s1a #x00000002) read_t2s1a)))
(assert (=> rf_9_10 (= #x00000001 read_t2s1a)))
(assert (=> rf_11_10 (= (bvadd read_t2s1a #x00000002) read_t2s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_0_10 rf_3_10 rf_5_10 rf_9_10 rf_11_10))
(assert (=> rf_1_12 (= #x00000000 read_t2s2a)))
(assert (=> rf_13_12 (= (bvadd read_t2s2a #x00000002) read_t2s2a)))
(assert ((_ pbeq 1 1 1) rf_1_12 rf_13_12))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_0))
                    (and rf_3_2 (bvult co_3 co_0))
                    (and rf_5_2 (bvult co_5 co_0))
                    (and rf_9_2 (bvult co_9 co_0))
                    (and rf_11_2 (bvult co_11 co_0)))
                (bvult co_0 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_5_2 false)
              (and rf_9_2 false)
              (and rf_11_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_9))
                    (and rf_3_2 (bvult co_3 co_9))
                    (and rf_5_2 (bvult co_5 co_9))
                    (and rf_9_2 (bvult co_9 co_9))
                    (and rf_11_2 (bvult co_11 co_9)))
                (bvult co_9 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_2 (bvult co_0 co_11))
                    (and rf_3_2 (bvult co_3 co_11))
                    (and rf_5_2 (bvult co_5 co_11))
                    (and rf_9_2 (bvult co_9 co_11))
                    (and rf_11_2 (bvult co_11 co_11)))
                (bvult co_11 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_0_2 false)
              (and rf_3_2 false)
              (and rf_5_2 false)
              (and rf_9_2 false)
              (and rf_11_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_0))
                    (and rf_3_4 (bvult co_3 co_0))
                    (and rf_5_4 (bvult co_5 co_0))
                    (and rf_9_4 (bvult co_9 co_0))
                    (and rf_11_4 (bvult co_11 co_0)))
                (bvult co_0 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_0_4 false)
              (and rf_3_4 false)
              (and rf_5_4 false)
              (and rf_9_4 false)
              (and rf_11_4 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_9))
                    (and rf_3_4 (bvult co_3 co_9))
                    (and rf_5_4 (bvult co_5 co_9))
                    (and rf_9_4 (bvult co_9 co_9))
                    (and rf_11_4 (bvult co_11 co_9)))
                (bvult co_9 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_4 (bvult co_0 co_11))
                    (and rf_3_4 (bvult co_3 co_11))
                    (and rf_5_4 (bvult co_5 co_11))
                    (and rf_9_4 (bvult co_9 co_11))
                    (and rf_11_4 (bvult co_11 co_11)))
                (bvult co_11 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_0_4 false)
              (and rf_3_4 false)
              (and rf_5_4 false)
              (and rf_9_4 false)
              (and rf_11_4 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_0))
                    (and rf_3_10 (bvult co_3 co_0))
                    (and rf_5_10 (bvult co_5 co_0))
                    (and rf_9_10 (bvult co_9 co_0))
                    (and rf_11_10 (bvult co_11 co_0)))
                (bvult co_0 co_11))))
  (not a!1)))
(assert (not (and (or (and rf_0_10 false)
              (and rf_3_10 false)
              (and rf_5_10 false)
              (and rf_9_10 false)
              (and rf_11_10 false))
          false)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_3))
                    (and rf_3_10 (bvult co_3 co_3))
                    (and rf_5_10 (bvult co_5 co_3))
                    (and rf_9_10 (bvult co_9 co_3))
                    (and rf_11_10 (bvult co_11 co_3)))
                (bvult co_3 co_11))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_10 (bvult co_0 co_5))
                    (and rf_3_10 (bvult co_3 co_5))
                    (and rf_5_10 (bvult co_5 co_5))
                    (and rf_9_10 (bvult co_9 co_5))
                    (and rf_11_10 (bvult co_11 co_5)))
                (bvult co_5 co_11))))
  (not a!1)))
(assert (not (and (or (and rf_1_12 false) (and rf_13_12 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_12 (bvult co_1 co_1))
                    (and rf_13_12 (bvult co_13 co_1)))
                (bvult co_1 co_13))))
  (not a!1)))
(assert (not (and (or (and rf_1_12 false) (and rf_13_12 false)) false)))
(assert (not (and (or (and rf_1_12 false) (and rf_13_12 false)) false)))
(assert (bvult topo_U_0 #xe))
(assert (bvult topo_U_1 #xe))
(assert (bvult topo_U_2 #xe))
(assert (bvult topo_U_3 #xe))
(assert (bvult topo_U_4 #xe))
(assert (bvult topo_U_5 #xe))
(assert (bvult topo_U_6 #xe))
(assert (bvult topo_U_7 #xe))
(assert (bvult topo_U_8 #xe))
(assert (bvult topo_U_9 #xe))
(assert (bvult topo_U_10 #xe))
(assert (bvult topo_U_11 #xe))
(assert (bvult topo_U_12 #xe))
(assert (bvult topo_U_13 #xe))
(assert (bvult topo_T_0 #xe))
(assert (bvult topo_T_1 #xe))
(assert (bvult topo_T_2 #xe))
(assert (bvult topo_T_3 #xe))
(assert (bvult topo_T_4 #xe))
(assert (bvult topo_T_5 #xe))
(assert (bvult topo_T_6 #xe))
(assert (bvult topo_T_7 #xe))
(assert (bvult topo_T_8 #xe))
(assert (bvult topo_T_9 #xe))
(assert (bvult topo_T_10 #xe))
(assert (bvult topo_T_11 #xe))
(assert (bvult topo_T_12 #xe))
(assert (bvult topo_T_13 #xe))
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
(assert (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false (bvult co_0 co_5) or (and true false))
    (bvult topo_T_0 topo_T_5)))
(assert (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false (bvult co_0 co_9) or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false (bvult co_0 co_9) or (and true false))
    (bvult topo_T_0 topo_T_9)))
(assert (=> (or false rf_0_10 false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true rf_0_10)) (bvult topo_T_0 topo_T_10)))
(assert (=> (or false false (bvult co_0 co_11) or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false (bvult co_0 co_11) or (and true false))
    (bvult topo_T_0 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_13)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false rf_1_12 false or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false false or (and true rf_1_12)) (bvult topo_T_1 topo_T_12)))
(assert (=> (or false false (bvult co_1 co_13) or) (bvult topo_U_1 topo_U_13)))
(assert (=> (or false false (bvult co_1 co_13) or (and true false))
    (bvult topo_T_1 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_5_2 (bvult co_5 co_0))
        (and rf_9_2 (bvult co_9 co_0))
        (and rf_11_2 (bvult co_11 co_0)))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_0))
        (and rf_3_2 (bvult co_3 co_0))
        (and rf_5_2 (bvult co_5 co_0))
        (and rf_9_2 (bvult co_9 co_0))
        (and rf_11_2 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_5_2 (bvult co_5 co_3))
        (and rf_9_2 (bvult co_9 co_3))
        (and rf_11_2 (bvult co_11 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_5_2 (bvult co_5 co_3))
        (and rf_9_2 (bvult co_9 co_3))
        (and rf_11_2 (bvult co_11 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_5))
        (and rf_3_2 (bvult co_3 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_9_2 (bvult co_9 co_5))
        (and rf_11_2 (bvult co_11 co_5)))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_2 (bvult co_0 co_5))
        (and rf_3_2 (bvult co_3 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_9_2 (bvult co_9 co_5))
        (and rf_11_2 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_5_2 (bvult co_5 co_9))
        (and rf_9_2 (bvult co_9 co_9))
        (and rf_11_2 (bvult co_11 co_9)))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_9))
        (and rf_3_2 (bvult co_3 co_9))
        (and rf_5_2 (bvult co_5 co_9))
        (and rf_9_2 (bvult co_9 co_9))
        (and rf_11_2 (bvult co_11 co_9))
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_11))
        (and rf_3_2 (bvult co_3 co_11))
        (and rf_5_2 (bvult co_5 co_11))
        (and rf_9_2 (bvult co_9 co_11))
        (and rf_11_2 (bvult co_11 co_11)))
    (bvult topo_U_2 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 (bvult co_0 co_11))
        (and rf_3_2 (bvult co_3 co_11))
        (and rf_5_2 (bvult co_5 co_11))
        (and rf_9_2 (bvult co_9 co_11))
        (and rf_11_2 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_2 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false))
    (bvult topo_U_2 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_9_2 false)
        (and rf_11_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_13)))
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
(assert (=> (or true rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false false or (and false rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert (=> (or true false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or true false (bvult co_3 co_5) or (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or true rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or true false false or (and false rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false (bvult co_3 co_9) or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false (bvult co_3 co_9) or (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false rf_3_10 false or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false false or (and true rf_3_10)) (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false (bvult co_3 co_11) or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false (bvult co_3 co_11) or (and true false))
    (bvult topo_T_3 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_3_4 (bvult co_3 co_0))
        (and rf_5_4 (bvult co_5 co_0))
        (and rf_9_4 (bvult co_9 co_0))
        (and rf_11_4 (bvult co_11 co_0)))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_0))
        (and rf_3_4 (bvult co_3 co_0))
        (and rf_5_4 (bvult co_5 co_0))
        (and rf_9_4 (bvult co_9 co_0))
        (and rf_11_4 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3))
        (and rf_9_4 (bvult co_9 co_3))
        (and rf_11_4 (bvult co_11 co_3)))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3))
        (and rf_9_4 (bvult co_9 co_3))
        (and rf_11_4 (bvult co_11 co_3))
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_9_4 (bvult co_9 co_5))
        (and rf_11_4 (bvult co_11 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_4 (bvult co_0 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_9_4 (bvult co_9 co_5))
        (and rf_11_4 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_9))
        (and rf_3_4 (bvult co_3 co_9))
        (and rf_5_4 (bvult co_5 co_9))
        (and rf_9_4 (bvult co_9 co_9))
        (and rf_11_4 (bvult co_11 co_9)))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_9))
        (and rf_3_4 (bvult co_3 co_9))
        (and rf_5_4 (bvult co_5 co_9))
        (and rf_9_4 (bvult co_9 co_9))
        (and rf_11_4 (bvult co_11 co_9))
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_11))
        (and rf_3_4 (bvult co_3 co_11))
        (and rf_5_4 (bvult co_5 co_11))
        (and rf_9_4 (bvult co_9 co_11))
        (and rf_11_4 (bvult co_11 co_11)))
    (bvult topo_U_4 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_4 (bvult co_0 co_11))
        (and rf_3_4 (bvult co_3 co_11))
        (and rf_5_4 (bvult co_5 co_11))
        (and rf_9_4 (bvult co_9 co_11))
        (and rf_11_4 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false))
    (bvult topo_U_4 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_9_4 false)
        (and rf_11_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_13)))
(assert (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false (bvult co_5 co_0) or (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert (=> (or false false false or (and false rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert (=> (or false false (bvult co_5 co_3) or (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert (=> (or false false (bvult co_5 co_5) or (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or true false false or (and false rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false rf_5_7 false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true rf_5_7)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false rf_5_8 false or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false false or (and true rf_5_8)) (bvult topo_T_5 topo_T_8)))
(assert (=> (or false false (bvult co_5 co_9) or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false (bvult co_5 co_9) or (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false rf_5_10 false or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false false or (and true rf_5_10)) (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false (bvult co_5 co_11) or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false (bvult co_5 co_11) or (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_3_6 (bvult co_3 co_0))
        (and rf_5_6 (bvult co_5 co_0))
        (and rf_9_6 (bvult co_9 co_0))
        (and rf_11_6 (bvult co_11 co_0)))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_3_6 (bvult co_3 co_0))
        (and rf_5_6 (bvult co_5 co_0))
        (and rf_9_6 (bvult co_9 co_0))
        (and rf_11_6 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_3))
        (and rf_3_6 (bvult co_3 co_3))
        (and rf_5_6 (bvult co_5 co_3))
        (and rf_9_6 (bvult co_9 co_3))
        (and rf_11_6 (bvult co_11 co_3)))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_3))
        (and rf_3_6 (bvult co_3 co_3))
        (and rf_5_6 (bvult co_5 co_3))
        (and rf_9_6 (bvult co_9 co_3))
        (and rf_11_6 (bvult co_11 co_3))
        (and false false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_5))
        (and rf_3_6 (bvult co_3 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_9_6 (bvult co_9 co_5))
        (and rf_11_6 (bvult co_11 co_5)))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_5))
        (and rf_3_6 (bvult co_3 co_5))
        (and rf_5_6 (bvult co_5 co_5))
        (and rf_9_6 (bvult co_9 co_5))
        (and rf_11_6 (bvult co_11 co_5))
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_9))
        (and rf_3_6 (bvult co_3 co_9))
        (and rf_5_6 (bvult co_5 co_9))
        (and rf_9_6 (bvult co_9 co_9))
        (and rf_11_6 (bvult co_11 co_9)))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_9))
        (and rf_3_6 (bvult co_3 co_9))
        (and rf_5_6 (bvult co_5 co_9))
        (and rf_9_6 (bvult co_9 co_9))
        (and rf_11_6 (bvult co_11 co_9))
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_11))
        (and rf_3_6 (bvult co_3 co_11))
        (and rf_5_6 (bvult co_5 co_11))
        (and rf_9_6 (bvult co_9 co_11))
        (and rf_11_6 (bvult co_11 co_11)))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_11))
        (and rf_3_6 (bvult co_3 co_11))
        (and rf_5_6 (bvult co_5 co_11))
        (and rf_9_6 (bvult co_9 co_11))
        (and rf_11_6 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false))
    (bvult topo_U_6 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_3_6 false)
        (and rf_5_6 false)
        (and rf_9_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_3_7 (bvult co_3 co_0))
        (and rf_5_7 (bvult co_5 co_0))
        (and rf_9_7 (bvult co_9 co_0))
        (and rf_11_7 (bvult co_11 co_0)))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_0))
        (and rf_3_7 (bvult co_3 co_0))
        (and rf_5_7 (bvult co_5 co_0))
        (and rf_9_7 (bvult co_9 co_0))
        (and rf_11_7 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_5_7 (bvult co_5 co_3))
        (and rf_9_7 (bvult co_9 co_3))
        (and rf_11_7 (bvult co_11 co_3)))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_5_7 (bvult co_5 co_3))
        (and rf_9_7 (bvult co_9 co_3))
        (and rf_11_7 (bvult co_11 co_3))
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_5))
        (and rf_3_7 (bvult co_3 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_9_7 (bvult co_9 co_5))
        (and rf_11_7 (bvult co_11 co_5)))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_5))
        (and rf_3_7 (bvult co_3 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_9_7 (bvult co_9 co_5))
        (and rf_11_7 (bvult co_11 co_5))
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_9))
        (and rf_3_7 (bvult co_3 co_9))
        (and rf_5_7 (bvult co_5 co_9))
        (and rf_9_7 (bvult co_9 co_9))
        (and rf_11_7 (bvult co_11 co_9)))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_9))
        (and rf_3_7 (bvult co_3 co_9))
        (and rf_5_7 (bvult co_5 co_9))
        (and rf_9_7 (bvult co_9 co_9))
        (and rf_11_7 (bvult co_11 co_9))
        (and true false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_11))
        (and rf_3_7 (bvult co_3 co_11))
        (and rf_5_7 (bvult co_5 co_11))
        (and rf_9_7 (bvult co_9 co_11))
        (and rf_11_7 (bvult co_11 co_11)))
    (bvult topo_U_7 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_7 (bvult co_0 co_11))
        (and rf_3_7 (bvult co_3 co_11))
        (and rf_5_7 (bvult co_5 co_11))
        (and rf_9_7 (bvult co_9 co_11))
        (and rf_11_7 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false))
    (bvult topo_U_7 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_9_7 false)
        (and rf_11_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_9_8 (bvult co_9 co_0))
        (and rf_11_8 (bvult co_11 co_0)))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_0))
        (and rf_3_8 (bvult co_3 co_0))
        (and rf_5_8 (bvult co_5 co_0))
        (and rf_9_8 (bvult co_9 co_0))
        (and rf_11_8 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_5_8 (bvult co_5 co_3))
        (and rf_9_8 (bvult co_9 co_3))
        (and rf_11_8 (bvult co_11 co_3)))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_3))
        (and rf_3_8 (bvult co_3 co_3))
        (and rf_5_8 (bvult co_5 co_3))
        (and rf_9_8 (bvult co_9 co_3))
        (and rf_11_8 (bvult co_11 co_3))
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_3_8 (bvult co_3 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_9_8 (bvult co_9 co_5))
        (and rf_11_8 (bvult co_11 co_5)))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_5))
        (and rf_3_8 (bvult co_3 co_5))
        (and rf_5_8 (bvult co_5 co_5))
        (and rf_9_8 (bvult co_9 co_5))
        (and rf_11_8 (bvult co_11 co_5))
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_3_8 (bvult co_3 co_9))
        (and rf_5_8 (bvult co_5 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and rf_11_8 (bvult co_11 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_9))
        (and rf_3_8 (bvult co_3 co_9))
        (and rf_5_8 (bvult co_5 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and rf_11_8 (bvult co_11 co_9))
        (and true false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_3_8 (bvult co_3 co_11))
        (and rf_5_8 (bvult co_5 co_11))
        (and rf_9_8 (bvult co_9 co_11))
        (and rf_11_8 (bvult co_11 co_11)))
    (bvult topo_U_8 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 (bvult co_0 co_11))
        (and rf_3_8 (bvult co_3 co_11))
        (and rf_5_8 (bvult co_5 co_11))
        (and rf_9_8 (bvult co_9 co_11))
        (and rf_11_8 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false))
    (bvult topo_U_8 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_8 false)
        (and rf_3_8 false)
        (and rf_5_8 false)
        (and rf_9_8 false)
        (and rf_11_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_13)))
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
(assert (=> (or false rf_9_4 false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true rf_9_4)) (bvult topo_T_9 topo_T_4)))
(assert (=> (or false false (bvult co_9 co_5) or) (bvult topo_U_9 topo_U_5)))
(assert (=> (or false false (bvult co_9 co_5) or (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false rf_9_6 false or) (bvult topo_U_9 topo_U_6)))
(assert (=> (or false false false or (and true rf_9_6)) (bvult topo_T_9 topo_T_6)))
(assert (=> (or false rf_9_7 false or) (bvult topo_U_9 topo_U_7)))
(assert (=> (or false false false or (and true rf_9_7)) (bvult topo_T_9 topo_T_7)))
(assert (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert (=> (or false false false or (and true rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert (=> (or false false (bvult co_9 co_9) or (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true rf_9_10 false or) (bvult topo_U_9 topo_U_10)))
(assert (=> (or true false false or (and false rf_9_10)) (bvult topo_T_9 topo_T_10)))
(assert (=> (or true false (bvult co_9 co_11) or) (bvult topo_U_9 topo_U_11)))
(assert (=> (or true false (bvult co_9 co_11) or (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_12)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_9 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_13)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_9 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_3_10 (bvult co_3 co_0))
        (and rf_5_10 (bvult co_5 co_0))
        (and rf_9_10 (bvult co_9 co_0))
        (and rf_11_10 (bvult co_11 co_0)))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_3_10 (bvult co_3 co_0))
        (and rf_5_10 (bvult co_5 co_0))
        (and rf_9_10 (bvult co_9 co_0))
        (and rf_11_10 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_3))
        (and rf_3_10 (bvult co_3 co_3))
        (and rf_5_10 (bvult co_5 co_3))
        (and rf_9_10 (bvult co_9 co_3))
        (and rf_11_10 (bvult co_11 co_3)))
    (bvult topo_U_10 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_3))
        (and rf_3_10 (bvult co_3 co_3))
        (and rf_5_10 (bvult co_5 co_3))
        (and rf_9_10 (bvult co_9 co_3))
        (and rf_11_10 (bvult co_11 co_3))
        (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_5))
        (and rf_3_10 (bvult co_3 co_5))
        (and rf_5_10 (bvult co_5 co_5))
        (and rf_9_10 (bvult co_9 co_5))
        (and rf_11_10 (bvult co_11 co_5)))
    (bvult topo_U_10 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_5))
        (and rf_3_10 (bvult co_3 co_5))
        (and rf_5_10 (bvult co_5 co_5))
        (and rf_9_10 (bvult co_9 co_5))
        (and rf_11_10 (bvult co_11 co_5))
        (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_9))
        (and rf_3_10 (bvult co_3 co_9))
        (and rf_5_10 (bvult co_5 co_9))
        (and rf_9_10 (bvult co_9 co_9))
        (and rf_11_10 (bvult co_11 co_9)))
    (bvult topo_U_10 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_9))
        (and rf_3_10 (bvult co_3 co_9))
        (and rf_5_10 (bvult co_5 co_9))
        (and rf_9_10 (bvult co_9 co_9))
        (and rf_11_10 (bvult co_11 co_9))
        (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_11))
        (and rf_3_10 (bvult co_3 co_11))
        (and rf_5_10 (bvult co_5 co_11))
        (and rf_9_10 (bvult co_9 co_11))
        (and rf_11_10 (bvult co_11 co_11)))
    (bvult topo_U_10 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_0_10 (bvult co_0 co_11))
        (and rf_3_10 (bvult co_3 co_11))
        (and rf_5_10 (bvult co_5 co_11))
        (and rf_9_10 (bvult co_9 co_11))
        (and rf_11_10 (bvult co_11 co_11))
        (and false false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false))
    (bvult topo_U_10 topo_U_13)))
(assert (=> (or true
        false
        false
        (and rf_0_10 false)
        (and rf_3_10 false)
        (and rf_5_10 false)
        (and rf_9_10 false)
        (and rf_11_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_13)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false rf_11_2 false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true rf_11_2)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false (bvult co_11 co_3) or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false (bvult co_11 co_3) or (and true false))
    (bvult topo_T_11 topo_T_3)))
(assert (=> (or false rf_11_4 false or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false false or (and true rf_11_4)) (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false (bvult co_11 co_5) or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false (bvult co_11 co_5) or (and true false))
    (bvult topo_T_11 topo_T_5)))
(assert (=> (or false rf_11_6 false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true rf_11_6)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false rf_11_7 false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true rf_11_7)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false rf_11_8 false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and true rf_11_8)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false (bvult co_11 co_9) or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false (bvult co_11 co_9) or (and false false))
    (bvult topo_T_11 topo_T_9)))
(assert (=> (or false rf_11_10 false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false rf_11_10)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_12)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_11 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_13)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_11 topo_T_13)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_12 (bvult co_1 co_1))
        (and rf_13_12 (bvult co_13 co_1)))
    (bvult topo_U_12 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_12 (bvult co_1 co_1))
        (and rf_13_12 (bvult co_13 co_1))
        (and true false))
    (bvult topo_T_12 topo_T_1)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_2)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_3)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_4)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_5)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_6)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_7)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and true false))
    (bvult topo_T_12 topo_T_8)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_9)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_10)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_11)))
(assert (=> (or false false false (and rf_1_12 false) (and rf_13_12 false))
    (bvult topo_U_12 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_12 false)
        (and rf_13_12 false)
        (and false false))
    (bvult topo_T_12 topo_T_12)))
(assert (=> (or true
        false
        false
        (and rf_1_12 (bvult co_1 co_13))
        (and rf_13_12 (bvult co_13 co_13)))
    (bvult topo_U_12 topo_U_13)))
(assert (=> (or true
        false
        false
        (and rf_1_12 (bvult co_1 co_13))
        (and rf_13_12 (bvult co_13 co_13))
        (and false false))
    (bvult topo_T_12 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_0)))
(assert (=> (or false false (bvult co_13 co_1) or) (bvult topo_U_13 topo_U_1)))
(assert (=> (or false false (bvult co_13 co_1) or (and true false))
    (bvult topo_T_13 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_11)))
(assert (=> (or false rf_13_12 false or) (bvult topo_U_13 topo_U_12)))
(assert (=> (or false false false or (and false rf_13_12)) (bvult topo_T_13 topo_T_12)))
(assert (=> (or false false (bvult co_13 co_13) or) (bvult topo_U_13 topo_U_13)))
(assert (=> (or false false (bvult co_13 co_13) or (and false false))
    (bvult topo_T_13 topo_T_13)))
(assert (=> (= co_0 #b100) (= #x00000000 final_x)))
(assert (=> (= co_3 #b100) (= final_x (bvadd read_t0s0a #x00000001))))
(assert (=> (= co_5 #b100) (= final_x (bvadd read_t0s1a #x00000002))))
(assert (=> (= co_9 #b100) (= #x00000001 final_x)))
(assert (=> (= co_11 #b100) (= final_x (bvadd read_t2s1a #x00000002))))
(assert (=> (= co_1 #b01) (= #x00000000 final_y)))
(assert (=> (= co_13 #b01) (= final_y (bvadd read_t2s2a #x00000002))))
(model-add co_0 () (_ BitVec 3) #b000)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_11_10 () Bool false)
(model-add rf_3_2 () Bool false)
(model-add rf_13_12 () Bool false)
(model-add rf_1_12 () Bool true)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-add read_t2s2a () (_ BitVec 32) #x00000000)
(model-add rf_5_4 () Bool false)
(model-add rf_9_4 () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)

(check-sat)
