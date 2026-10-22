; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x1198 (= (_ bv0 32) read_t1_a)))
 (= $x1198 true)))
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
 (let (($x1498 (= (_ bv0 32) read_t0_b)))
 (=> rf_1_3 $x1498)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (let (($x1198 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x1198)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_6_5))
(assert
 (let (($x1579 (bvult co_0 co_6)))
 (let (($x1065 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x1065 $x1579)))))
(assert
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (not (and $x673 false))))
(assert
 (let (($x331 (bvult co_2 co_6)))
 (let (($x1336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (not (and $x1336 $x331)))))
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
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x419 (and false false)))
 (let (($x803 (or false false false or $x419)))
 (=> $x803 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false (bvult co_2 co_6) or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x99 (or false false false $x1402 $x1327)))
 (=> $x99 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x1327 (and true false)))
 (let (($x173 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x173 $x1327) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x419 (and false false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1683 (or false false false $x1402 $x419)))
 (=> $x1683 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x419 (and false false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1683 (or false false false $x1402 $x419)))
 (=> $x1683 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x99 (or false false false $x1402 $x1327)))
 (=> $x99 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x99 (or false false false $x1402 $x1327)))
 (=> $x99 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x1253 (or false false false $x1402)))
 (=> $x1253 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1402 (or (and rf_1_3 false))))
 (let (($x99 (or false false false $x1402 $x1327)))
 (=> $x99 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x1345 (or false false false $x1386 $x1327)))
 (=> $x1345 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x1327 (and true false)))
 (let (($x225 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x225 $x1327) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x1345 (or false false false $x1386 $x1327)))
 (=> $x1345 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x1345 (or false false false $x1386 $x1327)))
 (=> $x1345 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x419 (and false false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (=> (or false false false $x1386 $x419) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x419 (and false false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x1354 (or true false false $x1386 $x419)))
 (=> $x1354 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x830 (or false false false $x1386)))
 (=> $x830 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x419 (and false false)))
 (let (($x1386 (or (and rf_1_4 false))))
 (let (($x1354 (or true false false $x1386 $x419)))
 (=> $x1354 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1065 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x1065) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1065 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x1065 $x1327) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x948 (or false false false $x673)))
 (=> $x948 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1105 (or false false false $x673 $x1327)))
 (=> $x1105 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x1336) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1327 (and true false)))
 (let (($x1336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x1336 $x1327) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x948 (or false false false $x673)))
 (=> $x948 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1327 (and true false)))
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1105 (or false false false $x673 $x1327)))
 (=> $x1105 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x948 (or false false false $x673)))
 (=> $x948 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x419 (and false false)))
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1127 (or false false false $x673 $x419)))
 (=> $x1127 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x948 (or false false false $x673)))
 (=> $x948 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x419 (and false false)))
 (let (($x673 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1127 (or false false false $x673 $x419)))
 (=> $x1127 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x395 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x395) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x419 (and false false)))
 (let (($x395 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x395 $x419) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false (bvult co_6 co_2) or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1327 (and true false)))
 (let (($x966 (or false false false or $x1327)))
 (=> $x966 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x439 (or false false false or)))
 (=> $x439 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x419 (and false false)))
 (let (($x803 (or false false false or $x419)))
 (=> $x803 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x190 (= co_2 (_ bv2 2))))
 (=> $x190 (= (_ bv1 32) final_x))))
(assert
 (let (($x1421 (= co_6 (_ bv2 2))))
 (=> $x1421 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x113 (= co_1 (_ bv0 1))))
 (=> $x113 (= (_ bv0 32) final_y))))
(assert
 (let (($x209 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x907 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1064 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1244 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1707 (and (distinct rf_6_5 false) true)))
 (let (($x1098 (and (distinct rf_2_5 true) true)))
 (let (($x1472 (and (distinct rf_0_5 false) true)))
 (let (($x827 (and (distinct rf_1_4 true) true)))
 (let (($x1597 (and (distinct rf_1_3 true) true)))
 (let (($x1632 (and (distinct (_ bv1 32) read_t1_yes) true)))
 (let (($x1919 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x375 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x97 (and (distinct input_b false) true)))
 (or $x97 $x375 $x1919 $x1632 $x1597 $x827 $x1472 $x1098 $x1707 $x1244 $x1064 $x907 $x209)))))))))))))))
(assert
 (let (($x209 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x907 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1064 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1244 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1707 (and (distinct rf_6_5 false) true)))
 (let (($x1098 (and (distinct rf_2_5 true) true)))
 (let (($x1472 (and (distinct rf_0_5 false) true)))
 (let (($x827 (and (distinct rf_1_4 true) true)))
 (let (($x1597 (and (distinct rf_1_3 true) true)))
 (let (($x1632 (and (distinct (_ bv1 32) read_t1_yes) true)))
 (let (($x1919 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x375 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x513 (and (distinct input_b true) true)))
 (or $x513 $x375 $x1919 $x1632 $x1597 $x827 $x1472 $x1098 $x1707 $x1244 $x1064 $x907 $x209)))))))))))))))
(assert
 (let (($x209 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1362 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x68 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x1244 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1707 (and (distinct rf_6_5 false) true)))
 (let (($x1204 (and (distinct rf_2_5 false) true)))
 (let (($x1530 (and (distinct rf_0_5 true) true)))
 (let (($x827 (and (distinct rf_1_4 true) true)))
 (let (($x1597 (and (distinct rf_1_3 true) true)))
 (let (($x1899 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1919 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x375 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x97 (and (distinct input_b false) true)))
 (or $x97 $x375 $x1919 $x1899 $x1597 $x827 $x1530 $x1204 $x1707 $x1244 $x68 $x1362 $x209)))))))))))))))
(assert
 (let (($x209 (and (distinct (_ bv0 1) co_1) true)))
(let (($x1362 (and (distinct (_ bv1 2) co_6) true)))
(let (($x68 (and (distinct (_ bv2 2) co_2) true)))
(let (($x1244 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1707 (and (distinct rf_6_5 false) true)))
(let (($x1204 (and (distinct rf_2_5 false) true)))
(let (($x1530 (and (distinct rf_0_5 true) true)))
(let (($x827 (and (distinct rf_1_4 true) true)))
(let (($x1597 (and (distinct rf_1_3 true) true)))
(let (($x1899 (and (distinct (_ bv0 32) read_t1_yes) true)))
(let (($x1919 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x375 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x513 (and (distinct input_b true) true)))
(or $x513 $x375 $x1919 $x1899 $x1597 $x827 $x1530 $x1204 $x1707 $x1244 $x68 $x1362 $x209)))))))))))))))
(check-sat)
