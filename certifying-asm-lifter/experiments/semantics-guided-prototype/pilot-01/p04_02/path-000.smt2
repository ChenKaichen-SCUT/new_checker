; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
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
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_1 co_6) true))
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
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x341 (bvult co_1 co_6)))
 (let (($x1578 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x1578 $x341)))))
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
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_1 topo_T_3)))))
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
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x293 (and false false)))
 (let (($x716 (or false false false or $x293)))
 (=> $x716 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x293 (and false false)))
 (let (($x716 (or false false false or $x293)))
 (=> $x716 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x293 (and false false)))
 (let (($x716 (or false false false or $x293)))
 (=> $x716 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x293 (and false false)))
 (let (($x716 (or false false false or $x293)))
 (=> $x716 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1127 (or false false false $x948)))
 (=> $x1127 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1139 (or false false false $x948 $x1380)))
 (=> $x1139 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x655 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x655) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1380 (and true false)))
 (let (($x655 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x655 $x1380) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1127 (or false false false $x948)))
 (=> $x1127 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x293 (and false false)))
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1468 (or false false false $x948 $x293)))
 (=> $x1468 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1127 (or false false false $x948)))
 (=> $x1127 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x293 (and false false)))
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1468 (or false false false $x948 $x293)))
 (=> $x1468 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1127 (or false false false $x948)))
 (=> $x1127 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x293 (and false false)))
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1468 (or false false false $x948 $x293)))
 (=> $x1468 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1127 (or false false false $x948)))
 (=> $x1127 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x948 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1139 (or false false false $x948 $x1380)))
 (=> $x1139 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1239 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1239) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1239 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1239 $x1380) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1417 (or false false false $x842)))
 (=> $x1417 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x712 (or false false false $x842 $x1380)))
 (=> $x712 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1578 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1578) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1578 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1578 $x1380) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1417 (or false false false $x842)))
 (=> $x1417 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x712 (or false false false $x842 $x1380)))
 (=> $x712 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1417 (or false false false $x842)))
 (=> $x1417 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x712 (or false false false $x842 $x1380)))
 (=> $x712 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1417 (or false false false $x842)))
 (=> $x1417 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1380 (and true false)))
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x712 (or false false false $x842 $x1380)))
 (=> $x712 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1417 (or false false false $x842)))
 (=> $x1417 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x293 (and false false)))
 (let (($x842 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x842 $x293) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x779 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x779) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x293 (and false false)))
 (let (($x779 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x779 $x293) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1683 (or false false false or)))
 (=> $x1683 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1380 (and true false)))
 (let (($x1212 (or false false false or $x1380)))
 (=> $x1212 (bvult topo_T_6 topo_T_3)))))
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
 (let (($x159 (= co_0 (_ bv1 2))))
 (=> $x159 (= (_ bv0 32) final_x))))
(assert
 (let (($x1355 (= co_2 (_ bv1 2))))
 (=> $x1355 (= (_ bv1 32) final_x))))
(assert
 (let (($x603 (= co_1 (_ bv1 2))))
 (=> $x603 (= (_ bv0 32) final_y))))
(assert
 (let (($x577 (= co_6 (_ bv1 2))))
(=> $x577 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
