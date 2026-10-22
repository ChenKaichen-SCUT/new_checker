(declare-fun rf_0_3 () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun rf_4_3 () Bool)
(declare-fun final_y () (_ BitVec 32))
(declare-fun rf_2_3 () Bool)
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0s1a () (_ BitVec 32))
(declare-fun k!124 () Bool)
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun k!125 () Bool)
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun k!126 () Bool)
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun k!127 () Bool)
(declare-fun topo_T_6 () (_ BitVec 3))
(declare-fun k!128 () Bool)
(declare-fun k!129 () Bool)
(declare-fun k!130 () Bool)
(declare-fun k!131 () Bool)
(declare-fun input_b () Bool)
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1s1a () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= (= #x00000000 read_t0s1a) true))
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_2 #b11))
(assert (bvult co_4 #b11))
(assert (distinct co_0 co_2 co_4))
(assert (bvult co_1 #b1))
(assert (= co_1 #b0))
(assert (distinct co_1))
(assert (=> rf_0_3 (= #x00000000 read_t0s1a)))
(assert (=> rf_2_3 (= #x00000002 read_t0s1a)))
(assert (=> rf_4_3 (= #x00000001 read_t0s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert (=> rf_0_5 (= #x00000000 read_t1s1a)))
(assert (=> rf_2_5 (= #x00000002 read_t1s1a)))
(assert (=> rf_4_5 (= #x00000001 read_t1s1a)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_4_5))
(assert (bvult topo_U_0 #b111))
(assert (bvult topo_U_1 #b111))
(assert (bvult topo_U_2 #b111))
(assert (bvult topo_U_3 #b111))
(assert (bvult topo_U_4 #b111))
(assert (bvult topo_U_5 #b111))
(assert (bvult topo_U_6 #b111))
(assert (bvult topo_T_0 #b111))
(assert (bvult topo_T_1 #b111))
(assert (bvult topo_T_2 #b111))
(assert (bvult topo_T_3 #b111))
(assert (bvult topo_T_4 #b111))
(assert (bvult topo_T_5 #b111))
(assert (bvult topo_T_6 #b111))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false (bvult co_0 co_2) or (and true false))
    (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_0 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_0 topo_T_6)))
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
(assert (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false (bvult co_2 co_0) or (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and false rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or true false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or true false (bvult co_2 co_4) or (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_2 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0))
        (and rf_4_3 (bvult co_4 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2)))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2))
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_6)))
(assert (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false (bvult co_4 co_0) or (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false (bvult co_4 co_2) or (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false false false or) (bvult topo_U_4 topo_U_6)))
(assert (=> (or false false false or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_4_5 (bvult co_4 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_4_5 (bvult co_4 co_2)))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_4_5 (bvult co_4 co_2))
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_2_5 (bvult co_2 co_4))
        (and rf_4_5 (bvult co_4 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_2_5 (bvult co_2 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_6)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_6)))
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
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_2 #b10) (= #x00000002 final_x)))
(assert (=> (= co_4 #b10) (= #x00000001 final_x)))
(assert (=> (= co_1 #b0) (= #x00000000 final_y)))
(model-add rf_0_3 () Bool true)
(model-add co_0 () (_ BitVec 2) #b00)
(model-add rf_4_3 () Bool false)
(model-add final_y () (_ BitVec 32) #x00000000)
(model-add rf_2_3 () Bool false)
(model-add co_1 () (_ BitVec 1) #b0)
(model-add read_t0s1a () (_ BitVec 32) #x00000000)
(model-del k!124)
(model-add topo_U_1 () (_ BitVec 3) (ite k!124 #b111 (bvnot #b111)))
(model-del k!125)
(model-add topo_U_6 () (_ BitVec 3) (ite k!125 #b111 (bvnot #b111)))
(model-del k!126)
(model-add topo_T_1 () (_ BitVec 3) (ite k!126 #b111 (bvnot #b111)))
(model-del k!127)
(model-add topo_T_6 () (_ BitVec 3) (ite k!127 #b111 (bvnot #b111)))
(model-del k!128)
(model-add k!124 () Bool (not k!128))
(model-del k!129)
(model-add k!125 () Bool (not k!129))
(model-del k!130)
(model-add k!126 () Bool (not k!130))
(model-del k!131)
(model-add k!127 () Bool (not k!131))

(check-sat)
