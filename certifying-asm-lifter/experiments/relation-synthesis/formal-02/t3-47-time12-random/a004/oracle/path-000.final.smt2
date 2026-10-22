(declare-fun rf_6_5 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun rf_10_9 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun k!218 () Bool)
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun k!219 () Bool)
(declare-fun topo_U_11 () (_ BitVec 4))
(declare-fun k!220 () Bool)
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun k!221 () Bool)
(declare-fun topo_T_11 () (_ BitVec 4))
(declare-fun k!222 () Bool)
(declare-fun k!223 () Bool)
(declare-fun k!224 () Bool)
(declare-fun k!225 () Bool)
(declare-fun input_b () Bool)
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_10 () (_ BitVec 2))
(declare-fun rf_0_3 () Bool)
(declare-fun read_t0s2a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun read_t2s0a () (_ BitVec 32))
(declare-fun rf_10_7 () Bool)
(declare-fun rf_1_9 () Bool)
(declare-fun rf_8_9 () Bool)
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
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_4 #b11))
(assert (bvult co_6 #b11))
(assert (distinct co_0 co_4 co_6))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_8 #b11))
(assert (bvult co_10 #b11))
(assert (distinct co_1 co_8 co_10))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_4_3 (= (bvadd read_t0s1a #x00000001) read_t0s1a)))
(assert (=> rf_6_3 (= (bvadd read_t0s2a #x00000001) read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_3 rf_4_3 rf_6_3))
(assert (=> rf_0_5 (= #x00000000 read_t0s2a)))
(assert (=> rf_4_5 (= (bvadd read_t0s1a #x00000001) read_t0s2a)))
(assert (=> rf_6_5 (= (bvadd read_t0s2a #x00000001) read_t0s2a)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_4_5 rf_6_5))
(assert (=> rf_1_7 (= #x00000000 read_t1s1a)))
(assert (=> rf_8_7
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert (=> rf_10_7
    (= (bvadd read_t2s0a (ite input_b #x00000001 #x00000002)) read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_7 rf_8_7 rf_10_7))
(assert (=> rf_1_9 (= #x00000000 read_t2s0a)))
(assert (=> rf_8_9
    (= (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)) read_t2s0a)))
(assert (=> rf_10_9
    (= (bvadd read_t2s0a (ite input_b #x00000001 #x00000002)) read_t2s0a)))
(assert ((_ pbeq 1 1 1 1) rf_1_9 rf_8_9 rf_10_9))
(assert (not (and (or (and rf_1_9 false) (and rf_8_9 false) (and rf_10_9 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_1))
                    (and rf_8_9 (bvult co_8 co_1))
                    (and rf_10_9 (bvult co_10 co_1)))
                (bvult co_1 co_10))))
  (not a!1)))
(assert (not (and (or (and rf_1_9 false) (and rf_8_9 false) (and rf_10_9 false)) false)))
(assert (not (and (or (and rf_1_9 false) (and rf_8_9 false) (and rf_10_9 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_9 (bvult co_1 co_8))
                    (and rf_8_9 (bvult co_8 co_8))
                    (and rf_10_9 (bvult co_10 co_8)))
                (bvult co_8 co_10))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_5 (bvult co_0 co_0))
                    (and rf_4_5 (bvult co_4 co_0))
                    (and rf_6_5 (bvult co_6 co_0)))
                (bvult co_0 co_6))))
  (not a!1)))
(assert (not (and (or (and rf_0_5 false) (and rf_4_5 false) (and rf_6_5 false)) false)))
(assert (not (and (or (and rf_0_5 false) (and rf_4_5 false) (and rf_6_5 false)) false)))
(assert (not (and (or (and rf_0_5 false) (and rf_4_5 false) (and rf_6_5 false)) false)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_4_3 (bvult co_4 co_0))
                    (and rf_6_3 (bvult co_6 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false) (and rf_6_3 false)) false)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false) (and rf_6_3 false)) false)))
(assert (not (and (or (and rf_0_3 false) (and rf_4_3 false) (and rf_6_3 false)) false)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false) (and rf_10_7 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_1))
                    (and rf_8_7 (bvult co_8 co_1))
                    (and rf_10_7 (bvult co_10 co_1)))
                (bvult co_1 co_8))))
  (not a!1)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false) (and rf_10_7 false)) false)))
(assert (not (and (or (and rf_1_7 false) (and rf_8_7 false) (and rf_10_7 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_7 (bvult co_1 co_10))
                    (and rf_8_7 (bvult co_8 co_10))
                    (and rf_10_7 (bvult co_10 co_10)))
                (bvult co_10 co_8))))
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
(assert (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false (bvult co_0 co_6) or (and true false))
    (bvult topo_T_0 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_8)))
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
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_5)))
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
(assert (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_6)))
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
        (and rf_6_3 (bvult co_6 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and rf_6_3 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and rf_6_3 (bvult co_6 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6)))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_6))
        (and rf_4_3 (bvult co_4 co_6))
        (and rf_6_3 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false))
    (bvult topo_U_3 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_4_3 false)
        (and rf_6_3 false)
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
(assert (=> (or true false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or true false (bvult co_4 co_6) or (and false false))
    (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and rf_6_5 (bvult co_6 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and rf_6_5 (bvult co_6 co_4))
        (and false false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6)))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or true
        false
        false
        (and rf_0_5 (bvult co_0 co_6))
        (and rf_4_5 (bvult co_4 co_6))
        (and rf_6_5 (bvult co_6 co_6))
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false))
    (bvult topo_U_5 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_4_5 false)
        (and rf_6_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_11)))
(assert (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false (bvult co_6 co_0) or (and true false))
    (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and false rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false (bvult co_6 co_4) or (and false false))
    (bvult topo_T_6 topo_T_4)))
(assert (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false (bvult co_6 co_6) or (and false false))
    (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_9)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_10)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and rf_10_7 (bvult co_10 co_1)))
    (bvult topo_U_7 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_1))
        (and rf_8_7 (bvult co_8 co_1))
        (and rf_10_7 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_7 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and false false))
    (bvult topo_T_7 topo_T_7)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_10_7 (bvult co_10 co_8)))
    (bvult topo_U_7 topo_U_8)))
(assert (=> (or true
        false
        false
        (and rf_1_7 (bvult co_1 co_8))
        (and rf_8_7 (bvult co_8 co_8))
        (and rf_10_7 (bvult co_10 co_8))
        (and false false))
    (bvult topo_T_7 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_9)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_10))
        (and rf_8_7 (bvult co_8 co_10))
        (and rf_10_7 (bvult co_10 co_10)))
    (bvult topo_U_7 topo_U_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 (bvult co_1 co_10))
        (and rf_8_7 (bvult co_8 co_10))
        (and rf_10_7 (bvult co_10 co_10))
        (and true false))
    (bvult topo_T_7 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false))
    (bvult topo_U_7 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_7 false)
        (and rf_8_7 false)
        (and rf_10_7 false)
        (and true false))
    (bvult topo_T_7 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert (=> (or false false (bvult co_8 co_1) or) (bvult topo_U_8 topo_U_1)))
(assert (=> (or false false (bvult co_8 co_1) or (and true false))
    (bvult topo_T_8 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_6)))
(assert (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert (=> (or false false (bvult co_8 co_8) or (and false false))
    (bvult topo_T_8 topo_T_8)))
(assert (=> (or false rf_8_9 false or) (bvult topo_U_8 topo_U_9)))
(assert (=> (or false false false or (and true rf_8_9)) (bvult topo_T_8 topo_T_9)))
(assert (=> (or false false (bvult co_8 co_10) or) (bvult topo_U_8 topo_U_10)))
(assert (=> (or false false (bvult co_8 co_10) or (and true false))
    (bvult topo_T_8 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_8 topo_U_11)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_8 topo_T_11)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_8_9 (bvult co_8 co_1))
        (and rf_10_9 (bvult co_10 co_1)))
    (bvult topo_U_9 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_1))
        (and rf_8_9 (bvult co_8 co_1))
        (and rf_10_9 (bvult co_10 co_1))
        (and true false))
    (bvult topo_T_9 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and true false))
    (bvult topo_T_9 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_8))
        (and rf_8_9 (bvult co_8 co_8))
        (and rf_10_9 (bvult co_10 co_8)))
    (bvult topo_U_9 topo_U_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 (bvult co_1 co_8))
        (and rf_8_9 (bvult co_8 co_8))
        (and rf_10_9 (bvult co_10 co_8))
        (and true false))
    (bvult topo_T_9 topo_T_8)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_9)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_9)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_8_9 (bvult co_8 co_10))
        (and rf_10_9 (bvult co_10 co_10)))
    (bvult topo_U_9 topo_U_10)))
(assert (=> (or true
        false
        false
        (and rf_1_9 (bvult co_1 co_10))
        (and rf_8_9 (bvult co_8 co_10))
        (and rf_10_9 (bvult co_10 co_10))
        (and false false))
    (bvult topo_T_9 topo_T_10)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false))
    (bvult topo_U_9 topo_U_11)))
(assert (=> (or false
        false
        false
        (and rf_1_9 false)
        (and rf_8_9 false)
        (and rf_10_9 false)
        (and false false))
    (bvult topo_T_9 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_0)))
(assert (=> (or false false (bvult co_10 co_1) or) (bvult topo_U_10 topo_U_1)))
(assert (=> (or false false (bvult co_10 co_1) or (and true false))
    (bvult topo_T_10 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_5)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_10 topo_T_6)))
(assert (=> (or false rf_10_7 false or) (bvult topo_U_10 topo_U_7)))
(assert (=> (or false false false or (and true rf_10_7)) (bvult topo_T_10 topo_T_7)))
(assert (=> (or false false (bvult co_10 co_8) or) (bvult topo_U_10 topo_U_8)))
(assert (=> (or false false (bvult co_10 co_8) or (and true false))
    (bvult topo_T_10 topo_T_8)))
(assert (=> (or false rf_10_9 false or) (bvult topo_U_10 topo_U_9)))
(assert (=> (or false false false or (and false rf_10_9)) (bvult topo_T_10 topo_T_9)))
(assert (=> (or false false (bvult co_10 co_10) or) (bvult topo_U_10 topo_U_10)))
(assert (=> (or false false (bvult co_10 co_10) or (and false false))
    (bvult topo_T_10 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_10 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_10 topo_T_11)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_0)))
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
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_8)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_11 topo_T_8)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_9)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_9)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_10)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_10)))
(assert (=> (or false false false or) (bvult topo_U_11 topo_U_11)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_11 topo_T_11)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_4 #b10) (= final_x (bvadd read_t0s1a #x00000001))))
(assert (=> (= co_6 #b10) (= final_x (bvadd read_t0s2a #x00000001))))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_8 #b10)
    (= final_y (bvadd read_t1s1a (ite input_b #x00000001 #x00000002)))))
(assert (=> (= co_10 #b10)
    (= final_y (bvadd read_t2s0a (ite input_b #x00000001 #x00000002)))))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000001 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_6_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 false)
    (distinct rf_8_7 false)
    (distinct rf_10_7 true)
    (distinct rf_1_9 true)
    (distinct rf_8_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_4)
    (distinct #b10 co_6)
    (distinct #b00 co_1)
    (distinct #b10 co_8)
    (distinct #b01 co_10)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000002 read_t1s1a)
    (distinct #x00000000 read_t2s0a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_6_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 false)
    (distinct rf_8_7 false)
    (distinct rf_10_7 true)
    (distinct rf_1_9 true)
    (distinct rf_8_9 false)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_4)
    (distinct #b10 co_6)
    (distinct #b00 co_1)
    (distinct #b10 co_8)
    (distinct #b01 co_10)))
(assert (or (distinct input_b true)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000001 read_t2s0a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_6_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 true)
    (distinct rf_8_7 false)
    (distinct rf_10_7 false)
    (distinct rf_1_9 false)
    (distinct rf_8_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_4)
    (distinct #b10 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_8)
    (distinct #b10 co_10)))
(assert (or (distinct input_b false)
    (distinct #x00000000 read_t0s1a)
    (distinct #x00000001 read_t0s2a)
    (distinct #x00000000 read_t1s1a)
    (distinct #x00000002 read_t2s0a)
    (distinct rf_0_3 true)
    (distinct rf_4_3 false)
    (distinct rf_6_3 false)
    (distinct rf_0_5 false)
    (distinct rf_4_5 true)
    (distinct rf_6_5 false)
    (distinct rf_1_7 true)
    (distinct rf_8_7 false)
    (distinct rf_10_7 false)
    (distinct rf_1_9 false)
    (distinct rf_8_9 true)
    (distinct rf_10_9 false)
    (distinct #b00 co_0)
    (distinct #b01 co_4)
    (distinct #b10 co_6)
    (distinct #b00 co_1)
    (distinct #b01 co_8)
    (distinct #b10 co_10)))
(model-add rf_6_5 () Bool false)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add rf_10_9 () Bool false)
(model-add rf_8_7 () Bool false)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-del k!218)
(model-add topo_U_2
           ()
           (_ BitVec 4)
           (ite (or k!218 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!219)
(model-add topo_U_11
           ()
           (_ BitVec 4)
           (ite (or k!219 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!220)
(model-add topo_T_2
           ()
           (_ BitVec 4)
           (ite (or k!220 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!221)
(model-add topo_T_11
           ()
           (_ BitVec 4)
           (ite (or k!221 (= #xc #x0)) #xc (bvsub #xc #x1)))
(model-del k!222)
(model-add k!218 () Bool (not k!222))
(model-del k!223)
(model-add k!219 () Bool (not k!223))
(model-del k!224)
(model-add k!220 () Bool (not k!224))
(model-del k!225)
(model-add k!221 () Bool (not k!225))
(model-add co_8 () (_ BitVec 2) #b10)
(model-add k!222 () Bool true)
(model-add read_t2s0a () (_ BitVec 32) #x00000000)
(model-add co_10 () (_ BitVec 2) #b01)
(model-add rf_1_7 () Bool false)
(model-add topo_U_9 () (_ BitVec 4) #x1)
(model-add topo_T_1 () (_ BitVec 4) #x0)
(model-add topo_U_10 () (_ BitVec 4) #x2)
(model-add topo_T_4 () (_ BitVec 4) #x3)
(model-add rf_0_5 () Bool false)
(model-add rf_1_9 () Bool true)
(model-add co_6 () (_ BitVec 2) #b10)
(model-add topo_T_5 () (_ BitVec 4) #x8)
(model-add rf_10_7 () Bool true)
(model-add topo_U_4 () (_ BitVec 4) #x2)
(model-add topo_U_5 () (_ BitVec 4) #x8)
(model-add topo_U_3 () (_ BitVec 4) #x1)
(model-add topo_T_9 () (_ BitVec 4) #x6)
(model-add topo_U_0 () (_ BitVec 4) #x0)
(model-add read_t1s1a () (_ BitVec 32) #x00000001)
(model-add read_t0s2a () (_ BitVec 32) #x00000001)
(model-add rf_6_3 () Bool false)
(model-add k!224 () Bool true)
(model-add co_4 () (_ BitVec 2) #b01)
(model-add topo_U_8 () (_ BitVec 4) #xb)
(model-add topo_T_6 () (_ BitVec 4) #xa)
(model-add topo_T_7 () (_ BitVec 4) #x9)
(model-add topo_T_8 () (_ BitVec 4) #xb)
(model-add topo_T_10 () (_ BitVec 4) #x8)
(model-add final_x () (_ BitVec 32) #x00000002)
(model-add input_b () Bool true)
(model-add k!225 () Bool true)
(model-add rf_0_3 () Bool true)
(model-add topo_U_1 () (_ BitVec 4) #x0)
(model-add topo_U_7 () (_ BitVec 4) #x3)
(model-add topo_T_3 () (_ BitVec 4) #x1)
(model-add topo_T_0 () (_ BitVec 4) #x0)
(model-add rf_8_9 () Bool false)
(model-add final_y () (_ BitVec 32) #x00000002)
(model-add topo_U_6 () (_ BitVec 4) #x9)
(model-add k!223 () Bool true)
(model-add rf_4_5 () Bool true)

(check-sat)
