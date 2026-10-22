(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun read_yes () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(assert (= input_b input_b))
(assert true)
(assert (= input_b true))
(assert (bvult co_0 #b10))
(assert (= co_0 #b00))
(assert (bvult co_2 #b10))
(assert (distinct co_0 co_2))
(assert (=> rf_0_1 (= #x00000000 read_yes)))
(assert (=> rf_2_1 (= (bvadd read_yes #x00000001) read_yes)))
(assert ((_ pbeq 1 1 1) rf_0_1 rf_2_1))
(assert (=> rf_0_3 (= #x00000000 read_other)))
(assert (=> rf_2_3 (= (bvadd read_yes #x00000001) read_other)))
(assert ((_ pbeq 1 1 1) rf_0_3 rf_2_3))
(assert (let ((a!1 (and (or (and rf_0_1 (bvult co_0 co_0))
                    (and rf_2_1 (bvult co_2 co_0)))
                (bvult co_0 co_2))))
  (not a!1)))
(assert (bvult topo_U_0 #b100))
(assert (bvult topo_U_1 #b100))
(assert (bvult topo_U_2 #b100))
(assert (bvult topo_U_3 #b100))
(assert (bvult topo_T_0 #b100))
(assert (bvult topo_T_1 #b100))
(assert (bvult topo_T_2 #b100))
(assert (bvult topo_T_3 #b100))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false (bvult co_0 co_2) or (and true false))
    (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_1 (bvult co_0 co_0))
        (and rf_2_1 (bvult co_2 co_0)))
    (bvult topo_U_1 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_1 (bvult co_0 co_0))
        (and rf_2_1 (bvult co_2 co_0))
        (and true false))
    (bvult topo_T_1 topo_T_0)))
(assert (=> (or false false false (and rf_0_1 false) (and rf_2_1 false))
    (bvult topo_U_1 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_2))
        (and rf_2_1 (bvult co_2 co_2)))
    (bvult topo_U_1 topo_U_2)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_2))
        (and rf_2_1 (bvult co_2 co_2))
        (and false false))
    (bvult topo_T_1 topo_T_2)))
(assert (=> (or false false false (and rf_0_1 false) (and rf_2_1 false))
    (bvult topo_U_1 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and true false))
    (bvult topo_T_1 topo_T_3)))
(assert (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false (bvult co_2 co_0) or (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_2_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2)))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and true false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false false false (and rf_0_3 false) (and rf_2_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (= co_0 #b01) (= #x00000000 final_x)))
(assert (=> (= co_2 #b01) (= final_x (bvadd read_yes #x00000001))))

(check-sat)
