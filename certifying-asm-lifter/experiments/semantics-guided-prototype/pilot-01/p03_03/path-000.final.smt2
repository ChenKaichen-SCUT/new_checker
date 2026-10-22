; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
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
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_2_5))
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
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x98 (and false false)))
 (let (($x696 (or false false false or $x98)))
 (=> $x696 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1447 (or false false false $x1416)))
 (=> $x1447 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x236 (or false false false $x1416 $x1709)))
 (=> $x236 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1494 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1494) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1494 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1494 $x1709) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1447 (or false false false $x1416)))
 (=> $x1447 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x98 (and false false)))
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x762 (or false false false $x1416 $x98)))
 (=> $x762 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1447 (or false false false $x1416)))
 (=> $x1447 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x98 (and false false)))
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x762 (or false false false $x1416 $x98)))
 (=> $x762 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1442 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x1442) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1442 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x1442 $x1709) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1447 (or false false false $x1416)))
 (=> $x1447 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1416 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x236 (or false false false $x1416 $x1709)))
 (=> $x236 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1716 (or false false false or $x1709)))
 (=> $x1716 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x1479 (or false false false or)))
 (=> $x1479 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x98 (and false false)))
 (let (($x696 (or false false false or $x98)))
 (=> $x696 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1568 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x1568) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1568 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x1568 $x1709) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x629 (or false false false $x255)))
 (=> $x629 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x1709 (and true false)))
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x202 (or false false false $x255 $x1709)))
 (=> $x202 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1338 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x1338) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1709 (and true false)))
 (let (($x1338 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x1338 $x1709) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x629 (or false false false $x255)))
 (=> $x629 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1709 (and true false)))
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x202 (or false false false $x255 $x1709)))
 (=> $x202 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x629 (or false false false $x255)))
 (=> $x629 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x98 (and false false)))
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x1183 (or false false false $x255 $x98)))
 (=> $x1183 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x629 (or false false false $x255)))
 (=> $x629 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x98 (and false false)))
 (let (($x255 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x1183 (or false false false $x255 $x98)))
 (=> $x1183 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x508 (= co_2 (_ bv1 2))))
 (=> $x508 (= (_ bv1 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1209 (= co_4 (_ bv1 2))))
 (=> $x1209 (= (_ bv1 32) final_y))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1113 (and (distinct rf_2_5 false) true)))
 (let (($x1505 (and (distinct rf_0_5 true) true)))
 (let (($x1657 (and (distinct rf_4_3 true) true)))
 (let (($x1907 (and (distinct rf_1_3 false) true)))
 (let (($x1607 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x25 (and (distinct input_b false) true)))
 (or $x25 $x991 $x1607 $x1907 $x1657 $x1505 $x1113 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1113 (and (distinct rf_2_5 false) true)))
 (let (($x1505 (and (distinct rf_0_5 true) true)))
 (let (($x411 (and (distinct rf_4_3 false) true)))
 (let (($x1637 (and (distinct rf_1_3 true) true)))
 (let (($x1607 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1411 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x25 (and (distinct input_b false) true)))
 (or $x25 $x1411 $x1607 $x1637 $x411 $x1505 $x1113 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1113 (and (distinct rf_2_5 false) true)))
 (let (($x1505 (and (distinct rf_0_5 true) true)))
 (let (($x411 (and (distinct rf_4_3 false) true)))
 (let (($x1637 (and (distinct rf_1_3 true) true)))
 (let (($x1607 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1411 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1275 (and (distinct input_b true) true)))
 (or $x1275 $x1411 $x1607 $x1637 $x411 $x1505 $x1113 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1113 (and (distinct rf_2_5 false) true)))
 (let (($x1505 (and (distinct rf_0_5 true) true)))
 (let (($x1657 (and (distinct rf_4_3 true) true)))
 (let (($x1907 (and (distinct rf_1_3 false) true)))
 (let (($x1607 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1275 (and (distinct input_b true) true)))
 (or $x1275 $x991 $x1607 $x1907 $x1657 $x1505 $x1113 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1429 (and (distinct rf_2_5 true) true)))
 (let (($x1413 (and (distinct rf_0_5 false) true)))
 (let (($x1657 (and (distinct rf_4_3 true) true)))
 (let (($x1907 (and (distinct rf_1_3 false) true)))
 (let (($x1253 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x25 (and (distinct input_b false) true)))
 (or $x25 $x991 $x1253 $x1907 $x1657 $x1413 $x1429 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1429 (and (distinct rf_2_5 true) true)))
 (let (($x1413 (and (distinct rf_0_5 false) true)))
 (let (($x1657 (and (distinct rf_4_3 true) true)))
 (let (($x1907 (and (distinct rf_1_3 false) true)))
 (let (($x1253 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1275 (and (distinct input_b true) true)))
 (or $x1275 $x991 $x1253 $x1907 $x1657 $x1413 $x1429 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x424 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1429 (and (distinct rf_2_5 true) true)))
 (let (($x1413 (and (distinct rf_0_5 false) true)))
 (let (($x411 (and (distinct rf_4_3 false) true)))
 (let (($x1637 (and (distinct rf_1_3 true) true)))
 (let (($x1253 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1411 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1275 (and (distinct input_b true) true)))
 (or $x1275 $x1411 $x1253 $x1637 $x411 $x1413 $x1429 $x1364 $x1366 $x424 $x1451)))))))))))))
(assert
 (let (($x1451 (and (distinct (_ bv1 2) co_4) true)))
(let (($x424 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1366 (and (distinct (_ bv1 2) co_2) true)))
(let (($x1364 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1429 (and (distinct rf_2_5 true) true)))
(let (($x1413 (and (distinct rf_0_5 false) true)))
(let (($x411 (and (distinct rf_4_3 false) true)))
(let (($x1637 (and (distinct rf_1_3 true) true)))
(let (($x1253 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x1411 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x25 (and (distinct input_b false) true)))
(or $x25 $x1411 $x1253 $x1637 $x411 $x1413 $x1429 $x1364 $x1366 $x424 $x1451)))))))))))))
(check-sat)
