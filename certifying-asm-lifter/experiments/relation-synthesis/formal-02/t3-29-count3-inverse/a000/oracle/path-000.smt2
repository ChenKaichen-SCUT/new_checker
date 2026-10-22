(declare-fun input_b () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_11 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_3 () (_ BitVec 3))
(declare-fun co_5 () (_ BitVec 3))
(declare-fun co_8 () (_ BitVec 3))
(declare-fun co_10 () (_ BitVec 3))
(declare-fun read_t0s0a () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_8_2 () Bool)
(declare-fun rf_10_2 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_8_4 () Bool)
(declare-fun rf_10_4 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_11_6 () Bool)
(declare-fun rf_1_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun rf_5_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun rf_10_7 () Bool)
(declare-fun rf_1_9 () Bool)
(declare-fun rf_3_9 () Bool)
(declare-fun rf_5_9 () Bool)
(declare-fun rf_8_9 () Bool)
(declare-fun rf_10_9 () Bool)
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
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) true))
(assert (= (= #x00000000 read_t1s1a) true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_11 #b10))
(assert (distinct co_0 co_11))
(assert (bvult co_1 #b101))
(assert (= co_1 #b000))
(assert (bvult co_3 #b101))
(assert (bvult co_5 #b101))
(assert (bvult co_8 #b101))
(assert (bvult co_10 #b101))
(assert (distinct co_1 co_3 co_5 co_8 co_10))
(assert (=> rf_1_2 (= #x00000000 read_t0s0a)))
(assert (=> rf_3_2 (= (bvadd read_t0s0a #x00000001) read_t0s0a)))
(assert (=> rf_5_2 (= (bvadd read_t0s1a #x00000000) read_t0s0a)))
(assert (=> rf_8_2 (= (bvadd read_t1s0a #x00000002) read_t0s0a)))
(assert (=> rf_10_2 (= (bvadd read_t1s1a #x00000000) read_t0s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_2 rf_3_2 rf_5_2 rf_8_2 rf_10_2))
(assert (=> rf_1_4 (= #x00000000 read_t0s1a)))
(assert (=> rf_3_4 (= (bvadd read_t0s0a #x00000001) read_t0s1a)))
(assert (=> rf_5_4 (= (bvadd read_t0s1a #x00000000) read_t0s1a)))
(assert (=> rf_8_4 (= (bvadd read_t1s0a #x00000002) read_t0s1a)))
(assert (=> rf_10_4 (= (bvadd read_t1s1a #x00000000) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_4 rf_3_4 rf_5_4 rf_8_4 rf_10_4))
(assert (=> rf_0_6 (= #x00000000 read_t0s2a)))
(assert (=> rf_11_6 (= #x00000001 read_t0s2a)))
(assert ((_ pbeq 1 1 1) rf_0_6 rf_11_6))
(assert (=> rf_1_7 (= #x00000000 read_t1s0a)))
(assert (=> rf_3_7 (= (bvadd read_t0s0a #x00000001) read_t1s0a)))
(assert (=> rf_5_7 (= (bvadd read_t0s1a #x00000000) read_t1s0a)))
(assert (=> rf_8_7 (= (bvadd read_t1s0a #x00000002) read_t1s0a)))
(assert (=> rf_10_7 (= (bvadd read_t1s1a #x00000000) read_t1s0a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_7 rf_3_7 rf_5_7 rf_8_7 rf_10_7))
(assert (=> rf_1_9 (= #x00000000 read_t1s1a)))
(assert (=> rf_3_9 (= (bvadd read_t0s0a #x00000001) read_t1s1a)))
(assert (=> rf_5_9 (= (bvadd read_t0s1a #x00000000) read_t1s1a)))
(assert (=> rf_8_9 (= (bvadd read_t1s0a #x00000002) read_t1s1a)))
(assert (=> rf_10_9 (= (bvadd read_t1s1a #x00000000) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_9 rf_3_9 rf_5_9 rf_8_9 rf_10_9))
(assert (not (and (or (and rf_1_2 false)
              (and rf_3_2 false)
              (and rf_5_2 false)
              (and rf_8_2 false)
              (and rf_10_2 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1))
                    (and rf_5_2 (bvult co_5 co_1))
                    (and rf_8_2 (bvult co_8 co_1))
                    (and rf_10_2 (bvult co_10 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_8))
                    (and rf_3_2 (bvult co_3 co_8))
                    (and rf_5_2 (bvult co_5 co_8))
                    (and rf_8_2 (bvult co_8 co_8))
                    (and rf_10_2 (bvult co_10 co_8)))
                (bvult co_8 co_3))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_10))
                    (and rf_3_2 (bvult co_3 co_10))
                    (and rf_5_2 (bvult co_5 co_10))
                    (and rf_8_2 (bvult co_8 co_10))
                    (and rf_10_2 (bvult co_10 co_10)))
                (bvult co_10 co_3))))
  (not a!1)))
(assert (not (and (or (and rf_1_2 false)
              (and rf_3_2 false)
              (and rf_5_2 false)
              (and rf_8_2 false)
              (and rf_10_2 false))
          false)))
(assert (not (and (or (and rf_1_4 false)
              (and rf_3_4 false)
              (and rf_5_4 false)
              (and rf_8_4 false)
              (and rf_10_4 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_1))
                    (and rf_3_4 (bvult co_3 co_1))
                    (and rf_5_4 (bvult co_5 co_1))
                    (and rf_8_4 (bvult co_8 co_1))
                    (and rf_10_4 (bvult co_10 co_1)))
                (bvult co_1 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_8))
                    (and rf_3_4 (bvult co_3 co_8))
                    (and rf_5_4 (bvult co_5 co_8))
                    (and rf_8_4 (bvult co_8 co_8))
                    (and rf_10_4 (bvult co_10 co_8)))
                (bvult co_8 co_5))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_4 (bvult co_1 co_10))
                    (and rf_3_4 (bvult co_3 co_10))
                    (and rf_5_4 (bvult co_5 co_10))
                    (and rf_8_4 (bvult co_8 co_10))
                    (and rf_10_4 (bvult co_10 co_10)))
                (bvult co_10 co_5))))
  (not a!1)))
(assert (not (and (or (and rf_1_4 false)
              (and rf_3_4 false)
              (and rf_5_4 false)
              (and rf_8_4 false)
              (and rf_10_4 false))
          false)))
(assert (not (and (or (and rf_1_9 false)
              (and rf_3_9 false)
              (and rf_5_9 false)
              (and rf_8_9 false)
              (and rf_10_9 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_1))
                    (and rf_3_9 (bvult co_3 co_1))
                    (and rf_5_9 (bvult co_5 co_1))
                    (and rf_8_9 (bvult co_8 co_1))
                    (and rf_10_9 (bvult co_10 co_1)))
                (bvult co_1 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_3))
                    (and rf_3_9 (bvult co_3 co_3))
                    (and rf_5_9 (bvult co_5 co_3))
                    (and rf_8_9 (bvult co_8 co_3))
                    (and rf_10_9 (bvult co_10 co_3)))
                (bvult co_3 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_5))
                    (and rf_3_9 (bvult co_3 co_5))
                    (and rf_5_9 (bvult co_5 co_5))
                    (and rf_8_9 (bvult co_8 co_5))
                    (and rf_10_9 (bvult co_10 co_5)))
                (bvult co_5 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false)
              (and rf_3_7 false)
              (and rf_5_7 false)
              (and rf_8_7 false)
              (and rf_10_7 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_1))
                    (and rf_3_7 (bvult co_3 co_1))
                    (and rf_5_7 (bvult co_5 co_1))
                    (and rf_8_7 (bvult co_8 co_1))
                    (and rf_10_7 (bvult co_10 co_1)))
                (bvult co_1 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_3))
                    (and rf_3_7 (bvult co_3 co_3))
                    (and rf_5_7 (bvult co_5 co_3))
                    (and rf_8_7 (bvult co_8 co_3))
                    (and rf_10_7 (bvult co_10 co_3)))
                (bvult co_3 co_8))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_5))
                    (and rf_3_7 (bvult co_3 co_5))
                    (and rf_5_7 (bvult co_5 co_5))
                    (and rf_8_7 (bvult co_8 co_5))
                    (and rf_10_7 (bvult co_10 co_5)))
                (bvult co_5 co_8))))
  (not a!1)))
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
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_10)))
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
(assert (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false (bvult co_1 co_3) or (and true false))
    (bvult topo_T_1 topo_T_3)))
(assert (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false (bvult co_1 co_5) or (and true false))
    (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false false (bvult co_1 co_8) or) (bvult topo_U_1 topo_U_8)))
(assert (=> (or false false (bvult co_1 co_8) or (and true false))
    (bvult topo_T_1 topo_T_8)))
(assert (=> (or false rf_1_9 false or) (bvult topo_U_1 topo_U_9)))
(assert (=> (or false false false or (and true rf_1_9)) (bvult topo_T_1 topo_T_9)))
(assert (=> (or false false (bvult co_1 co_10) or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false (bvult co_1 co_10) or (and true false))
    (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_5_2 (bvult co_5 co_1))
        (and rf_8_2 (bvult co_8 co_1))
        (and rf_10_2 (bvult co_10 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_5_2 (bvult co_5 co_1))
        (and rf_8_2 (bvult co_8 co_1))
        (and rf_10_2 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_5_2 (bvult co_5 co_3))
        (and rf_8_2 (bvult co_8 co_3))
        (and rf_10_2 (bvult co_10 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_5_2 (bvult co_5 co_3))
        (and rf_8_2 (bvult co_8 co_3))
        (and rf_10_2 (bvult co_10 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_5))
        (and rf_3_2 (bvult co_3 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_8_2 (bvult co_8 co_5))
        (and rf_10_2 (bvult co_10 co_5)))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_5))
        (and rf_3_2 (bvult co_3 co_5))
        (and rf_5_2 (bvult co_5 co_5))
        (and rf_8_2 (bvult co_8 co_5))
        (and rf_10_2 (bvult co_10 co_5))
        (and false false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_8))
        (and rf_3_2 (bvult co_3 co_8))
        (and rf_5_2 (bvult co_5 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and rf_10_2 (bvult co_10 co_8)))
    (bvult topo_U_2 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_8))
        (and rf_3_2 (bvult co_3 co_8))
        (and rf_5_2 (bvult co_5 co_8))
        (and rf_8_2 (bvult co_8 co_8))
        (and rf_10_2 (bvult co_10 co_8))
        (and true false))
    (bvult topo_T_2 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_10))
        (and rf_3_2 (bvult co_3 co_10))
        (and rf_5_2 (bvult co_5 co_10))
        (and rf_8_2 (bvult co_8 co_10))
        (and rf_10_2 (bvult co_10 co_10)))
    (bvult topo_U_2 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_10))
        (and rf_3_2 (bvult co_3 co_10))
        (and rf_5_2 (bvult co_5 co_10))
        (and rf_8_2 (bvult co_8 co_10))
        (and rf_10_2 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_2 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false))
    (bvult topo_U_2 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_5_2 false)
        (and rf_8_2 false)
        (and rf_10_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_13)))
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
(assert (=> (or true false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or true false (bvult co_3 co_5) or (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false (bvult co_3 co_8) or) (bvult topo_U_3 topo_U_8)))
(assert (=> (or false false (bvult co_3 co_8) or (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false rf_3_9 false or) (bvult topo_U_3 topo_U_9)))
(assert (=> (or false false false or (and true rf_3_9)) (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false (bvult co_3 co_10) or) (bvult topo_U_3 topo_U_10)))
(assert (=> (or false false (bvult co_3 co_10) or (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_3_4 (bvult co_3 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_8_4 (bvult co_8 co_1))
        (and rf_10_4 (bvult co_10 co_1)))
    (bvult topo_U_4 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_1))
        (and rf_3_4 (bvult co_3 co_1))
        (and rf_5_4 (bvult co_5 co_1))
        (and rf_8_4 (bvult co_8 co_1))
        (and rf_10_4 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3))
        (and rf_8_4 (bvult co_8 co_3))
        (and rf_10_4 (bvult co_10 co_3)))
    (bvult topo_U_4 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_3))
        (and rf_3_4 (bvult co_3 co_3))
        (and rf_5_4 (bvult co_5 co_3))
        (and rf_8_4 (bvult co_8 co_3))
        (and rf_10_4 (bvult co_10 co_3))
        (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_8_4 (bvult co_8 co_5))
        (and rf_10_4 (bvult co_10 co_5)))
    (bvult topo_U_4 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_1_4 (bvult co_1 co_5))
        (and rf_3_4 (bvult co_3 co_5))
        (and rf_5_4 (bvult co_5 co_5))
        (and rf_8_4 (bvult co_8 co_5))
        (and rf_10_4 (bvult co_10 co_5))
        (and false false))
    (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_8))
        (and rf_3_4 (bvult co_3 co_8))
        (and rf_5_4 (bvult co_5 co_8))
        (and rf_8_4 (bvult co_8 co_8))
        (and rf_10_4 (bvult co_10 co_8)))
    (bvult topo_U_4 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_8))
        (and rf_3_4 (bvult co_3 co_8))
        (and rf_5_4 (bvult co_5 co_8))
        (and rf_8_4 (bvult co_8 co_8))
        (and rf_10_4 (bvult co_10 co_8))
        (and true false))
    (bvult topo_T_4 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_10))
        (and rf_3_4 (bvult co_3 co_10))
        (and rf_5_4 (bvult co_5 co_10))
        (and rf_8_4 (bvult co_8 co_10))
        (and rf_10_4 (bvult co_10 co_10)))
    (bvult topo_U_4 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 (bvult co_1 co_10))
        (and rf_3_4 (bvult co_3 co_10))
        (and rf_5_4 (bvult co_5 co_10))
        (and rf_8_4 (bvult co_8 co_10))
        (and rf_10_4 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_4 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false))
    (bvult topo_U_4 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_4 false)
        (and rf_3_4 false)
        (and rf_5_4 false)
        (and rf_8_4 false)
        (and rf_10_4 false)
        (and true false))
    (bvult topo_T_4 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert (=> (or false false (bvult co_5 co_1) or (and true false))
    (bvult topo_T_5 topo_T_1)))
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
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_6)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert (=> (or false rf_5_7 false or) (bvult topo_U_5 topo_U_7)))
(assert (=> (or false false false or (and true rf_5_7)) (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false (bvult co_5 co_8) or) (bvult topo_U_5 topo_U_8)))
(assert (=> (or false false (bvult co_5 co_8) or (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false rf_5_9 false or) (bvult topo_U_5 topo_U_9)))
(assert (=> (or false false false or (and true rf_5_9)) (bvult topo_T_5 topo_T_9)))
(assert (=> (or false false (bvult co_5 co_10) or) (bvult topo_U_5 topo_U_10)))
(assert (=> (or false false (bvult co_5 co_10) or (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_5 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_5 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_11_6 (bvult co_11 co_0)))
    (bvult topo_U_6 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_0))
        (and rf_11_6 (bvult co_11 co_0))
        (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_11))
        (and rf_11_6 (bvult co_11 co_11)))
    (bvult topo_U_6 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_6 (bvult co_0 co_11))
        (and rf_11_6 (bvult co_11 co_11))
        (and true false))
    (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_12)))
(assert (=> (or false false false (and rf_0_6 false) (and rf_11_6 false))
    (bvult topo_U_6 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_6 false)
        (and rf_11_6 false)
        (and true false))
    (bvult topo_T_6 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_3_7 (bvult co_3 co_1))
        (and rf_5_7 (bvult co_5 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and rf_10_7 (bvult co_10 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_3_7 (bvult co_3 co_1))
        (and rf_5_7 (bvult co_5 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and rf_10_7 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_5_7 (bvult co_5 co_3))
        (and rf_8_7 (bvult co_8 co_3))
        (and rf_10_7 (bvult co_10 co_3)))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_3))
        (and rf_3_7 (bvult co_3 co_3))
        (and rf_5_7 (bvult co_5 co_3))
        (and rf_8_7 (bvult co_8 co_3))
        (and rf_10_7 (bvult co_10 co_3))
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_5))
        (and rf_3_7 (bvult co_3 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_8_7 (bvult co_8 co_5))
        (and rf_10_7 (bvult co_10 co_5)))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_5))
        (and rf_3_7 (bvult co_3 co_5))
        (and rf_5_7 (bvult co_5 co_5))
        (and rf_8_7 (bvult co_8 co_5))
        (and rf_10_7 (bvult co_10 co_5))
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_3_7 (bvult co_3 co_8))
        (and rf_5_7 (bvult co_5 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_10_7 (bvult co_10 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_3_7 (bvult co_3 co_8))
        (and rf_5_7 (bvult co_5 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_10_7 (bvult co_10 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_10))
        (and rf_3_7 (bvult co_3 co_10))
        (and rf_5_7 (bvult co_5 co_10))
        (and rf_8_7 (bvult co_8 co_10))
        (and rf_10_7 (bvult co_10 co_10)))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_10))
        (and rf_3_7 (bvult co_3 co_10))
        (and rf_5_7 (bvult co_5 co_10))
        (and rf_8_7 (bvult co_8 co_10))
        (and rf_10_7 (bvult co_10 co_10))
        (and false false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_3_7 false)
        (and rf_5_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false (bvult co_8 co_3) or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false (bvult co_8 co_3) or (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false rf_8_4 false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true rf_8_4)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false (bvult co_8 co_5) or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false (bvult co_8 co_5) or (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true rf_8_9 false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or true false false or (and false rf_8_9)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or true false (bvult co_8 co_10) or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or true false (bvult co_8 co_10) or (and false false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_11)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_8 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_3_9 (bvult co_3 co_1))
        (and rf_5_9 (bvult co_5 co_1))
        (and rf_8_9 (bvult co_8 co_1))
        (and rf_10_9 (bvult co_10 co_1)))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_3_9 (bvult co_3 co_1))
        (and rf_5_9 (bvult co_5 co_1))
        (and rf_8_9 (bvult co_8 co_1))
        (and rf_10_9 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_3))
        (and rf_3_9 (bvult co_3 co_3))
        (and rf_5_9 (bvult co_5 co_3))
        (and rf_8_9 (bvult co_8 co_3))
        (and rf_10_9 (bvult co_10 co_3)))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_3))
        (and rf_3_9 (bvult co_3 co_3))
        (and rf_5_9 (bvult co_5 co_3))
        (and rf_8_9 (bvult co_8 co_3))
        (and rf_10_9 (bvult co_10 co_3))
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_5))
        (and rf_3_9 (bvult co_3 co_5))
        (and rf_5_9 (bvult co_5 co_5))
        (and rf_8_9 (bvult co_8 co_5))
        (and rf_10_9 (bvult co_10 co_5)))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_5))
        (and rf_3_9 (bvult co_3 co_5))
        (and rf_5_9 (bvult co_5 co_5))
        (and rf_8_9 (bvult co_8 co_5))
        (and rf_10_9 (bvult co_10 co_5))
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_8))
        (and rf_3_9 (bvult co_3 co_8))
        (and rf_5_9 (bvult co_5 co_8))
        (and rf_8_9 (bvult co_8 co_8))
        (and rf_10_9 (bvult co_10 co_8)))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_8))
        (and rf_3_9 (bvult co_3 co_8))
        (and rf_5_9 (bvult co_5 co_8))
        (and rf_8_9 (bvult co_8 co_8))
        (and rf_10_9 (bvult co_10 co_8))
        (and false false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_3_9 (bvult co_3 co_10))
        (and rf_5_9 (bvult co_5 co_10))
        (and rf_8_9 (bvult co_8 co_10))
        (and rf_10_9 (bvult co_10 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_3_9 (bvult co_3 co_10))
        (and rf_5_9 (bvult co_5 co_10))
        (and rf_8_9 (bvult co_8 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or true
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_3_9 false)
        (and rf_5_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false (bvult co_10 co_1) or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false (bvult co_10 co_1) or (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false rf_10_2 false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true rf_10_2)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false (bvult co_10 co_3) or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false (bvult co_10 co_3) or (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false rf_10_4 false or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false or (and true rf_10_4)) (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false (bvult co_10 co_5) or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false (bvult co_10 co_5) or (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false rf_10_7 false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and false rf_10_7)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false (bvult co_10 co_8) or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false (bvult co_10 co_8) or (and false false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false rf_10_9 false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false rf_10_9)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_13)))
(assert (=> (or false false (bvult co_11 co_0) or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false (bvult co_11 co_0) or (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_5)))
(assert (=> (or false rf_11_6 false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true rf_11_6)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false (bvult co_11 co_11) or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false (bvult co_11 co_11) or (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_12)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_12 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_13)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_12 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_1)))
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
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_13 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_12)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_13)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_13)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_11 #b01) (= #x00000001 final_x)))
(assert (=> (= co_1 #b100) (= #x00000000 final_y)))
(assert (=> (= co_3 #b100) (= final_y (bvadd read_t0s0a #x00000001))))
(assert (=> (= co_5 #b100) (= final_y (bvadd read_t0s1a #x00000000))))
(assert (=> (= co_8 #b100) (= final_y (bvadd read_t1s0a #x00000002))))
(assert (=> (= co_10 #b100) (= final_y (bvadd read_t1s1a #x00000000))))

(check-sat)
