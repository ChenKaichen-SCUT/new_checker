; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
 (= input_b false))
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
 (=> rf_1_2 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_6_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_3_5))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1174 (bvult co_1 co_3)))
 (let (($x333 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (not (and $x333 $x1174)))))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
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
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1385 (or false false false $x1107)))
 (=> $x1385 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1161 (or false false false $x1107 $x2541)))
 (=> $x1161 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x333 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x333) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x2541 (and true false)))
 (let (($x333 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x333 $x2541) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1385 (or false false false $x1107)))
 (=> $x1385 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1107 $x1270) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1314 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1314) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1314 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1314 $x1270) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1385 (or false false false $x1107)))
 (=> $x1385 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or true false false $x1107 $x1270) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1385 (or false false false $x1107)))
 (=> $x1385 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1161 (or false false false $x1107 $x2541)))
 (=> $x1161 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1385 (or false false false $x1107)))
 (=> $x1385 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1107 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1161 (or false false false $x1107 $x2541)))
 (=> $x1161 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x2342 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_6_4 (bvult co_6 co_0)))))
 (=> (or false false false $x2342) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2342 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_6_4 (bvult co_6 co_0)))))
 (=> (or false false false $x2342 $x2541) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1455 (or false false false $x1567)))
 (=> $x1455 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1984 (or false false false $x1567 $x2541)))
 (=> $x1984 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1455 (or false false false $x1567)))
 (=> $x1455 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x200 (or false false false $x1567 $x1270)))
 (=> $x200 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1455 (or false false false $x1567)))
 (=> $x1455 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x200 (or false false false $x1567 $x1270)))
 (=> $x200 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1455 (or false false false $x1567)))
 (=> $x1455 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x200 (or false false false $x1567 $x1270)))
 (=> $x200 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1455 (or false false false $x1567)))
 (=> $x1455 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1567 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1984 (or false false false $x1567 $x2541)))
 (=> $x1984 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1910 (or (and rf_0_4 (bvult co_0 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1910) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1910 (or (and rf_0_4 (bvult co_0 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1910 $x2541) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2579 (or false false false $x1373)))
 (=> $x2579 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2600 (or false false false $x1373 $x2541)))
 (=> $x2600 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x2544 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x2544) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2544 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x2544 $x2541) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2579 (or false false false $x1373)))
 (=> $x2579 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2600 (or false false false $x1373 $x2541)))
 (=> $x2600 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2170 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x2170) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2170 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x2170 $x2541) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2579 (or false false false $x1373)))
 (=> $x2579 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x2541 (and true false)))
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2600 (or false false false $x1373 $x2541)))
 (=> $x2600 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2579 (or false false false $x1373)))
 (=> $x2579 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (=> (or false false false $x1373 $x1270) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2579 (or false false false $x1373)))
 (=> $x2579 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x1270 (and false false)))
 (let (($x1373 (or (and rf_1_5 false) (and rf_3_5 false))))
 (=> (or true false false $x1373 $x1270) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x2541 (and true false)))
 (let (($x2103 (or false false false or $x2541)))
 (=> $x2103 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (let (($x884 (or false false false or)))
 (=> $x884 (bvult topo_U_6 topo_U_5))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x897 (= (_ bv1 32) final_x)))
 (let (($x357 (= co_6 (_ bv1 2))))
 (=> $x357 $x897))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x620 (= co_3 (_ bv1 2))))
 (=> $x620 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x2378 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1810 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x146 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1377 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1969 (and (distinct rf_3_5 false) true)))
 (let (($x469 (and (distinct rf_1_5 true) true)))
 (let (($x2045 (and (distinct rf_6_4 true) true)))
 (let (($x1033 (and (distinct rf_0_4 false) true)))
 (let (($x1061 (and (distinct rf_3_2 false) true)))
 (let (($x1912 (and (distinct rf_1_2 true) true)))
 (let (($x434 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1222 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2284 (and (distinct (_ bv0 32) read_t0_no) true)))
 (let (($x2463 (and (distinct input_b false) true)))
 (or $x2463 $x2284 $x1222 $x434 $x1912 $x1061 $x1033 $x2045 $x469 $x1969 $x1377 $x146 $x1810 $x2378))))))))))))))))
(assert
 (let (($x2378 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1810 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x146 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1377 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1355 (and (distinct rf_3_5 true) true)))
 (let (($x2116 (and (distinct rf_1_5 false) true)))
 (let (($x2045 (and (distinct rf_6_4 true) true)))
 (let (($x1033 (and (distinct rf_0_4 false) true)))
 (let (($x1061 (and (distinct rf_3_2 false) true)))
 (let (($x1912 (and (distinct rf_1_2 true) true)))
 (let (($x714 (and (distinct (_ bv2 32) read_t1_a) true)))
 (let (($x1222 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2284 (and (distinct (_ bv0 32) read_t0_no) true)))
 (let (($x2463 (and (distinct input_b false) true)))
 (or $x2463 $x2284 $x1222 $x714 $x1912 $x1061 $x1033 $x2045 $x2116 $x1355 $x1377 $x146 $x1810 $x2378))))))))))))))))
(assert
 (let (($x2378 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1810 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x146 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1377 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1969 (and (distinct rf_3_5 false) true)))
 (let (($x469 (and (distinct rf_1_5 true) true)))
 (let (($x1557 (and (distinct rf_6_4 false) true)))
 (let (($x2123 (and (distinct rf_0_4 true) true)))
 (let (($x1061 (and (distinct rf_3_2 false) true)))
 (let (($x1912 (and (distinct rf_1_2 true) true)))
 (let (($x434 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1415 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2284 (and (distinct (_ bv0 32) read_t0_no) true)))
 (let (($x2463 (and (distinct input_b false) true)))
 (or $x2463 $x2284 $x1415 $x434 $x1912 $x1061 $x2123 $x1557 $x469 $x1969 $x1377 $x146 $x1810 $x2378))))))))))))))))
(assert
 (let (($x2378 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1810 (and (distinct (_ bv0 2) co_1) true)))
(let (($x146 (and (distinct (_ bv1 2) co_6) true)))
(let (($x1377 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1355 (and (distinct rf_3_5 true) true)))
(let (($x2116 (and (distinct rf_1_5 false) true)))
(let (($x1557 (and (distinct rf_6_4 false) true)))
(let (($x2123 (and (distinct rf_0_4 true) true)))
(let (($x1061 (and (distinct rf_3_2 false) true)))
(let (($x1912 (and (distinct rf_1_2 true) true)))
(let (($x714 (and (distinct (_ bv2 32) read_t1_a) true)))
(let (($x1415 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x2284 (and (distinct (_ bv0 32) read_t0_no) true)))
(let (($x2463 (and (distinct input_b false) true)))
(or $x2463 $x2284 $x1415 $x714 $x1912 $x1061 $x2123 $x1557 $x2116 $x1355 $x1377 $x146 $x1810 $x2378))))))))))))))))
(check-sat)
