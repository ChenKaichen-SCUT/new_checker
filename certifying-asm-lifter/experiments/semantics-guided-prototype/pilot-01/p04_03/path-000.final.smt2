; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
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
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_6 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_2_6))
(assert
 (bvult topo_U_0 (_ bv7 3)))
(assert
 (bvult topo_U_1 (_ bv7 3)))
(assert
 (bvult topo_U_2 (_ bv7 3)))
(assert
 (bvult topo_U_3 (_ bv7 3)))
(assert
 (bvult topo_U_4 (_ bv7 3)))
(assert
 (bvult topo_U_5 (_ bv7 3)))
(assert
 (bvult topo_U_6 (_ bv7 3)))
(assert
 (bvult topo_T_0 (_ bv7 3)))
(assert
 (bvult topo_T_1 (_ bv7 3)))
(assert
 (bvult topo_T_2 (_ bv7 3)))
(assert
 (bvult topo_T_3 (_ bv7 3)))
(assert
 (bvult topo_T_4 (_ bv7 3)))
(assert
 (bvult topo_T_5 (_ bv7 3)))
(assert
 (bvult topo_T_6 (_ bv7 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1519 (and false false)))
 (let (($x2000 (or false false false or $x1519)))
 (=> $x2000 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1519 (and false false)))
 (let (($x2000 (or false false false or $x1519)))
 (=> $x2000 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x1519 (and false false)))
 (let (($x2000 (or false false false or $x1519)))
 (=> $x2000 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1519 (and false false)))
 (let (($x2000 (or false false false or $x1519)))
 (=> $x2000 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1498 (or false false false $x1045)))
 (=> $x1498 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1701 (or false false false $x1045 $x1383)))
 (=> $x1701 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1657 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1657) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1657 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1657 $x1383) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1498 (or false false false $x1045)))
 (=> $x1498 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1519 (and false false)))
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1345 (or false false false $x1045 $x1519)))
 (=> $x1345 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1498 (or false false false $x1045)))
 (=> $x1498 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1519 (and false false)))
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1345 (or false false false $x1045 $x1519)))
 (=> $x1345 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1498 (or false false false $x1045)))
 (=> $x1498 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1519 (and false false)))
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1345 (or false false false $x1045 $x1519)))
 (=> $x1345 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x358 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x358) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1383 (and true false)))
 (let (($x358 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x358 $x1383) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1498 (or false false false $x1045)))
 (=> $x1498 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1045 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1701 (or false false false $x1045 $x1383)))
 (=> $x1701 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1383 (and true false)))
 (let (($x176 (or false false false or $x1383)))
 (=> $x176 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1604 (or false false false or)))
 (=> $x1604 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1519 (and false false)))
 (let (($x2000 (or false false false or $x1519)))
 (=> $x2000 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1434 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x1434) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1434 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x1434 $x1383) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x540 (or false false false $x1008)))
 (=> $x540 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x355 (or false false false $x1008 $x1383)))
 (=> $x355 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1317 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1317) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1317 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1317 $x1383) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x540 (or false false false $x1008)))
 (=> $x540 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x355 (or false false false $x1008 $x1383)))
 (=> $x355 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x540 (or false false false $x1008)))
 (=> $x540 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1383 (and true false)))
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x355 (or false false false $x1008 $x1383)))
 (=> $x355 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x540 (or false false false $x1008)))
 (=> $x540 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1519 (and false false)))
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x778 (or false false false $x1008 $x1519)))
 (=> $x778 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x540 (or false false false $x1008)))
 (=> $x540 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1519 (and false false)))
 (let (($x1008 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x778 (or false false false $x1008 $x1519)))
 (=> $x778 (bvult topo_T_6 topo_T_6))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x455 (= (_ bv1 32) final_x)))
 (let (($x1088 (= co_2 (_ bv1 2))))
 (=> $x1088 $x455))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1727 (= (_ bv1 32) final_y)))
 (let (($x439 (= co_5 (_ bv1 2))))
 (=> $x439 $x1727))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x456 (and (distinct rf_2_6 false) true)))
 (let (($x318 (and (distinct rf_0_6 true) true)))
 (let (($x1203 (and (distinct rf_5_4 true) true)))
 (let (($x400 (and (distinct rf_1_4 false) true)))
 (let (($x538 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1699 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x255 (and (distinct input_b false) true)))
 (or $x255 $x1699 $x538 $x400 $x1203 $x318 $x456 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x456 (and (distinct rf_2_6 false) true)))
 (let (($x318 (and (distinct rf_0_6 true) true)))
 (let (($x996 (and (distinct rf_5_4 false) true)))
 (let (($x147 (and (distinct rf_1_4 true) true)))
 (let (($x538 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x985 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x255 (and (distinct input_b false) true)))
 (or $x255 $x985 $x538 $x147 $x996 $x318 $x456 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1522 (and (distinct rf_2_6 true) true)))
 (let (($x1914 (and (distinct rf_0_6 false) true)))
 (let (($x996 (and (distinct rf_5_4 false) true)))
 (let (($x147 (and (distinct rf_1_4 true) true)))
 (let (($x462 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x985 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x255 (and (distinct input_b false) true)))
 (or $x255 $x985 $x462 $x147 $x996 $x1914 $x1522 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1522 (and (distinct rf_2_6 true) true)))
 (let (($x1914 (and (distinct rf_0_6 false) true)))
 (let (($x996 (and (distinct rf_5_4 false) true)))
 (let (($x147 (and (distinct rf_1_4 true) true)))
 (let (($x462 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x985 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1511 (and (distinct input_b true) true)))
 (or $x1511 $x985 $x462 $x147 $x996 $x1914 $x1522 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1522 (and (distinct rf_2_6 true) true)))
 (let (($x1914 (and (distinct rf_0_6 false) true)))
 (let (($x1203 (and (distinct rf_5_4 true) true)))
 (let (($x400 (and (distinct rf_1_4 false) true)))
 (let (($x462 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1699 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1511 (and (distinct input_b true) true)))
 (or $x1511 $x1699 $x462 $x400 $x1203 $x1914 $x1522 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1522 (and (distinct rf_2_6 true) true)))
 (let (($x1914 (and (distinct rf_0_6 false) true)))
 (let (($x1203 (and (distinct rf_5_4 true) true)))
 (let (($x400 (and (distinct rf_1_4 false) true)))
 (let (($x462 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1699 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x255 (and (distinct input_b false) true)))
 (or $x255 $x1699 $x462 $x400 $x1203 $x1914 $x1522 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x995 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x456 (and (distinct rf_2_6 false) true)))
 (let (($x318 (and (distinct rf_0_6 true) true)))
 (let (($x1203 (and (distinct rf_5_4 true) true)))
 (let (($x400 (and (distinct rf_1_4 false) true)))
 (let (($x538 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1699 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1511 (and (distinct input_b true) true)))
 (or $x1511 $x1699 $x538 $x400 $x1203 $x318 $x456 $x995 $x1494 $x806 $x1576)))))))))))))
(assert
 (let (($x1576 (and (distinct (_ bv1 2) co_5) true)))
(let (($x806 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
(let (($x995 (and (distinct (_ bv0 2) co_0) true)))
(let (($x456 (and (distinct rf_2_6 false) true)))
(let (($x318 (and (distinct rf_0_6 true) true)))
(let (($x996 (and (distinct rf_5_4 false) true)))
(let (($x147 (and (distinct rf_1_4 true) true)))
(let (($x538 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x985 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x1511 (and (distinct input_b true) true)))
(or $x1511 $x985 $x538 $x147 $x996 $x318 $x456 $x995 $x1494 $x806 $x1576)))))))))))))
(check-sat)
