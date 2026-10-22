(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 3))
(declare-fun co_2 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun co_9 () (_ BitVec 3))
(declare-fun co_12 () (_ BitVec 3))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_9_5 () Bool)
(declare-fun rf_12_5 () Bool)
(declare-fun rf_1_8 () Bool)
(declare-fun rf_2_8 () Bool)
(declare-fun rf_6_8 () Bool)
(declare-fun rf_9_8 () Bool)
(declare-fun rf_12_8 () Bool)
(declare-fun read_t1s2a () (_ BitVec 32))
(declare-fun rf_0_10 () Bool)
(declare-fun rf_4_10 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_0_11 () Bool)
(declare-fun rf_4_11 () Bool)
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
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_4 #b10))
(assert (distinct co_0 co_4))
(assert (bvult co_1 #b101))
(assert (= co_1 #b000))
(assert (bvult co_2 #b101))
(assert (bvult co_6 #b101))
(assert (bvult co_9 #b101))
(assert (bvult co_12 #b101))
(assert (distinct co_1 co_2 co_6 co_9 co_12))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert ((_ pbeq 1 1 1) rf_0_3 rf_4_3))
(assert (=> rf_1_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_2_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_6_5 (= (bvadd read_t0s2a #x00000001) read_t0s2a)))
(assert (=> rf_9_5 (= (bvadd read_t1s1a #x00000001) read_t0s2a)))
(assert (=> rf_12_5 (= #x00000000 read_t0s2a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_5 rf_2_5 rf_6_5 rf_9_5 rf_12_5))
(assert (=> rf_1_8 (= #x00000000 read_t1s1a)))
(assert (=> rf_2_8 (= #x00000000 read_t1s1a)))
(assert (=> rf_6_8 (= (bvadd read_t0s2a #x00000001) read_t1s1a)))
(assert (=> rf_9_8 (= (bvadd read_t1s1a #x00000001) read_t1s1a)))
(assert (=> rf_12_8 (= #x00000000 read_t1s1a)))
(assert ((_ pbeq 1 1 1 1 1 1) rf_1_8 rf_2_8 rf_6_8 rf_9_8 rf_12_8))
(assert (=> rf_0_10 (= #x00000000 read_t1s2a)))
(assert (=> rf_4_10 (= (bvadd read_t0s1a #x00000001) read_t1s2a)))
(assert ((_ pbeq 1 1 1) rf_0_10 rf_4_10))
(assert (=> rf_0_11 (= #x00000000 read_t2s0a)))
(assert (=> rf_4_11 (= (bvadd read_t0s1a #x00000001) read_t2s0a)))
(assert ((_ pbeq 1 1 1) rf_0_11 rf_4_11))
(assert (not (and (or (and rf_1_8 false)
              (and rf_2_8 false)
              (and rf_6_8 false)
              (and rf_9_8 false)
              (and rf_12_8 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_1))
                    (and rf_2_8 (bvult co_2 co_1))
                    (and rf_6_8 (bvult co_6 co_1))
                    (and rf_9_8 (bvult co_9 co_1))
                    (and rf_12_8 (bvult co_12 co_1)))
                (bvult co_1 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_2))
                    (and rf_2_8 (bvult co_2 co_2))
                    (and rf_6_8 (bvult co_6 co_2))
                    (and rf_9_8 (bvult co_9 co_2))
                    (and rf_12_8 (bvult co_12 co_2)))
                (bvult co_2 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_1_8 false)
              (and rf_2_8 false)
              (and rf_6_8 false)
              (and rf_9_8 false)
              (and rf_12_8 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_6))
                    (and rf_2_8 (bvult co_2 co_6))
                    (and rf_6_8 (bvult co_6 co_6))
                    (and rf_9_8 (bvult co_9 co_6))
                    (and rf_12_8 (bvult co_12 co_6)))
                (bvult co_6 co_9))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_8 (bvult co_1 co_12))
                    (and rf_2_8 (bvult co_2 co_12))
                    (and rf_6_8 (bvult co_6 co_12))
                    (and rf_9_8 (bvult co_9 co_12))
                    (and rf_12_8 (bvult co_12 co_12)))
                (bvult co_12 co_9))))
  (not a!1)))
(assert (not (and (or (and rf_1_5 false)
              (and rf_2_5 false)
              (and rf_6_5 false)
              (and rf_9_5 false)
              (and rf_12_5 false))
          false)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_1))
                    (and rf_2_5 (bvult co_2 co_1))
                    (and rf_6_5 (bvult co_6 co_1))
                    (and rf_9_5 (bvult co_9 co_1))
                    (and rf_12_5 (bvult co_12 co_1)))
                (bvult co_1 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_9))
                    (and rf_2_5 (bvult co_2 co_9))
                    (and rf_6_5 (bvult co_6 co_9))
                    (and rf_9_5 (bvult co_9 co_9))
                    (and rf_12_5 (bvult co_12 co_9)))
                (bvult co_9 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_1_5 (bvult co_1 co_12))
                    (and rf_2_5 (bvult co_2 co_12))
                    (and rf_6_5 (bvult co_6 co_12))
                    (and rf_9_5 (bvult co_9 co_12))
                    (and rf_12_5 (bvult co_12 co_12)))
                (bvult co_12 co_6))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
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
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
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
(assert (=> (or false rf_0_11 false or) (bvult topo_U_0 topo_U_11)))
(assert (=> (or false false false or (and true rf_0_11)) (bvult topo_T_0 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_13)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_11)))
(assert (=> (or false false (bvult co_1 co_12) or) (bvult topo_U_1 topo_U_12)))
(assert (=> (or false false (bvult co_1 co_12) or (and true false))
    (bvult topo_T_1 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false (bvult co_2 co_1) or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false (bvult co_2 co_1) or (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert (=> (or true rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or true false false or (and false rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or true false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or true false (bvult co_2 co_6) or (and false false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert (=> (or false rf_2_8 false or) (bvult topo_U_2 topo_U_8)))
(assert (=> (or false false false or (and true rf_2_8)) (bvult topo_T_2 topo_T_8)))
(assert (=> (or false false (bvult co_2 co_9) or) (bvult topo_U_2 topo_U_9)))
(assert (=> (or false false (bvult co_2 co_9) or (and true false))
    (bvult topo_T_2 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_11)))
(assert (=> (or false false (bvult co_2 co_12) or) (bvult topo_U_2 topo_U_12)))
(assert (=> (or false false (bvult co_2 co_12) or (and true false))
    (bvult topo_T_2 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_11)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_12)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_4_3 false))
    (bvult topo_U_3 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_13)))
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
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false rf_4_10 false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true rf_4_10)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false rf_4_11 false or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false false or (and true rf_4_11)) (bvult topo_T_4 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_2_5 (bvult co_2 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_9_5 (bvult co_9 co_1))
        (and rf_12_5 (bvult co_12 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_2_5 (bvult co_2 co_1))
        (and rf_6_5 (bvult co_6 co_1))
        (and rf_9_5 (bvult co_9 co_1))
        (and rf_12_5 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_6_5 (bvult co_6 co_2))
        (and rf_9_5 (bvult co_9 co_2))
        (and rf_12_5 (bvult co_12 co_2)))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_6_5 (bvult co_6 co_2))
        (and rf_9_5 (bvult co_9 co_2))
        (and rf_12_5 (bvult co_12 co_2))
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_2_5 (bvult co_2 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6))
        (and rf_12_5 (bvult co_12 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_1_5 (bvult co_1 co_6))
        (and rf_2_5 (bvult co_2 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and rf_9_5 (bvult co_9 co_6))
        (and rf_12_5 (bvult co_12 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_9))
        (and rf_2_5 (bvult co_2 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9))
        (and rf_12_5 (bvult co_12 co_9)))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_9))
        (and rf_2_5 (bvult co_2 co_9))
        (and rf_6_5 (bvult co_6 co_9))
        (and rf_9_5 (bvult co_9 co_9))
        (and rf_12_5 (bvult co_12 co_9))
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_12))
        (and rf_2_5 (bvult co_2 co_12))
        (and rf_6_5 (bvult co_6 co_12))
        (and rf_9_5 (bvult co_9 co_12))
        (and rf_12_5 (bvult co_12 co_12)))
    (bvult topo_U_5 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_12))
        (and rf_2_5 (bvult co_2 co_12))
        (and rf_6_5 (bvult co_6 co_12))
        (and rf_9_5 (bvult co_9 co_12))
        (and rf_12_5 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_5 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false))
    (bvult topo_U_5 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_2_5 false)
        (and rf_6_5 false)
        (and rf_9_5 false)
        (and rf_12_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false (bvult co_6 co_1) or (and true false))
    (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false (bvult co_6 co_2) or (and false false))
    (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_4)))
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
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_11)))
(assert (=> (or false false (bvult co_6 co_12) or) (bvult topo_U_6 topo_U_12)))
(assert (=> (or false false (bvult co_6 co_12) or (and true false))
    (bvult topo_T_6 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_8)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_12)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_7 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_2_8 (bvult co_2 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1))
        (and rf_12_8 (bvult co_12 co_1)))
    (bvult topo_U_8 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_1))
        (and rf_2_8 (bvult co_2 co_1))
        (and rf_6_8 (bvult co_6 co_1))
        (and rf_9_8 (bvult co_9 co_1))
        (and rf_12_8 (bvult co_12 co_1))
        (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_2))
        (and rf_2_8 (bvult co_2 co_2))
        (and rf_6_8 (bvult co_6 co_2))
        (and rf_9_8 (bvult co_9 co_2))
        (and rf_12_8 (bvult co_12 co_2)))
    (bvult topo_U_8 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_2))
        (and rf_2_8 (bvult co_2 co_2))
        (and rf_6_8 (bvult co_6 co_2))
        (and rf_9_8 (bvult co_9 co_2))
        (and rf_12_8 (bvult co_12 co_2))
        (and true false))
    (bvult topo_T_8 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_2_8 (bvult co_2 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6))
        (and rf_12_8 (bvult co_12 co_6)))
    (bvult topo_U_8 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_6))
        (and rf_2_8 (bvult co_2 co_6))
        (and rf_6_8 (bvult co_6 co_6))
        (and rf_9_8 (bvult co_9 co_6))
        (and rf_12_8 (bvult co_12 co_6))
        (and true false))
    (bvult topo_T_8 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_2_8 (bvult co_2 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and rf_12_8 (bvult co_12 co_9)))
    (bvult topo_U_8 topo_U_9)))
(assert (=> (or true
        false
        false
        (and rf_1_8 (bvult co_1 co_9))
        (and rf_2_8 (bvult co_2 co_9))
        (and rf_6_8 (bvult co_6 co_9))
        (and rf_9_8 (bvult co_9 co_9))
        (and rf_12_8 (bvult co_12 co_9))
        (and false false))
    (bvult topo_T_8 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and false false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_12))
        (and rf_2_8 (bvult co_2 co_12))
        (and rf_6_8 (bvult co_6 co_12))
        (and rf_9_8 (bvult co_9 co_12))
        (and rf_12_8 (bvult co_12 co_12)))
    (bvult topo_U_8 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_1_8 (bvult co_1 co_12))
        (and rf_2_8 (bvult co_2 co_12))
        (and rf_6_8 (bvult co_6 co_12))
        (and rf_9_8 (bvult co_9 co_12))
        (and rf_12_8 (bvult co_12 co_12))
        (and true false))
    (bvult topo_T_8 topo_T_12)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false))
    (bvult topo_U_8 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_1_8 false)
        (and rf_2_8 false)
        (and rf_6_8 false)
        (and rf_9_8 false)
        (and rf_12_8 false)
        (and true false))
    (bvult topo_T_8 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_0)))
(assert (=> (or false false (bvult co_9 co_1) or) (bvult topo_U_9 topo_U_1)))
(assert (=> (or false false (bvult co_9 co_1) or (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false false (bvult co_9 co_2) or) (bvult topo_U_9 topo_U_2)))
(assert (=> (or false false (bvult co_9 co_2) or (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_4)))
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
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_10)))
(assert (=> (or true false false or (and false false)) (bvult topo_T_9 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_11)))
(assert (=> (or false false (bvult co_9 co_12) or) (bvult topo_U_9 topo_U_12)))
(assert (=> (or false false (bvult co_9 co_12) or (and true false))
    (bvult topo_T_9 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_9 topo_U_13)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_9 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_4_10 (bvult co_4 co_0)))
    (bvult topo_U_10 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_0))
        (and rf_4_10 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_4))
        (and rf_4_10 (bvult co_4 co_4)))
    (bvult topo_U_10 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_10 (bvult co_0 co_4))
        (and rf_4_10 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_6)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_12)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_12)))
(assert (=> (or false false false (and rf_0_10 false) (and rf_4_10 false))
    (bvult topo_U_10 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_10 false)
        (and rf_4_10 false)
        (and true false))
    (bvult topo_T_10 topo_T_13)))
(assert (=> (or false
        false
        false
        (and rf_0_11 (bvult co_0 co_0))
        (and rf_4_11 (bvult co_4 co_0)))
    (bvult topo_U_11 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_11 (bvult co_0 co_0))
        (and rf_4_11 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_11 topo_T_0)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_1)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_2)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_11 (bvult co_0 co_4))
        (and rf_4_11 (bvult co_4 co_4)))
    (bvult topo_U_11 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_11 (bvult co_0 co_4))
        (and rf_4_11 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_11 topo_T_4)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_5)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and true false))
    (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_11)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_12)))
(assert (=> (or true
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_12)))
(assert (=> (or false false false (and rf_0_11 false) (and rf_4_11 false))
    (bvult topo_U_11 topo_U_13)))
(assert (=> (or false
        false
        false
        (and rf_0_11 false)
        (and rf_4_11 false)
        (and false false))
    (bvult topo_T_11 topo_T_13)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_0)))
(assert (=> (or false false (bvult co_12 co_1) or) (bvult topo_U_12 topo_U_1)))
(assert (=> (or false false (bvult co_12 co_1) or (and true false))
    (bvult topo_T_12 topo_T_1)))
(assert (=> (or false false (bvult co_12 co_2) or) (bvult topo_U_12 topo_U_2)))
(assert (=> (or false false (bvult co_12 co_2) or (and true false))
    (bvult topo_T_12 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_4)))
(assert (=> (or false rf_12_5 false or) (bvult topo_U_12 topo_U_5)))
(assert (=> (or false false false or (and true rf_12_5)) (bvult topo_T_12 topo_T_5)))
(assert (=> (or false false (bvult co_12 co_6) or) (bvult topo_U_12 topo_U_6)))
(assert (=> (or false false (bvult co_12 co_6) or (and true false))
    (bvult topo_T_12 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_7)))
(assert (=> (or false rf_12_8 false or) (bvult topo_U_12 topo_U_8)))
(assert (=> (or false false false or (and true rf_12_8)) (bvult topo_T_12 topo_T_8)))
(assert (=> (or false false (bvult co_12 co_9) or) (bvult topo_U_12 topo_U_9)))
(assert (=> (or false false (bvult co_12 co_9) or (and true false))
    (bvult topo_T_12 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_12 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_12 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_12 topo_T_11)))
(assert (=> (or false false (bvult co_12 co_12) or) (bvult topo_U_12 topo_U_12)))
(assert (=> (or false false (bvult co_12 co_12) or (and false false))
    (bvult topo_T_12 topo_T_12)))
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
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_12)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_12)))
(assert (=> (or false false false or) (bvult topo_U_13 topo_U_13)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_13 topo_T_13)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_4 #b01) (= final_x (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_1 #b100) (= #x00000000 final_y)))
(assert (=> (= co_2 #b100) (= #x00000000 final_y)))
(assert (=> (= co_6 #b100) (= final_y (bvadd read_t0s2a #x00000001))))
(assert (=> (= co_9 #b100) (= final_y (bvadd read_t1s1a #x00000001))))
(assert (=> (= co_12 #b100) (= #x00000000 final_y)))

(check-sat)
