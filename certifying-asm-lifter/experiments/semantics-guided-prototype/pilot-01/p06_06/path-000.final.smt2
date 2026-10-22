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
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
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
 (let (($x559 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x559)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_3_7))
(assert
 (let (($x1577 (bvult co_0 co_3)))
 (let (($x1558 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1558 $x1577)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x476 (bvult co_1 co_6)))
 (let (($x799 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x799 $x476)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (bvult topo_U_0 (_ bv8 4)))
(assert
 (bvult topo_U_1 (_ bv8 4)))
(assert
 (bvult topo_U_2 (_ bv8 4)))
(assert
 (bvult topo_U_3 (_ bv8 4)))
(assert
 (bvult topo_U_4 (_ bv8 4)))
(assert
 (bvult topo_U_5 (_ bv8 4)))
(assert
 (bvult topo_U_6 (_ bv8 4)))
(assert
 (bvult topo_U_7 (_ bv8 4)))
(assert
 (bvult topo_T_0 (_ bv8 4)))
(assert
 (bvult topo_T_1 (_ bv8 4)))
(assert
 (bvult topo_T_2 (_ bv8 4)))
(assert
 (bvult topo_T_3 (_ bv8 4)))
(assert
 (bvult topo_T_4 (_ bv8 4)))
(assert
 (bvult topo_T_5 (_ bv8 4)))
(assert
 (bvult topo_T_6 (_ bv8 4)))
(assert
 (bvult topo_T_7 (_ bv8 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_1 topo_T_3)))))
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
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1558 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1558) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x396 (and true false)))
 (let (($x1558 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1558 $x396) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x396 (and true false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1646 (or false false false $x1400 $x396)))
 (=> $x1646 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1400 $x1396) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x40 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x40) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1396 (and false false)))
 (let (($x40 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x40 $x1396) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x1400 $x1396) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x396 (and true false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1646 (or false false false $x1400 $x396)))
 (=> $x1646 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x396 (and true false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1646 (or false false false $x1400 $x396)))
 (=> $x1646 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x411 (or false false false $x1400)))
 (=> $x411 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x396 (and true false)))
 (let (($x1400 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1646 (or false false false $x1400 $x396)))
 (=> $x1646 (bvult topo_T_2 topo_T_7))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1396 (and false false)))
 (let (($x1747 (or true false false or $x1396)))
 (=> $x1747 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x396 (and true false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1592 (or false false false $x529 $x396)))
 (=> $x1592 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1022 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1022) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x396 (and true false)))
 (let (($x1022 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1022 $x396) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1619 (or false false false $x529 $x1396)))
 (=> $x1619 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1619 (or false false false $x529 $x1396)))
 (=> $x1619 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1619 (or false false false $x529 $x1396)))
 (=> $x1619 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x396 (and true false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1592 (or false false false $x529 $x396)))
 (=> $x1592 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1314 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1314) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x396 (and true false)))
 (let (($x1314 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1314 $x396) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1436 (or false false false $x529)))
 (=> $x1436 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x396 (and true false)))
 (let (($x529 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1592 (or false false false $x529 $x396)))
 (=> $x1592 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x396 (and true false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x603 (or false false false $x421 $x396)))
 (=> $x603 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x799 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x799) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x396 (and true false)))
 (let (($x799 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x799 $x396) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x396 (and true false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x603 (or false false false $x421 $x396)))
 (=> $x603 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x396 (and true false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x603 (or false false false $x421 $x396)))
 (=> $x603 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x396 (and true false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x603 (or false false false $x421 $x396)))
 (=> $x603 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x421 $x1396) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x51 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x51) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1396 (and false false)))
 (let (($x51 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x51 $x1396) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x134 (or false false false $x421)))
 (=> $x134 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x421 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or true false false $x421 $x1396) (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x396 (and true false)))
 (let (($x1380 (or false false false or $x396)))
 (=> $x1380 (bvult topo_T_6 topo_T_3)))))
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
 (let (($x1084 (or false false false or)))
 (=> $x1084 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1396 (and false false)))
 (let (($x1747 (or true false false or $x1396)))
 (=> $x1747 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x958 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x958) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x396 (and true false)))
 (let (($x958 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x958 $x396) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x396 (and true false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x273 (or false false false $x648 $x396)))
 (=> $x273 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x396 (and true false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x273 (or false false false $x648 $x396)))
 (=> $x273 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x437 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x437) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x396 (and true false)))
 (let (($x437 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x437 $x396) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x396 (and true false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x273 (or false false false $x648 $x396)))
 (=> $x273 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x788 (or false false false $x648 $x1396)))
 (=> $x788 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x788 (or false false false $x648 $x1396)))
 (=> $x788 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1407 (or false false false $x648)))
 (=> $x1407 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x1396 (and false false)))
 (let (($x648 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x788 (or false false false $x648 $x1396)))
 (=> $x788 (bvult topo_T_7 topo_T_7))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x472 (= co_3 (_ bv1 2))))
 (=> $x472 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1631 (= co_6 (_ bv1 2))))
 (=> $x1631 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x484 (and (distinct rf_3_7 false) true)))
 (let (($x586 (and (distinct rf_0_7 true) true)))
 (let (($x1643 (and (distinct rf_6_5 false) true)))
 (let (($x316 (and (distinct rf_1_5 true) true)))
 (let (($x510 (and (distinct rf_6_4 true) true)))
 (let (($x1674 (and (distinct rf_1_4 false) true)))
 (let (($x1630 (and (distinct rf_3_2 false) true)))
 (let (($x1490 (and (distinct rf_0_2 true) true)))
 (let (($x1517 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x383 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x717 (and (distinct input_b false) true)))
 (or $x717 $x674 $x383 $x935 $x1517 $x1490 $x1630 $x1674 $x510 $x316 $x1643 $x586 $x484 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x53 (and (distinct rf_3_7 true) true)))
 (let (($x728 (and (distinct rf_0_7 false) true)))
 (let (($x1643 (and (distinct rf_6_5 false) true)))
 (let (($x316 (and (distinct rf_1_5 true) true)))
 (let (($x857 (and (distinct rf_6_4 false) true)))
 (let (($x119 (and (distinct rf_1_4 true) true)))
 (let (($x1630 (and (distinct rf_3_2 false) true)))
 (let (($x1490 (and (distinct rf_0_2 true) true)))
 (let (($x742 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x946 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x717 (and (distinct input_b false) true)))
 (or $x717 $x674 $x946 $x935 $x742 $x1490 $x1630 $x119 $x857 $x316 $x1643 $x728 $x53 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x53 (and (distinct rf_3_7 true) true)))
 (let (($x728 (and (distinct rf_0_7 false) true)))
 (let (($x1643 (and (distinct rf_6_5 false) true)))
 (let (($x316 (and (distinct rf_1_5 true) true)))
 (let (($x857 (and (distinct rf_6_4 false) true)))
 (let (($x119 (and (distinct rf_1_4 true) true)))
 (let (($x1630 (and (distinct rf_3_2 false) true)))
 (let (($x1490 (and (distinct rf_0_2 true) true)))
 (let (($x742 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x946 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x913 (and (distinct input_b true) true)))
 (or $x913 $x674 $x946 $x935 $x742 $x1490 $x1630 $x119 $x857 $x316 $x1643 $x728 $x53 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x484 (and (distinct rf_3_7 false) true)))
 (let (($x586 (and (distinct rf_0_7 true) true)))
 (let (($x1643 (and (distinct rf_6_5 false) true)))
 (let (($x316 (and (distinct rf_1_5 true) true)))
 (let (($x510 (and (distinct rf_6_4 true) true)))
 (let (($x1674 (and (distinct rf_1_4 false) true)))
 (let (($x1630 (and (distinct rf_3_2 false) true)))
 (let (($x1490 (and (distinct rf_0_2 true) true)))
 (let (($x1517 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x383 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x913 (and (distinct input_b true) true)))
 (or $x913 $x674 $x383 $x935 $x1517 $x1490 $x1630 $x1674 $x510 $x316 $x1643 $x586 $x484 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x53 (and (distinct rf_3_7 true) true)))
 (let (($x728 (and (distinct rf_0_7 false) true)))
 (let (($x1643 (and (distinct rf_6_5 false) true)))
 (let (($x316 (and (distinct rf_1_5 true) true)))
 (let (($x510 (and (distinct rf_6_4 true) true)))
 (let (($x1674 (and (distinct rf_1_4 false) true)))
 (let (($x1630 (and (distinct rf_3_2 false) true)))
 (let (($x1490 (and (distinct rf_0_2 true) true)))
 (let (($x742 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x383 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x717 (and (distinct input_b false) true)))
 (or $x717 $x674 $x383 $x935 $x742 $x1490 $x1630 $x1674 $x510 $x316 $x1643 $x728 $x53 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(assert
 (let (($x21 (and (distinct (_ bv1 2) co_6) true)))
(let (($x1094 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1571 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1476 (and (distinct (_ bv0 2) co_0) true)))
(let (($x53 (and (distinct rf_3_7 true) true)))
(let (($x728 (and (distinct rf_0_7 false) true)))
(let (($x1643 (and (distinct rf_6_5 false) true)))
(let (($x316 (and (distinct rf_1_5 true) true)))
(let (($x510 (and (distinct rf_6_4 true) true)))
(let (($x1674 (and (distinct rf_1_4 false) true)))
(let (($x1630 (and (distinct rf_3_2 false) true)))
(let (($x1490 (and (distinct rf_0_2 true) true)))
(let (($x742 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x935 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x383 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x674 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x913 (and (distinct input_b true) true)))
(or $x913 $x674 $x383 $x935 $x742 $x1490 $x1630 $x1674 $x510 $x316 $x1643 $x728 $x53 $x1476 $x1571 $x1094 $x21)))))))))))))))))))
(check-sat)
