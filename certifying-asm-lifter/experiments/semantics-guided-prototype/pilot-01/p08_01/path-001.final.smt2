; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
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
(assert
 true)
(assert
 (= input_b false))
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
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_5) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 (=> rf_5_2 (= (_ bv1 32) read_t0_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_2 rf_3_2 rf_5_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (not (and $x51 false))))
(assert
 (let (($x855 (bvult co_1 co_3)))
 (let (($x1193 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (not (and $x1193 $x855)))))
(assert
 (let (($x534 (bvult co_5 co_3)))
 (let (($x1367 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (not (and $x1367 $x534)))))
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
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x51)))
 (=> $x2614 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x1626 (and true false)))
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x51 $x1626) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1193 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x1193) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1626 (and true false)))
 (let (($x1193 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x1193 $x1626) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x51)))
 (=> $x2614 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1756 (and false false)))
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x51 $x1756) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x940 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x940) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1756 (and false false)))
 (let (($x940 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x940 $x1756) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x51)))
 (=> $x2614 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1756 (and false false)))
 (let (($x51 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or true false false $x51 $x1756) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1367 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1367) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1626 (and true false)))
 (let (($x1367 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1367 $x1626) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x1626 (and true false)))
 (let (($x725 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x725 $x1626) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x1374 (or false false false $x1239)))
 (=> $x1374 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x1626 (and true false)))
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x46 (or false false false $x1239 $x1626)))
 (=> $x46 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x1374 (or false false false $x1239)))
 (=> $x1374 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1756 (and false false)))
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x65 (or false false false $x1239 $x1756)))
 (=> $x65 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x1374 (or false false false $x1239)))
 (=> $x1374 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1756 (and false false)))
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x65 (or false false false $x1239 $x1756)))
 (=> $x65 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x1374 (or false false false $x1239)))
 (=> $x1374 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1756 (and false false)))
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x65 (or false false false $x1239 $x1756)))
 (=> $x65 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x1374 (or false false false $x1239)))
 (=> $x1374 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1626 (and true false)))
 (let (($x1239 (or (and rf_0_4 false))))
 (let (($x46 (or false false false $x1239 $x1626)))
 (=> $x46 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (let (($x1338 (or false false false or)))
 (=> $x1338 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x1626 (and true false)))
 (let (($x2683 (or false false false or $x1626)))
 (=> $x2683 (bvult topo_T_5 topo_T_4)))))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x2579 (= co_0 (_ bv0 1))))
 (=> $x2579 (= (_ bv0 32) final_x))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x517 (= co_3 (_ bv2 2))))
 (=> $x517 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x2169 (= co_5 (_ bv2 2))))
 (=> $x2169 (= (_ bv1 32) final_y))))
(assert
 (let (($x1064 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1439 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x693 (and (distinct rf_0_4 true) true)))
 (let (($x229 (and (distinct rf_3_2 false) true)))
 (let (($x2523 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1478 (and (distinct input_b false) true)))
 (or $x1478 (and (distinct (_ bv1 32) read_t0_no) true) $x2523 (and (distinct rf_1_2 false) true) $x229 (and (distinct rf_5_2 true) true) $x693 $x1439 $x1064 (and (distinct (_ bv2 2) co_3) true) (and (distinct (_ bv1 2) co_5) true)))))))))
(assert
 (let (($x1064 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1439 (and (distinct (_ bv0 1) co_0) true)))
(let (($x693 (and (distinct rf_0_4 true) true)))
(let (($x229 (and (distinct rf_3_2 false) true)))
(let (($x2523 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x1478 (and (distinct input_b false) true)))
(or $x1478 (and (distinct (_ bv0 32) read_t0_no) true) $x2523 (and (distinct rf_1_2 true) true) $x229 (and (distinct rf_5_2 false) true) $x693 $x1439 $x1064 (and (distinct (_ bv1 2) co_3) true) (and (distinct (_ bv2 2) co_5) true)))))))))
(check-sat)
