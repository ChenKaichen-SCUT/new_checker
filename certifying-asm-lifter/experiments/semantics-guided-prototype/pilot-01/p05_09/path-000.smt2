; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_0_5 () Bool)
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
 (let (($x1170 (= (_ bv0 32) read_t1_a)))
 (= $x1170 true)))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_0 co_6) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_6_2))
(assert
 (let (($x1170 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x1170)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_3_4))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert
 (let (($x180 (bvult co_0 co_6)))
 (let (($x1604 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x1604 $x180)))))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
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
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x409 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x409) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x473 (and true false)))
 (let (($x409 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x409 $x473) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x439 (or false false false $x1006)))
 (=> $x439 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x473 (and true false)))
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x1623 (or false false false $x1006 $x473)))
 (=> $x1623 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x439 (or false false false $x1006)))
 (=> $x439 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x634 (and false false)))
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (=> (or false false false $x1006 $x634) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x439 (or false false false $x1006)))
 (=> $x439 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x634 (and false false)))
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (=> (or true false false $x1006 $x634) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x439 (or false false false $x1006)))
 (=> $x439 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x473 (and true false)))
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x1623 (or false false false $x1006 $x473)))
 (=> $x1623 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x439 (or false false false $x1006)))
 (=> $x439 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x473 (and true false)))
 (let (($x1006 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x1623 (or false false false $x1006 $x473)))
 (=> $x1623 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1369 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1369) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x473 (and true false)))
 (let (($x1369 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1369 $x473) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x634 (and false false)))
 (let (($x576 (or false false false or $x634)))
 (=> $x576 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1505 (or false false false $x493)))
 (=> $x1505 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x473 (and true false)))
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x411 (or false false false $x493 $x473)))
 (=> $x411 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x746 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x746) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x473 (and true false)))
 (let (($x746 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x746 $x473) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1505 (or false false false $x493)))
 (=> $x1505 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x473 (and true false)))
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x411 (or false false false $x493 $x473)))
 (=> $x411 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1033 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1033) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x473 (and true false)))
 (let (($x1033 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1033 $x473) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1505 (or false false false $x493)))
 (=> $x1505 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x634 (and false false)))
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (=> (or false false false $x493 $x634) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1505 (or false false false $x493)))
 (=> $x1505 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x634 (and false false)))
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1135 (or true false false $x493 $x634)))
 (=> $x1135 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1505 (or false false false $x493)))
 (=> $x1505 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x634 (and false false)))
 (let (($x493 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1135 (or true false false $x493 $x634)))
 (=> $x1135 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1604 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x1604) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x473 (and true false)))
 (let (($x1604 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x1604 $x473) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1572 (or false false false $x326)))
 (=> $x1572 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x473 (and true false)))
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1436 (or false false false $x326 $x473)))
 (=> $x1436 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1572 (or false false false $x326)))
 (=> $x1572 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x473 (and true false)))
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1436 (or false false false $x326 $x473)))
 (=> $x1436 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1572 (or false false false $x326)))
 (=> $x1572 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x473 (and true false)))
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1436 (or false false false $x326 $x473)))
 (=> $x1436 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1572 (or false false false $x326)))
 (=> $x1572 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x634 (and false false)))
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1248 (or false false false $x326 $x634)))
 (=> $x1248 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1572 (or false false false $x326)))
 (=> $x1572 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x634 (and false false)))
 (let (($x326 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1248 (or false false false $x326 $x634)))
 (=> $x1248 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x456 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x456) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x634 (and false false)))
 (let (($x456 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x456 $x634) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x473 (and true false)))
 (let (($x1729 (or false false false or $x473)))
 (=> $x1729 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x463 (or false false false or)))
 (=> $x463 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x634 (and false false)))
 (let (($x576 (or false false false or $x634)))
 (=> $x576 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x653 (= co_0 (_ bv1 2))))
 (=> $x653 (= (_ bv0 32) final_x))))
(assert
 (let (($x1731 (= co_6 (_ bv1 2))))
 (=> $x1731 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x1645 (= co_1 (_ bv1 2))))
 (=> $x1645 (= (_ bv0 32) final_y))))
(assert
 (let (($x737 (= co_3 (_ bv1 2))))
(=> $x737 (= (_ bv1 32) final_y))))
(check-sat)
