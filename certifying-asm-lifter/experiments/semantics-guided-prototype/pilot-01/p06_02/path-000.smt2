; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_6_5 () Bool)
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
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_1 co_6) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_6_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_6_5))
(assert
 (let (($x448 (bvult co_0 co_3)))
 (let (($x963 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x963 $x448)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x700 (bvult co_1 co_6)))
 (let (($x877 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x877 $x700)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
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
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x963 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x963) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x410 (and true false)))
 (let (($x963 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x963 $x410) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1500 (or false false false $x598)))
 (=> $x1500 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x410 (and true false)))
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x675 (or false false false $x598 $x410)))
 (=> $x675 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1500 (or false false false $x598)))
 (=> $x1500 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x598 $x1649) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1442 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1442) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1649 (and false false)))
 (let (($x1442 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1442 $x1649) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1500 (or false false false $x598)))
 (=> $x1500 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x598 $x1649) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1500 (or false false false $x598)))
 (=> $x1500 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x410 (and true false)))
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x675 (or false false false $x598 $x410)))
 (=> $x675 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1500 (or false false false $x598)))
 (=> $x1500 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x410 (and true false)))
 (let (($x598 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x675 (or false false false $x598 $x410)))
 (=> $x675 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x644 (or false false false $x785)))
 (=> $x644 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x410 (and true false)))
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1470 (or false false false $x785 $x410)))
 (=> $x1470 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1047 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1047) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x410 (and true false)))
 (let (($x1047 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1047 $x410) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x644 (or false false false $x785)))
 (=> $x644 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1004 (or false false false $x785 $x1649)))
 (=> $x1004 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x644 (or false false false $x785)))
 (=> $x644 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1004 (or false false false $x785 $x1649)))
 (=> $x1004 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x644 (or false false false $x785)))
 (=> $x644 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1004 (or false false false $x785 $x1649)))
 (=> $x1004 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x644 (or false false false $x785)))
 (=> $x644 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x410 (and true false)))
 (let (($x785 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1470 (or false false false $x785 $x410)))
 (=> $x1470 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1148 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1148) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x410 (and true false)))
 (let (($x1148 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1148 $x410) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x25 (or false false false $x1358)))
 (=> $x25 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x410 (and true false)))
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x156 (or false false false $x1358 $x410)))
 (=> $x156 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x877 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x877) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x410 (and true false)))
 (let (($x877 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x877 $x410) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x25 (or false false false $x1358)))
 (=> $x25 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x410 (and true false)))
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x156 (or false false false $x1358 $x410)))
 (=> $x156 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x25 (or false false false $x1358)))
 (=> $x25 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x410 (and true false)))
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x156 (or false false false $x1358 $x410)))
 (=> $x156 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x25 (or false false false $x1358)))
 (=> $x25 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x410 (and true false)))
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x156 (or false false false $x1358 $x410)))
 (=> $x156 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x25 (or false false false $x1358)))
 (=> $x25 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1649 (and false false)))
 (let (($x1358 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x1358 $x1649) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1640 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1640) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1649 (and false false)))
 (let (($x1640 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1640 $x1649) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x410 (and true false)))
 (let (($x1580 (or false false false or $x410)))
 (=> $x1580 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x607 (= co_0 (_ bv1 2))))
 (=> $x607 (= (_ bv0 32) final_x))))
(assert
 (let (($x1454 (= co_3 (_ bv1 2))))
 (=> $x1454 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1013 (= co_1 (_ bv1 2))))
 (=> $x1013 (= (_ bv0 32) final_y))))
(assert
 (let (($x131 (= co_6 (_ bv1 2))))
(=> $x131 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
