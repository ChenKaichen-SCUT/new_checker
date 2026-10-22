(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun rf_4_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun final_x () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun k!1346 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun k!1347 () Bool)
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun k!1348 () Bool)
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun k!1349 () Bool)
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun k!1350 () Bool)
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun k!1351 () Bool)
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun k!1352 () Bool)
(declare-fun k!1353 () Bool)
(declare-fun k!1354 () Bool)
(declare-fun k!1355 () Bool)
(declare-fun k!1356 () Bool)
(declare-fun k!1357 () Bool)
(declare-fun input_b () Bool)
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1s0a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun final_y () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) false))
(assert (= (= #x00000000 #x00000000) true))
(assert (bvult co_0 #b1))
(assert (= co_0 #b0))
(assert (distinct co_0))
(assert (bvult co_1 #b11))
(assert (= co_1 #b00))
(assert (bvult co_3 #b11))
(assert (bvult co_4 #b11))
(assert (distinct co_1 co_3 co_4))
(assert (=> rf_1_2 (= #x00000000 read_t0s1a)))
(assert (=> rf_3_2 (= (bvadd read_t0s1a #x00000000) read_t0s1a)))
(assert (=> rf_4_2 (= #x00000000 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_1_2 rf_3_2 rf_4_2))
(assert (=> rf_1_5 (= #x00000000 read_t1s0a)))
(assert (=> rf_3_5 (= (bvadd read_t0s1a #x00000000) read_t1s0a)))
(assert (=> rf_4_5 (= #x00000000 read_t1s0a)))
(assert ((_ pbeq 1 1 1 1) rf_1_5 rf_3_5 rf_4_5))
(assert (not (and (or (and rf_1_2 false) (and rf_3_2 false) (and rf_4_2 false)) false)))
(assert (let ((a!1 (and (or (and rf_1_2 (bvult co_1 co_1))
                    (and rf_3_2 (bvult co_3 co_1))
                    (and rf_4_2 (bvult co_4 co_1)))
                (bvult co_1 co_3))))
  (not a!1)))
(assert (bvult topo_U_0 #x8))
(assert (bvult topo_U_1 #x8))
(assert (bvult topo_U_2 #x8))
(assert (bvult topo_U_3 #x8))
(assert (bvult topo_U_4 #x8))
(assert (bvult topo_U_5 #x8))
(assert (bvult topo_U_6 #x8))
(assert (bvult topo_U_7 #x8))
(assert (bvult topo_T_0 #x8))
(assert (bvult topo_T_1 #x8))
(assert (bvult topo_T_2 #x8))
(assert (bvult topo_T_3 #x8))
(assert (bvult topo_T_4 #x8))
(assert (bvult topo_T_5 #x8))
(assert (bvult topo_T_6 #x8))
(assert (bvult topo_T_7 #x8))
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
(assert (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert (=> (or false false (bvult co_1 co_4) or (and true false))
    (bvult topo_T_1 topo_T_4)))
(assert (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_1 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false))
    (bvult topo_U_2 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_4_2 (bvult co_4 co_1)))
    (bvult topo_U_2 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 (bvult co_1 co_1))
        (and rf_3_2 (bvult co_3 co_1))
        (and rf_4_2 (bvult co_4 co_1))
        (and true false))
    (bvult topo_T_2 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false))
    (bvult topo_U_2 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false)
        (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_4_2 (bvult co_4 co_3)))
    (bvult topo_U_2 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_3))
        (and rf_3_2 (bvult co_3 co_3))
        (and rf_4_2 (bvult co_4 co_3))
        (and false false))
    (bvult topo_T_2 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_4))
        (and rf_3_2 (bvult co_3 co_4))
        (and rf_4_2 (bvult co_4 co_4)))
    (bvult topo_U_2 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_1_2 (bvult co_1 co_4))
        (and rf_3_2 (bvult co_3 co_4))
        (and rf_4_2 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false))
    (bvult topo_U_2 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false))
    (bvult topo_U_2 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false))
    (bvult topo_U_2 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_2 false)
        (and rf_3_2 false)
        (and rf_4_2 false)
        (and true false))
    (bvult topo_T_2 topo_T_7)))
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
(assert (=> (or true false (bvult co_3 co_4) or) (bvult topo_U_3 topo_U_4)))
(assert (=> (or true false (bvult co_3 co_4) or (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_3 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false (bvult co_4 co_1) or (and true false))
    (bvult topo_T_4 topo_T_1)))
(assert (=> (or false rf_4_2 false or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false false or (and false rf_4_2)) (bvult topo_T_4 topo_T_2)))
(assert (=> (or false false (bvult co_4 co_3) or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false (bvult co_4 co_3) or (and false false))
    (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_7)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_3_5 (bvult co_3 co_1))
        (and rf_4_5 (bvult co_4 co_1)))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_1))
        (and rf_3_5 (bvult co_3 co_1))
        (and rf_4_5 (bvult co_4 co_1))
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_4_5 (bvult co_4 co_3)))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_3))
        (and rf_3_5 (bvult co_3 co_3))
        (and rf_4_5 (bvult co_4 co_3))
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_4))
        (and rf_3_5 (bvult co_3 co_4))
        (and rf_4_5 (bvult co_4 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 (bvult co_1 co_4))
        (and rf_3_5 (bvult co_3 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_7)))
(assert (=> (or false
        false
        false
        (and rf_1_5 false)
        (and rf_3_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_7)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_0)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_2)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_3)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_4)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_5)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_6 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_7)))
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
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_6)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_6)))
(assert (=> (or false false false or) (bvult topo_U_7 topo_U_7)))
(assert (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert (=> (= co_0 #b0) (= #x00000000 final_x)))
(assert (=> (= co_1 #b10) (= #x00000000 final_y)))
(assert (=> (= co_3 #b10) (= final_y (bvadd read_t0s1a #x00000000))))
(assert (=> (= co_4 #b10) (= #x00000000 final_y)))
(model-add co_0 () (_ BitVec 1) #b0)
(model-add co_1 () (_ BitVec 2) #b00)
(model-add rf_4_2 () Bool false)
(model-add rf_3_2 () Bool true)
(model-add final_x () (_ BitVec 32) #x00000000)
(model-add rf_1_2 () Bool false)
(model-del k!1346)
(model-add topo_U_0
           ()
           (_ BitVec 4)
           (ite (or k!1346 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1347)
(model-add topo_U_6
           ()
           (_ BitVec 4)
           (ite (or k!1347 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1348)
(model-add topo_U_7
           ()
           (_ BitVec 4)
           (ite (or k!1348 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1349)
(model-add topo_T_0
           ()
           (_ BitVec 4)
           (ite (or k!1349 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1350)
(model-add topo_T_6
           ()
           (_ BitVec 4)
           (ite (or k!1350 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1351)
(model-add topo_T_7
           ()
           (_ BitVec 4)
           (ite (or k!1351 (= #x8 #x0)) #x8 (bvsub #x8 #x1)))
(model-del k!1352)
(model-add k!1346 () Bool (not k!1352))
(model-del k!1353)
(model-add k!1347 () Bool (not k!1353))
(model-del k!1354)
(model-add k!1348 () Bool (not k!1354))
(model-del k!1355)
(model-add k!1349 () Bool (not k!1355))
(model-del k!1356)
(model-add k!1350 () Bool (not k!1356))
(model-del k!1357)
(model-add k!1351 () Bool (not k!1357))

(check-sat)
