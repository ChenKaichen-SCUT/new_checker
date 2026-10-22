; benchmark generated from python API
(set-info :status unknown)
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
(assert
 true)
(assert
 (= input_b true))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (let (($x193 (= (_ bv0 32) read_yes)))
 (=> rf_0_1 $x193)))
(assert
 (=> rf_2_1 (= (bvadd read_yes (_ bv1 32)) read_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_1 rf_2_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_3 (= (bvadd read_yes (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1) rf_0_3 rf_2_3))
(assert
 (let (($x266 (bvult co_0 co_2)))
 (let (($x780 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (not (and $x780 $x266)))))
(assert
 (bvult topo_U_0 (_ bv4 3)))
(assert
 (bvult topo_U_1 (_ bv4 3)))
(assert
 (bvult topo_U_2 (_ bv4 3)))
(assert
 (bvult topo_U_3 (_ bv4 3)))
(assert
 (bvult topo_T_0 (_ bv4 3)))
(assert
 (bvult topo_T_1 (_ bv4 3)))
(assert
 (bvult topo_T_2 (_ bv4 3)))
(assert
 (bvult topo_T_3 (_ bv4 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x780 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x780) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x677 (and true false)))
 (let (($x780 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x780 $x677) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x763 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x16 (or false false false $x763)))
 (=> $x16 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x528 (and false false)))
 (let (($x763 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x763 $x528) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x983 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x983) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x528 (and false false)))
 (let (($x983 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x983 $x528) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x763 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x16 (or false false false $x763)))
 (=> $x16 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x677 (and true false)))
 (let (($x763 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x763 $x677) (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert
 (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x936 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x936) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x677 (and true false)))
 (let (($x936 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x936 $x677) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x294 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x863 (or false false false $x294)))
 (=> $x863 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x677 (and true false)))
 (let (($x294 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x294 $x677) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x57 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x57) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x677 (and true false)))
 (let (($x57 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x57 $x677) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x294 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x863 (or false false false $x294)))
 (=> $x863 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x528 (and false false)))
 (let (($x294 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x294 $x528) (bvult topo_T_3 topo_T_3)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x541 (= co_2 (_ bv1 2))))
 (=> $x541 (= final_x (bvadd read_yes (_ bv1 32))))))
(assert
 (let (($x1099 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x794 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x872 (and (distinct rf_2_1 false) true)))
 (let (($x959 (and (distinct rf_0_1 true) true)))
 (let (($x392 (and (distinct (_ bv0 32) read_yes) true)))
 (let (($x846 (and (distinct input_b true) true)))
 (or $x846 $x392 (and (distinct (_ bv0 32) read_other) true) $x959 $x872 (and (distinct rf_0_3 true) true) (and (distinct rf_2_3 false) true) $x794 $x1099))))))))
(assert
 (let (($x1099 (and (distinct (_ bv1 2) co_2) true)))
(let (($x794 (and (distinct (_ bv0 2) co_0) true)))
(let (($x872 (and (distinct rf_2_1 false) true)))
(let (($x959 (and (distinct rf_0_1 true) true)))
(let (($x392 (and (distinct (_ bv0 32) read_yes) true)))
(let (($x846 (and (distinct input_b true) true)))
(or $x846 $x392 (and (distinct (_ bv1 32) read_other) true) $x959 $x872 (and (distinct rf_0_3 false) true) (and (distinct rf_2_3 true) true) $x794 $x1099))))))))
(check-sat)
