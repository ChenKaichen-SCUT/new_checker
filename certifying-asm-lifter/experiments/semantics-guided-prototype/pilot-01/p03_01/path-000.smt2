; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_4_3 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (bvult topo_U_0 (_ bv5 3)))
(assert
 (bvult topo_U_1 (_ bv5 3)))
(assert
 (bvult topo_U_2 (_ bv5 3)))
(assert
 (bvult topo_U_3 (_ bv5 3)))
(assert
 (bvult topo_U_4 (_ bv5 3)))
(assert
 (bvult topo_T_0 (_ bv5 3)))
(assert
 (bvult topo_T_1 (_ bv5 3)))
(assert
 (bvult topo_T_2 (_ bv5 3)))
(assert
 (bvult topo_T_3 (_ bv5 3)))
(assert
 (bvult topo_T_4 (_ bv5 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_2 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x866 (or false false false $x873)))
 (=> $x866 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x165 (and true false)))
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x873 $x165) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1471 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1471) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x165 (and true false)))
 (let (($x1471 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1471 $x165) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x866 (or false false false $x873)))
 (=> $x866 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x182 (or false false false $x873 $x1604)))
 (=> $x182 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x866 (or false false false $x873)))
 (=> $x866 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x873 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x182 (or false false false $x873 $x1604)))
 (=> $x182 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x279 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x279) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x165 (and true false)))
 (let (($x279 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x279 $x165) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x696 (or false false false or)))
 (=> $x696 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x165 (and true false)))
 (let (($x1007 (or false false false or $x165)))
 (=> $x1007 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x286 (= co_0 (_ bv1 2))))
 (=> $x286 (= (_ bv0 32) final_x))))
(assert
 (let (($x292 (= co_2 (_ bv1 2))))
 (=> $x292 (= (_ bv1 32) final_x))))
(assert
 (let (($x766 (= co_1 (_ bv1 2))))
 (=> $x766 (= (_ bv0 32) final_y))))
(assert
 (let (($x919 (= co_4 (_ bv1 2))))
(=> $x919 (= (_ bv1 32) final_y))))
(check-sat)
