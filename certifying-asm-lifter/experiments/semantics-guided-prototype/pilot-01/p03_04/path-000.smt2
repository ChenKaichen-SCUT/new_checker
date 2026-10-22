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
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x712 (and false false)))
 (let (($x1403 (or false false false or $x712)))
 (=> $x1403 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x382 (or false false false $x182)))
 (=> $x382 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x274 (and true false)))
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1197 (or false false false $x182 $x274)))
 (=> $x1197 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x725 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x725) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x725 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x725 $x274) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x382 (or false false false $x182)))
 (=> $x382 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x712 (and false false)))
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x598 (or false false false $x182 $x712)))
 (=> $x598 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x382 (or false false false $x182)))
 (=> $x382 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x712 (and false false)))
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x598 (or false false false $x182 $x712)))
 (=> $x598 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x637 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x637) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x274 (and true false)))
 (let (($x637 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x637 $x274) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x382 (or false false false $x182)))
 (=> $x382 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x274 (and true false)))
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1197 (or false false false $x182 $x274)))
 (=> $x1197 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x382 (or false false false $x182)))
 (=> $x382 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x274 (and true false)))
 (let (($x182 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1197 (or false false false $x182 $x274)))
 (=> $x1197 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x712 (and false false)))
 (let (($x1403 (or false false false or $x712)))
 (=> $x1403 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_4 topo_U_6))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x274 (and true false)))
 (let (($x388 (or false false false or $x274)))
 (=> $x388 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x712 (and false false)))
 (let (($x1403 (or false false false or $x712)))
 (=> $x1403 (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_5))))
(assert
 (let (($x712 (and false false)))
 (let (($x1403 (or false false false or $x712)))
 (=> $x1403 (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x881 (or false false false or)))
 (=> $x881 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x712 (and false false)))
 (let (($x1403 (or false false false or $x712)))
 (=> $x1403 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x372 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x372) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x372 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x372 $x274) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x136 (or false false false $x1464)))
 (=> $x136 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x274 (and true false)))
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x644 (or false false false $x1464 $x274)))
 (=> $x644 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1614 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1614) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x274 (and true false)))
 (let (($x1614 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1614 $x274) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x136 (or false false false $x1464)))
 (=> $x136 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x274 (and true false)))
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x644 (or false false false $x1464 $x274)))
 (=> $x644 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x136 (or false false false $x1464)))
 (=> $x136 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x712 (and false false)))
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1312 (or false false false $x1464 $x712)))
 (=> $x1312 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x136 (or false false false $x1464)))
 (=> $x136 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x712 (and false false)))
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1312 (or false false false $x1464 $x712)))
 (=> $x1312 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x136 (or false false false $x1464)))
 (=> $x136 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x712 (and false false)))
 (let (($x1464 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1312 (or false false false $x1464 $x712)))
 (=> $x1312 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1273 (= co_0 (_ bv1 2))))
 (=> $x1273 (= (_ bv0 32) final_x))))
(assert
 (let (($x1213 (= co_2 (_ bv1 2))))
 (=> $x1213 (= (_ bv1 32) final_x))))
(assert
 (let (($x475 (= co_1 (_ bv1 2))))
 (=> $x475 (= (_ bv0 32) final_y))))
(assert
 (let (($x1188 (= co_4 (_ bv1 2))))
(=> $x1188 (= (_ bv1 32) final_y))))
(check-sat)
