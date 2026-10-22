; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_5_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
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
 (let (($x372 (= (_ bv0 32) read_t0_a)))
 (= $x372 true)))
(assert
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_4 co_5) true))
(assert
 (let (($x372 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x372)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 (=> rf_5_3 (= (_ bv1 32) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_5_3))
(assert
 (let (($x2513 (= (_ bv0 32) read_t1_b)))
 (=> rf_0_6 $x2513)))
(assert
 ((_ pbeq 1 1) rf_0_6))
(assert
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (not (and $x1883 false))))
(assert
 (let (($x1748 (bvult co_1 co_4)))
 (let (($x1281 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (not (and $x1281 $x1748)))))
(assert
 (let (($x2601 (bvult co_5 co_4)))
 (let (($x696 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (not (and $x696 $x2601)))))
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
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x1995 (and true false)))
 (let (($x488 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x488 $x1995) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x166 (or false false false $x294 $x1995)))
 (=> $x166 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x294 (or (and rf_0_2 false))))
 (=> (or false false false $x294 $x2408) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x842 (or true false false $x294 $x2408)))
 (=> $x842 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x842 (or true false false $x294 $x2408)))
 (=> $x842 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x166 (or false false false $x294 $x1995)))
 (=> $x166 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x784 (or false false false $x294)))
 (=> $x784 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x294 (or (and rf_0_2 false))))
 (let (($x166 (or false false false $x294 $x1995)))
 (=> $x166 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x873 (or false false false $x1883)))
 (=> $x873 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1531 (or false false false $x1883 $x1995)))
 (=> $x1531 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1281 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x1281) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1281 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x1281 $x1995) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x873 (or false false false $x1883)))
 (=> $x873 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x145 (or false false false $x1883 $x2408)))
 (=> $x145 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x873 (or false false false $x1883)))
 (=> $x873 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x145 (or false false false $x1883 $x2408)))
 (=> $x145 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x2306 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x2306) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2408 (and false false)))
 (let (($x2306 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x2306 $x2408) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x696 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x696) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1995 (and true false)))
 (let (($x696 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x696 $x1995) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x873 (or false false false $x1883)))
 (=> $x873 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1883 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1531 (or false false false $x1883 $x1995)))
 (=> $x1531 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x2408 (and false false)))
 (let (($x2795 (or false false false or $x2408)))
 (=> $x2795 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false (bvult co_4 co_5) or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1995 (and true false)))
 (let (($x1756 (or false false false or $x1995)))
 (=> $x1756 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false (bvult co_5 co_4) or (and true false)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1475 (or false false false or)))
 (=> $x1475 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x2408 (and false false)))
 (let (($x2795 (or false false false or $x2408)))
 (=> $x2795 (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_6 (bvult co_0 co_0)))) (bvult topo_U_6 topo_U_0)))
(assert
 (let (($x1995 (and true false)))
 (let (($x1490 (or (and rf_0_6 (bvult co_0 co_0)))))
 (=> (or false false false $x1490 $x1995) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x128 (or false false false $x641 $x1995)))
 (=> $x128 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x128 (or false false false $x641 $x1995)))
 (=> $x128 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x128 (or false false false $x641 $x1995)))
 (=> $x128 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1995 (and true false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x128 (or false false false $x641 $x1995)))
 (=> $x128 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x1896 (or false false false $x641 $x2408)))
 (=> $x1896 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x114 (or false false false $x641)))
 (=> $x114 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x2408 (and false false)))
 (let (($x641 (or (and rf_0_6 false))))
 (let (($x1896 (or false false false $x641 $x2408)))
 (=> $x1896 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x213 (= (_ bv0 32) final_x)))
 (let (($x982 (= co_0 (_ bv0 1))))
 (=> $x982 $x213))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x143 (= co_4 (_ bv2 2))))
 (=> $x143 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x2490 (= co_5 (_ bv2 2))))
 (=> $x2490 (= (_ bv1 32) final_y))))
(assert
 (let (($x608 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1823 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x2246 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1074 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1042 (and (distinct rf_0_6 true) true)))
 (let (($x779 (and (distinct rf_5_3 true) true)))
 (let (($x891 (and (distinct rf_4_3 false) true)))
 (let (($x2157 (and (distinct rf_1_3 false) true)))
 (let (($x1742 (and (distinct rf_0_2 true) true)))
 (let (($x984 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1651 (and (distinct (_ bv1 32) read_t0_yes) true)))
 (let (($x695 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x2116 (and (distinct input_b false) true)))
 (or $x2116 $x695 $x1651 $x984 $x1742 $x2157 $x891 $x779 $x1042 $x1074 $x2246 $x1823 $x608)))))))))))))))
(assert
 (let (($x1687 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x2210 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x2246 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1074 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1042 (and (distinct rf_0_6 true) true)))
 (let (($x2508 (and (distinct rf_5_3 false) true)))
 (let (($x891 (and (distinct rf_4_3 false) true)))
 (let (($x724 (and (distinct rf_1_3 true) true)))
 (let (($x1742 (and (distinct rf_0_2 true) true)))
 (let (($x984 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1498 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x695 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x2116 (and (distinct input_b false) true)))
 (or $x2116 $x695 $x1498 $x984 $x1742 $x724 $x891 $x2508 $x1042 $x1074 $x2246 $x2210 $x1687)))))))))))))))
(assert
 (let (($x1687 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x2210 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x2246 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1074 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1042 (and (distinct rf_0_6 true) true)))
 (let (($x2508 (and (distinct rf_5_3 false) true)))
 (let (($x891 (and (distinct rf_4_3 false) true)))
 (let (($x724 (and (distinct rf_1_3 true) true)))
 (let (($x1742 (and (distinct rf_0_2 true) true)))
 (let (($x984 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1498 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x695 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x2267 (and (distinct input_b true) true)))
 (or $x2267 $x695 $x1498 $x984 $x1742 $x724 $x891 $x2508 $x1042 $x1074 $x2246 $x2210 $x1687)))))))))))))))
(assert
 (let (($x608 (and (distinct (_ bv1 2) co_5) true)))
(let (($x1823 (and (distinct (_ bv2 2) co_4) true)))
(let (($x2246 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1074 (and (distinct (_ bv0 1) co_0) true)))
(let (($x1042 (and (distinct rf_0_6 true) true)))
(let (($x779 (and (distinct rf_5_3 true) true)))
(let (($x891 (and (distinct rf_4_3 false) true)))
(let (($x2157 (and (distinct rf_1_3 false) true)))
(let (($x1742 (and (distinct rf_0_2 true) true)))
(let (($x984 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1651 (and (distinct (_ bv1 32) read_t0_yes) true)))
(let (($x695 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x2267 (and (distinct input_b true) true)))
(or $x2267 $x695 $x1651 $x984 $x1742 $x2157 $x891 $x779 $x1042 $x1074 $x2246 $x1823 $x608)))))))))))))))
(check-sat)
