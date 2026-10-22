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
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x363 (and false false)))
 (let (($x288 (or false false false or $x363)))
 (=> $x288 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x449 (or false false false $x442)))
 (=> $x449 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x514 (and true false)))
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x469 (or false false false $x442 $x514)))
 (=> $x469 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x526 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x526) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x514 (and true false)))
 (let (($x526 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x526 $x514) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x449 (or false false false $x442)))
 (=> $x449 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x363 (and false false)))
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1234 (or false false false $x442 $x363)))
 (=> $x1234 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x449 (or false false false $x442)))
 (=> $x449 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x363 (and false false)))
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1234 (or false false false $x442 $x363)))
 (=> $x1234 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x156 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x156) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x514 (and true false)))
 (let (($x156 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x156 $x514) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x449 (or false false false $x442)))
 (=> $x449 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x514 (and true false)))
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x469 (or false false false $x442 $x514)))
 (=> $x469 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x449 (or false false false $x442)))
 (=> $x449 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x514 (and true false)))
 (let (($x442 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x469 (or false false false $x442 $x514)))
 (=> $x469 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x363 (and false false)))
 (let (($x288 (or false false false or $x363)))
 (=> $x288 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_4 topo_U_6))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x514 (and true false)))
 (let (($x515 (or false false false or $x514)))
 (=> $x515 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x363 (and false false)))
 (let (($x288 (or false false false or $x363)))
 (=> $x288 (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_5))))
(assert
 (let (($x363 (and false false)))
 (let (($x288 (or false false false or $x363)))
 (=> $x288 (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x531 (or false false false or)))
 (=> $x531 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x363 (and false false)))
 (let (($x288 (or false false false or $x363)))
 (=> $x288 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x118 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x118) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x514 (and true false)))
 (let (($x118 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x118 $x514) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x217 (or false false false $x216)))
 (=> $x217 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x514 (and true false)))
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x459 (or false false false $x216 $x514)))
 (=> $x459 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x510 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x510) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x514 (and true false)))
 (let (($x510 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x510 $x514) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x217 (or false false false $x216)))
 (=> $x217 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x514 (and true false)))
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x459 (or false false false $x216 $x514)))
 (=> $x459 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x217 (or false false false $x216)))
 (=> $x217 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x363 (and false false)))
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x114 (or false false false $x216 $x363)))
 (=> $x114 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x217 (or false false false $x216)))
 (=> $x217 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x363 (and false false)))
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x114 (or false false false $x216 $x363)))
 (=> $x114 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x217 (or false false false $x216)))
 (=> $x217 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x363 (and false false)))
 (let (($x216 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x114 (or false false false $x216 $x363)))
 (=> $x114 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x37 (= co_0 (_ bv1 2))))
 (=> $x37 (= (_ bv0 32) final_x))))
(assert
 (let (($x642 (= co_2 (_ bv1 2))))
 (=> $x642 (= (_ bv1 32) final_x))))
(assert
 (let (($x821 (= co_1 (_ bv1 2))))
 (=> $x821 (= (_ bv0 32) final_y))))
(assert
 (let (($x721 (= co_4 (_ bv1 2))))
(=> $x721 (= (_ bv1 32) final_y))))
(check-sat)
