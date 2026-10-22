; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
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
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_0 co_5) true))
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
 (=> rf_5_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_5_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_3_4))
(assert
 (bvult topo_U_0 (_ bv6 3)))
(assert
 (bvult topo_U_1 (_ bv6 3)))
(assert
 (bvult topo_U_2 (_ bv6 3)))
(assert
 (bvult topo_U_3 (_ bv6 3)))
(assert
 (bvult topo_U_4 (_ bv6 3)))
(assert
 (bvult topo_U_5 (_ bv6 3)))
(assert
 (bvult topo_T_0 (_ bv6 3)))
(assert
 (bvult topo_T_1 (_ bv6 3)))
(assert
 (bvult topo_T_2 (_ bv6 3)))
(assert
 (bvult topo_T_3 (_ bv6 3)))
(assert
 (bvult topo_T_4 (_ bv6 3)))
(assert
 (bvult topo_T_5 (_ bv6 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x458 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x458) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1317 (and true false)))
 (let (($x458 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x458 $x1317) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x1125 (or false false false $x1247)))
 (=> $x1125 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1317 (and true false)))
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x730 (or false false false $x1247 $x1317)))
 (=> $x730 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x1125 (or false false false $x1247)))
 (=> $x1125 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x784 (and false false)))
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (=> (or false false false $x1247 $x784) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x1125 (or false false false $x1247)))
 (=> $x1125 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x784 (and false false)))
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (=> (or true false false $x1247 $x784) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x1125 (or false false false $x1247)))
 (=> $x1125 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1317 (and true false)))
 (let (($x1247 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x730 (or false false false $x1247 $x1317)))
 (=> $x730 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x88 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x88) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1317 (and true false)))
 (let (($x88 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x88 $x1317) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x784 (and false false)))
 (let (($x1467 (or false false false or $x784)))
 (=> $x1467 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1708 (or false false false $x1233)))
 (=> $x1708 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1317 (and true false)))
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x315 (or false false false $x1233 $x1317)))
 (=> $x315 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x200 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x200) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1317 (and true false)))
 (let (($x200 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x200 $x1317) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1708 (or false false false $x1233)))
 (=> $x1708 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1317 (and true false)))
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x315 (or false false false $x1233 $x1317)))
 (=> $x315 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1438 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1438) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x1317 (and true false)))
 (let (($x1438 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1438 $x1317) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1708 (or false false false $x1233)))
 (=> $x1708 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x784 (and false false)))
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (=> (or false false false $x1233 $x784) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1708 (or false false false $x1233)))
 (=> $x1708 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x784 (and false false)))
 (let (($x1233 (or (and rf_1_4 false) (and rf_3_4 false))))
 (=> (or true false false $x1233 $x784) (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1317 (and true false)))
 (let (($x985 (or false false false or $x1317)))
 (=> $x985 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x571 (or false false false or)))
 (=> $x571 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x784 (and false false)))
 (let (($x1467 (or false false false or $x784)))
 (=> $x1467 (bvult topo_T_5 topo_T_4)))))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x242 (= co_5 (_ bv1 2))))
 (=> $x242 (= (_ bv1 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x326 (= co_3 (_ bv1 2))))
 (=> $x326 (= (_ bv1 32) final_y))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x182 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x626 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x547 (and (distinct rf_3_4 false) true)))
 (let (($x1495 (and (distinct rf_1_4 true) true)))
 (let (($x61 (and (distinct rf_5_2 true) true)))
 (let (($x999 (and (distinct rf_0_2 false) true)))
 (let (($x252 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1554 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x811 (and (distinct input_b false) true)))
 (or $x811 $x1554 $x252 $x999 $x61 $x1495 $x547 $x626 $x182 $x1352 $x1558)))))))))))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x182 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x626 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x547 (and (distinct rf_3_4 false) true)))
 (let (($x1495 (and (distinct rf_1_4 true) true)))
 (let (($x952 (and (distinct rf_5_2 false) true)))
 (let (($x1481 (and (distinct rf_0_2 true) true)))
 (let (($x252 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1314 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x811 (and (distinct input_b false) true)))
 (or $x811 $x1314 $x252 $x1481 $x952 $x1495 $x547 $x626 $x182 $x1352 $x1558)))))))))))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x182 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x626 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x547 (and (distinct rf_3_4 false) true)))
 (let (($x1495 (and (distinct rf_1_4 true) true)))
 (let (($x952 (and (distinct rf_5_2 false) true)))
 (let (($x1481 (and (distinct rf_0_2 true) true)))
 (let (($x252 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1314 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1907 (and (distinct input_b true) true)))
 (or $x1907 $x1314 $x252 $x1481 $x952 $x1495 $x547 $x626 $x182 $x1352 $x1558)))))))))))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x182 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x626 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1390 (and (distinct rf_3_4 true) true)))
 (let (($x523 (and (distinct rf_1_4 false) true)))
 (let (($x952 (and (distinct rf_5_2 false) true)))
 (let (($x1481 (and (distinct rf_0_2 true) true)))
 (let (($x1094 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1314 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x811 (and (distinct input_b false) true)))
 (or $x811 $x1314 $x1094 $x1481 $x952 $x523 $x1390 $x626 $x182 $x1352 $x1558)))))))))))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x182 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x626 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1390 (and (distinct rf_3_4 true) true)))
 (let (($x523 (and (distinct rf_1_4 false) true)))
 (let (($x952 (and (distinct rf_5_2 false) true)))
 (let (($x1481 (and (distinct rf_0_2 true) true)))
 (let (($x1094 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1314 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1907 (and (distinct input_b true) true)))
 (or $x1907 $x1314 $x1094 $x1481 $x952 $x523 $x1390 $x626 $x182 $x1352 $x1558)))))))))))))
(assert
 (let (($x1558 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1352 (and (distinct (_ bv0 2) co_1) true)))
(let (($x182 (and (distinct (_ bv1 2) co_5) true)))
(let (($x626 (and (distinct (_ bv0 2) co_0) true)))
(let (($x547 (and (distinct rf_3_4 false) true)))
(let (($x1495 (and (distinct rf_1_4 true) true)))
(let (($x61 (and (distinct rf_5_2 true) true)))
(let (($x999 (and (distinct rf_0_2 false) true)))
(let (($x252 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1554 (and (distinct (_ bv1 32) read_t0_a) true)))
(let (($x1907 (and (distinct input_b true) true)))
(or $x1907 $x1554 $x252 $x999 $x61 $x1495 $x547 $x626 $x182 $x1352 $x1558)))))))))))))
(check-sat)
