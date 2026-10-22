; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
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
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_6) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_5))
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
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1328 (or false false false or $x1637)))
 (=> $x1328 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false (bvult co_2 co_6) or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1328 (or false false false or $x1637)))
 (=> $x1328 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1328 (or false false false or $x1637)))
 (=> $x1328 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1328 (or false false false or $x1637)))
 (=> $x1328 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x856 (and true false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x758 (or false false false $x128 $x856)))
 (=> $x758 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x856 (and true false)))
 (let (($x642 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x642 $x856) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1637 (and false false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x960 (or false false false $x128 $x1637)))
 (=> $x960 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1637 (and false false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x960 (or false false false $x128 $x1637)))
 (=> $x960 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1637 (and false false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x960 (or false false false $x128 $x1637)))
 (=> $x960 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x856 (and true false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x758 (or false false false $x128 $x856)))
 (=> $x758 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x931 (or false false false $x128)))
 (=> $x931 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x856 (and true false)))
 (let (($x128 (or (and rf_1_4 false))))
 (let (($x758 (or false false false $x128 $x856)))
 (=> $x758 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x856 (and true false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x1361 (or false false false $x1480 $x856)))
 (=> $x1361 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x856 (and true false)))
 (let (($x1508 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x1508 $x856) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x856 (and true false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x1361 (or false false false $x1480 $x856)))
 (=> $x1361 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x856 (and true false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x1361 (or false false false $x1480 $x856)))
 (=> $x1361 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x856 (and true false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x1361 (or false false false $x1480 $x856)))
 (=> $x1361 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (=> (or false false false $x1480 $x1637) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1480 (or (and rf_1_5 false))))
 (let (($x506 (or false false false $x1480)))
 (=> $x506 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1480 (or (and rf_1_5 false))))
 (=> (or true false false $x1480 $x1637) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false (bvult co_6 co_2) or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x856 (and true false)))
 (let (($x1570 (or false false false or $x856)))
 (=> $x1570 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x824 (or false false false or)))
 (=> $x824 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x1637 (and false false)))
 (let (($x1328 (or false false false or $x1637)))
 (=> $x1328 (bvult topo_T_6 topo_T_5)))))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x150 (= co_0 (_ bv2 2))))
 (=> $x150 (= (_ bv0 32) final_x))))
(assert
 (let (($x1681 (= (_ bv1 32) final_x)))
 (let (($x152 (= co_2 (_ bv2 2))))
 (=> $x152 $x1681))))
(assert
 (let (($x1681 (= (_ bv1 32) final_x)))
 (let (($x413 (= co_6 (_ bv2 2))))
 (=> $x413 $x1681))))
(assert
 (let (($x289 (= co_1 (_ bv0 1))))
(=> $x289 (= (_ bv0 32) final_y))))
(check-sat)
