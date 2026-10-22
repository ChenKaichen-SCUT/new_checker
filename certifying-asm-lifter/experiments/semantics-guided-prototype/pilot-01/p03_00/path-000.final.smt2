; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
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
(declare-fun input_b () Bool)
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
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (let (($x1451 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x1451)))
(assert
 ((_ pbeq 1 1) rf_1_4))
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
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x511 (and true false)))
 (let (($x508 (or false false false or $x511)))
 (=> $x508 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x607 (or false false false $x1112)))
 (=> $x607 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x511 (and true false)))
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x418 (or false false false $x1112 $x511)))
 (=> $x418 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x511 (and true false)))
 (let (($x847 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x847 $x511) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x607 (or false false false $x1112)))
 (=> $x607 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1614 (and false false)))
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x1500 (or false false false $x1112 $x1614)))
 (=> $x1500 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x607 (or false false false $x1112)))
 (=> $x607 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1614 (and false false)))
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x1500 (or false false false $x1112 $x1614)))
 (=> $x1500 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x607 (or false false false $x1112)))
 (=> $x607 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x511 (and true false)))
 (let (($x1112 (or (and rf_1_3 false))))
 (let (($x418 (or false false false $x1112 $x511)))
 (=> $x418 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x1021 (or false false false $x75)))
 (=> $x1021 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x511 (and true false)))
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x404 (or false false false $x75 $x511)))
 (=> $x404 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x511 (and true false)))
 (let (($x323 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x323 $x511) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x1021 (or false false false $x75)))
 (=> $x1021 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x511 (and true false)))
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x404 (or false false false $x75 $x511)))
 (=> $x404 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x1021 (or false false false $x75)))
 (=> $x1021 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x511 (and true false)))
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x404 (or false false false $x75 $x511)))
 (=> $x404 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x75 (or (and rf_1_4 false))))
 (let (($x1021 (or false false false $x75)))
 (=> $x1021 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1614 (and false false)))
 (let (($x75 (or (and rf_1_4 false))))
 (=> (or false false false $x75 $x1614) (bvult topo_T_4 topo_T_4)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x156 (= co_2 (_ bv1 2))))
 (=> $x156 (= (_ bv1 32) final_x))))
(assert
 (let (($x201 (= (_ bv0 32) final_y)))
 (let (($x1585 (= co_1 (_ bv0 1))))
 (=> $x1585 $x201))))
(assert
 (let (($x1239 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1245 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1286 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1496 (and (distinct rf_1_4 true) true)))
 (let (($x1252 (and (distinct rf_1_3 true) true)))
 (let (($x1235 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1917 (and (distinct (_ bv0 32) read_t0_b) true)))
 (or (and (distinct input_b false) true) $x1917 $x1235 $x1252 $x1496 $x1286 $x1245 $x1239)))))))))
(assert
 (let (($x1239 (and (distinct (_ bv0 1) co_1) true)))
(let (($x1245 (and (distinct (_ bv1 2) co_2) true)))
(let (($x1286 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1496 (and (distinct rf_1_4 true) true)))
(let (($x1252 (and (distinct rf_1_3 true) true)))
(let (($x1235 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1917 (and (distinct (_ bv0 32) read_t0_b) true)))
(or (and (distinct input_b true) true) $x1917 $x1235 $x1252 $x1496 $x1286 $x1245 $x1239)))))))))
(check-sat)
