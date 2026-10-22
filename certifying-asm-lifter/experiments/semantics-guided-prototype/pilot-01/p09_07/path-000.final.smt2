; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_8_2 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x605 (= (_ bv0 32) read_t0_a)))
 (= $x605 true)))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_8 (_ bv2 2)))
(assert
 (and (distinct co_0 co_8) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_4 co_6) true))
(assert
 (let (($x605 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x605)))
(assert
 (=> rf_8_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_8_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 (=> rf_6_3 (= (bvadd read_t1_a (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_6_3))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_4_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_8_7 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_8_7))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (not (and $x527 false))))
(assert
 (let (($x1966 (bvult co_1 co_6)))
 (let (($x655 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x655 $x1966)))))
(assert
 (let (($x2352 (bvult co_4 co_6)))
 (let (($x1435 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (not (and $x1435 $x2352)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (not (and $x343 false))))
(assert
 (let (($x1297 (bvult co_1 co_4)))
 (let (($x2913 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (not (and $x2913 $x1297)))))
(assert
 (let (($x99 (bvult co_6 co_4)))
 (let (($x2022 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (not (and $x2022 $x99)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (not (and $x343 false))))
(assert
 (let (($x690 (bvult co_0 co_8)))
 (let (($x2665 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (not (and $x2665 $x690)))))
(assert
 (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert
 (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert
 (bvult topo_U_0 (_ bv9 4)))
(assert
 (bvult topo_U_1 (_ bv9 4)))
(assert
 (bvult topo_U_2 (_ bv9 4)))
(assert
 (bvult topo_U_3 (_ bv9 4)))
(assert
 (bvult topo_U_4 (_ bv9 4)))
(assert
 (bvult topo_U_5 (_ bv9 4)))
(assert
 (bvult topo_U_6 (_ bv9 4)))
(assert
 (bvult topo_U_7 (_ bv9 4)))
(assert
 (bvult topo_U_8 (_ bv9 4)))
(assert
 (bvult topo_T_0 (_ bv9 4)))
(assert
 (bvult topo_T_1 (_ bv9 4)))
(assert
 (bvult topo_T_2 (_ bv9 4)))
(assert
 (bvult topo_T_3 (_ bv9 4)))
(assert
 (bvult topo_T_4 (_ bv9 4)))
(assert
 (bvult topo_T_5 (_ bv9 4)))
(assert
 (bvult topo_T_6 (_ bv9 4)))
(assert
 (bvult topo_T_7 (_ bv9 4)))
(assert
 (bvult topo_T_8 (_ bv9 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false (bvult co_0 co_8) or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x2301 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x2301) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2301 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x2301 $x2487) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x396 (or false false false $x268 $x2487)))
 (=> $x396 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (=> (or false false false $x268 $x2514) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x678 (or true false false $x268 $x2514)))
 (=> $x678 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x678 (or true false false $x268 $x2514)))
 (=> $x678 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x396 (or false false false $x268 $x2487)))
 (=> $x396 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x396 (or false false false $x268 $x2487)))
 (=> $x396 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x493 (or false false false $x268)))
 (=> $x493 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x268 (or (and rf_0_2 false) (and rf_8_2 false))))
 (let (($x396 (or false false false $x268 $x2487)))
 (=> $x396 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x40 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x40) (bvult topo_U_2 topo_U_8))))
(assert
 (let (($x2487 (and true false)))
 (let (($x40 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x40 $x2487) (bvult topo_T_2 topo_T_8)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x786 (or false false false $x343 $x2487)))
 (=> $x786 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x2913 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x2913) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2913 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x2913 $x2487) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2215 (or false false false $x343 $x2514)))
 (=> $x2215 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2215 (or false false false $x343 $x2514)))
 (=> $x2215 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x226 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x226) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2514 (and false false)))
 (let (($x226 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x226 $x2514) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x786 (or false false false $x343 $x2487)))
 (=> $x786 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x2022 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x2022) (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2022 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x2022 $x2487) (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x786 (or false false false $x343 $x2487)))
 (=> $x786 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2653 (or false false false $x343)))
 (=> $x2653 (bvult topo_U_3 topo_U_8)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x343 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x786 (or false false false $x343 $x2487)))
 (=> $x786 (bvult topo_T_3 topo_T_8))))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x2514 (and false false)))
 (let (($x884 (or false false false or $x2514)))
 (=> $x884 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert
 (=> (or false false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert
 (=> (or false false (bvult co_4 co_6) or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_4 topo_U_8))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_4 topo_T_8)))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1062 (or false false false $x527 $x2487)))
 (=> $x1062 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x655 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x655) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x2487 (and true false)))
 (let (($x655 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x655 $x2487) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1062 (or false false false $x527 $x2487)))
 (=> $x1062 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1062 (or false false false $x527 $x2487)))
 (=> $x1062 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1435 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x1435) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1435 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x1435 $x2487) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (=> (or false false false $x527 $x2514) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1214 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1214) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x2514 (and false false)))
 (let (($x1214 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1214 $x2514) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1603 (or true false false $x527 $x2514)))
 (=> $x1603 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1688 (or false false false $x527)))
 (=> $x1688 (bvult topo_U_5 topo_U_8)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x527 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1603 (or true false false $x527 $x2514)))
 (=> $x1603 (bvult topo_T_5 topo_T_8))))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_6 topo_T_2)))))
(assert
 (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert
 (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false (bvult co_6 co_4) or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x2514 (and false false)))
 (let (($x1165 (or true false false or $x2514)))
 (=> $x1165 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_6 topo_U_8))))
(assert
 (let (($x2514 (and false false)))
 (let (($x1165 (or true false false or $x2514)))
 (=> $x1165 (bvult topo_T_6 topo_T_8)))))
(assert
 (let (($x2665 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x2665) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2665 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x2665 $x2487) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x509 (or false false false $x2511 $x2487)))
 (=> $x509 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x509 (or false false false $x2511 $x2487)))
 (=> $x509 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x509 (or false false false $x2511 $x2487)))
 (=> $x509 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x2487 (and true false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x509 (or false false false $x2511 $x2487)))
 (=> $x509 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x502 (or false false false $x2511 $x2514)))
 (=> $x502 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x502 (or false false false $x2511 $x2514)))
 (=> $x502 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x852 (or false false false $x2511)))
 (=> $x852 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x2514 (and false false)))
 (let (($x2511 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x502 (or false false false $x2511 $x2514)))
 (=> $x502 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x712 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x712) (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x2514 (and false false)))
 (let (($x712 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x712 $x2514) (bvult topo_T_7 topo_T_8)))))
(assert
 (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert
 (=> (or false false (bvult co_8 co_0) or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_8 topo_T_1)))))
(assert
 (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_8 topo_T_3)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_8 topo_U_4))))
(assert
 (let (($x2487 (and true false)))
 (let (($x1633 (or false false false or $x2487)))
 (=> $x1633 (bvult topo_T_8 topo_T_4)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x2514 (and false false)))
 (let (($x884 (or false false false or $x2514)))
 (=> $x884 (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x813 (or false false false or)))
 (=> $x813 (bvult topo_U_8 topo_U_6))))
(assert
 (let (($x2514 (and false false)))
 (let (($x884 (or false false false or $x2514)))
 (=> $x884 (bvult topo_T_8 topo_T_6)))))
(assert
 (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert
 (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert
 (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert
 (=> (or false false (bvult co_8 co_8) or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1589 (= co_8 (_ bv1 2))))
 (=> $x1589 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x2911 (= co_4 (_ bv2 2))))
 (=> $x2911 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x851 (= co_6 (_ bv2 2))))
 (=> $x851 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x283 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2504 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x1209 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1861 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x647 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x2524 (and (distinct rf_8_7 false) true)))
 (let (($x335 (and (distinct rf_0_7 true) true)))
 (let (($x823 (and (distinct rf_6_5 false) true)))
 (let (($x593 (and (distinct rf_4_5 false) true)))
 (let (($x455 (and (distinct rf_1_5 true) true)))
 (let (($x1091 (and (distinct rf_6_3 true) true)))
 (let (($x780 (and (distinct rf_4_3 false) true)))
 (let (($x1639 (and (distinct rf_1_3 false) true)))
 (let (($x96 (and (distinct rf_8_2 false) true)))
 (let (($x1671 (and (distinct rf_0_2 true) true)))
 (let (($x1449 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x608 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1278 (and (distinct (_ bv1 32) read_t0_yes) true)))
 (let (($x453 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1042 (and (distinct input_b false) true)))
 (or $x1042 $x453 $x1278 $x608 $x1449 $x1671 $x96 $x1639 $x780 $x1091 $x455 $x593 $x823 $x335 $x2524 $x647 $x1861 $x1209 $x2504 $x283))))))))))))))))))))))
(assert
 (let (($x702 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x936 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1209 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1861 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x647 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x2524 (and (distinct rf_8_7 false) true)))
 (let (($x335 (and (distinct rf_0_7 true) true)))
 (let (($x823 (and (distinct rf_6_5 false) true)))
 (let (($x2039 (and (distinct rf_4_5 true) true)))
 (let (($x2041 (and (distinct rf_1_5 false) true)))
 (let (($x1736 (and (distinct rf_6_3 false) true)))
 (let (($x780 (and (distinct rf_4_3 false) true)))
 (let (($x2933 (and (distinct rf_1_3 true) true)))
 (let (($x96 (and (distinct rf_8_2 false) true)))
 (let (($x1671 (and (distinct rf_0_2 true) true)))
 (let (($x1449 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x315 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1733 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x453 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1042 (and (distinct input_b false) true)))
 (or $x1042 $x453 $x1733 $x315 $x1449 $x1671 $x96 $x2933 $x780 $x1736 $x2041 $x2039 $x823 $x335 $x2524 $x647 $x1861 $x1209 $x936 $x702))))))))))))))))))))))
(assert
 (let (($x702 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x936 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1209 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1861 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x647 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x2524 (and (distinct rf_8_7 false) true)))
 (let (($x335 (and (distinct rf_0_7 true) true)))
 (let (($x823 (and (distinct rf_6_5 false) true)))
 (let (($x2039 (and (distinct rf_4_5 true) true)))
 (let (($x2041 (and (distinct rf_1_5 false) true)))
 (let (($x1736 (and (distinct rf_6_3 false) true)))
 (let (($x780 (and (distinct rf_4_3 false) true)))
 (let (($x2933 (and (distinct rf_1_3 true) true)))
 (let (($x96 (and (distinct rf_8_2 false) true)))
 (let (($x1671 (and (distinct rf_0_2 true) true)))
 (let (($x1449 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x315 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1733 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x453 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1486 (and (distinct input_b true) true)))
 (or $x1486 $x453 $x1733 $x315 $x1449 $x1671 $x96 $x2933 $x780 $x1736 $x2041 $x2039 $x823 $x335 $x2524 $x647 $x1861 $x1209 $x936 $x702))))))))))))))))))))))
(assert
 (let (($x283 (and (distinct (_ bv1 2) co_6) true)))
(let (($x2504 (and (distinct (_ bv2 2) co_4) true)))
(let (($x1209 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1861 (and (distinct (_ bv1 2) co_8) true)))
(let (($x647 (and (distinct (_ bv0 2) co_0) true)))
(let (($x2524 (and (distinct rf_8_7 false) true)))
(let (($x335 (and (distinct rf_0_7 true) true)))
(let (($x823 (and (distinct rf_6_5 false) true)))
(let (($x593 (and (distinct rf_4_5 false) true)))
(let (($x455 (and (distinct rf_1_5 true) true)))
(let (($x1091 (and (distinct rf_6_3 true) true)))
(let (($x780 (and (distinct rf_4_3 false) true)))
(let (($x1639 (and (distinct rf_1_3 false) true)))
(let (($x96 (and (distinct rf_8_2 false) true)))
(let (($x1671 (and (distinct rf_0_2 true) true)))
(let (($x1449 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x608 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1278 (and (distinct (_ bv1 32) read_t0_yes) true)))
(let (($x453 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x1486 (and (distinct input_b true) true)))
(or $x1486 $x453 $x1278 $x608 $x1449 $x1671 $x96 $x1639 $x780 $x1091 $x455 $x593 $x823 $x335 $x2524 $x647 $x1861 $x1209 $x2504 $x283))))))))))))))))))))))
(check-sat)
