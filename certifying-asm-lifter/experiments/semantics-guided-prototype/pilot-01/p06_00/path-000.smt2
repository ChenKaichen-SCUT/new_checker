; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
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
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (let (($x473 (bvult co_0 co_3)))
 (let (($x775 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x775 $x473)))))
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
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x775 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x775) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1416 (and true false)))
 (let (($x775 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x775 $x1416) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x27 (or false false false $x1443)))
 (=> $x27 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1485 (or false false false $x1443 $x1416)))
 (=> $x1485 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x27 (or false false false $x1443)))
 (=> $x27 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1443 $x1604) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1200 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1200) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1200 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1200 $x1604) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x27 (or false false false $x1443)))
 (=> $x27 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x1443 $x1604) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x27 (or false false false $x1443)))
 (=> $x27 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1443 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1485 (or false false false $x1443 $x1416)))
 (=> $x1485 (bvult topo_T_2 topo_T_5))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x465 (or false false false or)))
 (=> $x465 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1492 (or false false false or $x1416)))
 (=> $x1492 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1822 (or false false false $x1230)))
 (=> $x1822 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x586 (or false false false $x1230 $x1416)))
 (=> $x586 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x1416 (and true false)))
 (let (($x1215 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1215 $x1416) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1822 (or false false false $x1230)))
 (=> $x1822 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1143 (or false false false $x1230 $x1604)))
 (=> $x1143 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1822 (or false false false $x1230)))
 (=> $x1822 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1143 (or false false false $x1230 $x1604)))
 (=> $x1143 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1822 (or false false false $x1230)))
 (=> $x1822 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1143 (or false false false $x1230 $x1604)))
 (=> $x1143 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x1822 (or false false false $x1230)))
 (=> $x1822 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x1230 (or (and rf_1_4 false))))
 (let (($x586 (or false false false $x1230 $x1416)))
 (=> $x586 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x684 (or false false false $x681)))
 (=> $x684 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x1744 (or false false false $x681 $x1416)))
 (=> $x1744 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x1416 (and true false)))
 (let (($x1474 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x1474 $x1416) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x684 (or false false false $x681)))
 (=> $x684 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x1744 (or false false false $x681 $x1416)))
 (=> $x1744 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x684 (or false false false $x681)))
 (=> $x684 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x1744 (or false false false $x681 $x1416)))
 (=> $x1744 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x684 (or false false false $x681)))
 (=> $x684 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1416 (and true false)))
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x1744 (or false false false $x681 $x1416)))
 (=> $x1744 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x681 (or (and rf_1_5 false))))
 (let (($x684 (or false false false $x681)))
 (=> $x684 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1604 (and false false)))
 (let (($x681 (or (and rf_1_5 false))))
 (=> (or false false false $x681 $x1604) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x577 (= co_0 (_ bv1 2))))
 (=> $x577 (= (_ bv0 32) final_x))))
(assert
 (let (($x1279 (= co_3 (_ bv1 2))))
 (=> $x1279 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1655 (= co_1 (_ bv0 1))))
(=> $x1655 (= (_ bv0 32) final_y))))
(check-sat)
