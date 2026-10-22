; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (let (($x1780 (bvult co_0 co_3)))
 (let (($x75 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x75 $x1780)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (bvult topo_U_0 (_ bv6 3)))
(assert
 (bvult topo_U_1 (_ bv6 3)))
(assert
 (bvult topo_U_2 (_ bv6 3)))
(assert
 (bvult topo_U_3 (_ bv6 3)))
(assert
 (bvult topo_U_4 (_ bv6 3)))
(assert
 (bvult topo_U_5 (_ bv6 3)))
(assert
 (bvult topo_T_0 (_ bv6 3)))
(assert
 (bvult topo_T_1 (_ bv6 3)))
(assert
 (bvult topo_T_2 (_ bv6 3)))
(assert
 (bvult topo_T_3 (_ bv6 3)))
(assert
 (bvult topo_T_4 (_ bv6 3)))
(assert
 (bvult topo_T_5 (_ bv6 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x75 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x75) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1443 (and true false)))
 (let (($x75 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x75 $x1443) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1347 (or false false false $x477)))
 (=> $x1347 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1443 (and true false)))
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1183 (or false false false $x477 $x1443)))
 (=> $x1183 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1347 (or false false false $x477)))
 (=> $x1347 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1262 (and false false)))
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x477 $x1262) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1224 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1224) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1262 (and false false)))
 (let (($x1224 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1224 $x1262) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1347 (or false false false $x477)))
 (=> $x1347 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1262 (and false false)))
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x477 $x1262) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1347 (or false false false $x477)))
 (=> $x1347 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1443 (and true false)))
 (let (($x477 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1183 (or false false false $x477 $x1443)))
 (=> $x1183 (bvult topo_T_2 topo_T_5))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x814 (or false false false $x598)))
 (=> $x814 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1443 (and true false)))
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x598 $x1443) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1176 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1176) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1176 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1176 $x1443) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x814 (or false false false $x598)))
 (=> $x814 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1262 (and false false)))
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1364 (or false false false $x598 $x1262)))
 (=> $x1364 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x814 (or false false false $x598)))
 (=> $x814 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1262 (and false false)))
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1364 (or false false false $x598 $x1262)))
 (=> $x1364 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x814 (or false false false $x598)))
 (=> $x814 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1262 (and false false)))
 (let (($x598 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1364 (or false false false $x598 $x1262)))
 (=> $x1364 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1303 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1303) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1303 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1303 $x1443) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x256 (or false false false or)))
 (=> $x256 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1443 (and true false)))
 (let (($x1485 (or false false false or $x1443)))
 (=> $x1485 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x766 (= co_0 (_ bv1 2))))
 (=> $x766 (= (_ bv0 32) final_x))))
(assert
 (let (($x532 (= co_3 (_ bv1 2))))
 (=> $x532 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x846 (= co_1 (_ bv1 2))))
 (=> $x846 (= (_ bv0 32) final_y))))
(assert
 (let (($x1452 (= co_5 (_ bv1 2))))
(=> $x1452 (= (_ bv1 32) final_y))))
(check-sat)
