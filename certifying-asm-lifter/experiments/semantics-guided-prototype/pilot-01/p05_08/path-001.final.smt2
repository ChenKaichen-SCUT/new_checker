; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_5_2 () Bool)
(declare-fun rf_0_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_3_6 () Bool)
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
 (=> rf_5_2 (= (bvadd read_t1_no (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_5_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_no)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_5_4))
(assert
 (=> rf_1_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_6 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_6 rf_3_6))
(assert
 (let (($x318 (bvult co_0 co_5)))
 (let (($x1766 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (not (and $x1766 $x318)))))
(assert
 (not (and (or (and rf_0_4 false) (and rf_5_4 false)) false)))
(assert
 (not (and (or (and rf_0_4 false) (and rf_5_4 false)) false)))
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
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1556 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x1556) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x769 (and true false)))
 (let (($x1556 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x1556 $x769) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x844 (or false false false $x258)))
 (=> $x844 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x769 (and true false)))
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x256 (or false false false $x258 $x769)))
 (=> $x256 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x844 (or false false false $x258)))
 (=> $x844 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x621 (and false false)))
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (=> (or false false false $x258 $x621) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x844 (or false false false $x258)))
 (=> $x844 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x621 (and false false)))
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (=> (or true false false $x258 $x621) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x844 (or false false false $x258)))
 (=> $x844 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x769 (and true false)))
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x256 (or false false false $x258 $x769)))
 (=> $x256 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1569 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1569) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x769 (and true false)))
 (let (($x1569 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1569 $x769) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x844 (or false false false $x258)))
 (=> $x844 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x769 (and true false)))
 (let (($x258 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x256 (or false false false $x258 $x769)))
 (=> $x256 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_3 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x1766 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x1766) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x769 (and true false)))
 (let (($x1766 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x1766 $x769) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1304 (or false false false $x852)))
 (=> $x1304 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x769 (and true false)))
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1014 (or false false false $x852 $x769)))
 (=> $x1014 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1304 (or false false false $x852)))
 (=> $x1304 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x769 (and true false)))
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1014 (or false false false $x852 $x769)))
 (=> $x1014 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1304 (or false false false $x852)))
 (=> $x1304 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x769 (and true false)))
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1014 (or false false false $x852 $x769)))
 (=> $x1014 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1304 (or false false false $x852)))
 (=> $x1304 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x621 (and false false)))
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (=> (or false false false $x852 $x621) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x984 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x984) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x621 (and false false)))
 (let (($x984 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x984 $x621) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1304 (or false false false $x852)))
 (=> $x1304 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x621 (and false false)))
 (let (($x852 (or (and rf_0_4 false) (and rf_5_4 false))))
 (=> (or true false false $x852 $x621) (bvult topo_T_4 topo_T_6)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x769 (and true false)))
 (let (($x157 (or false false false or $x769)))
 (=> $x157 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1368 (or false false false or)))
 (=> $x1368 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x926 (or false false false $x530)))
 (=> $x926 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x769 (and true false)))
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x1604 (or false false false $x530 $x769)))
 (=> $x1604 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1294 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_3_6 (bvult co_3 co_1)))))
 (=> (or false false false $x1294) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x769 (and true false)))
 (let (($x1294 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_3_6 (bvult co_3 co_1)))))
 (=> (or false false false $x1294 $x769) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x926 (or false false false $x530)))
 (=> $x926 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x769 (and true false)))
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x1604 (or false false false $x530 $x769)))
 (=> $x1604 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1707 (or (and rf_1_6 (bvult co_1 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x1707) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x769 (and true false)))
 (let (($x1707 (or (and rf_1_6 (bvult co_1 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x1707 $x769) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x926 (or false false false $x530)))
 (=> $x926 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x621 (and false false)))
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x690 (or false false false $x530 $x621)))
 (=> $x690 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x926 (or false false false $x530)))
 (=> $x926 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x621 (and false false)))
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x690 (or false false false $x530 $x621)))
 (=> $x690 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x926 (or false false false $x530)))
 (=> $x926 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x621 (and false false)))
 (let (($x530 (or (and rf_1_6 false) (and rf_3_6 false))))
 (let (($x690 (or false false false $x530 $x621)))
 (=> $x690 (bvult topo_T_6 topo_T_6))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x955 (= co_5 (_ bv1 2))))
 (=> $x955 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x421 (= (_ bv1 32) final_y)))
 (let (($x1450 (= co_3 (_ bv1 2))))
 (=> $x1450 $x421))))
(assert
 (let (($x441 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x779 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1439 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1607 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1534 (and (distinct rf_3_6 false) true)))
 (let (($x29 (and (distinct rf_1_6 true) true)))
 (let (($x918 (and (distinct rf_5_4 false) true)))
 (let (($x285 (and (distinct rf_0_4 true) true)))
 (let (($x998 (and (distinct rf_5_2 false) true)))
 (let (($x151 (and (distinct rf_0_2 true) true)))
 (let (($x1230 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x923 (and (distinct (_ bv0 32) read_t1_no) true)))
 (let (($x1227 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x279 (and (distinct input_b false) true)))
 (or $x279 $x1227 $x923 $x1230 $x151 $x998 $x285 $x918 $x29 $x1534 $x1607 $x1439 $x779 $x441))))))))))))))))
(assert
 (let (($x441 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x779 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1439 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1607 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1534 (and (distinct rf_3_6 false) true)))
 (let (($x29 (and (distinct rf_1_6 true) true)))
 (let (($x918 (and (distinct rf_5_4 false) true)))
 (let (($x285 (and (distinct rf_0_4 true) true)))
 (let (($x271 (and (distinct rf_5_2 true) true)))
 (let (($x1822 (and (distinct rf_0_2 false) true)))
 (let (($x1230 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x923 (and (distinct (_ bv0 32) read_t1_no) true)))
 (let (($x644 (and (distinct (_ bv2 32) read_t0_a) true)))
 (let (($x279 (and (distinct input_b false) true)))
 (or $x279 $x644 $x923 $x1230 $x1822 $x271 $x285 $x918 $x29 $x1534 $x1607 $x1439 $x779 $x441))))))))))))))))
(assert
 (let (($x441 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x779 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1439 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1607 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x488 (and (distinct rf_3_6 true) true)))
 (let (($x237 (and (distinct rf_1_6 false) true)))
 (let (($x918 (and (distinct rf_5_4 false) true)))
 (let (($x285 (and (distinct rf_0_4 true) true)))
 (let (($x271 (and (distinct rf_5_2 true) true)))
 (let (($x1822 (and (distinct rf_0_2 false) true)))
 (let (($x1224 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x923 (and (distinct (_ bv0 32) read_t1_no) true)))
 (let (($x644 (and (distinct (_ bv2 32) read_t0_a) true)))
 (let (($x279 (and (distinct input_b false) true)))
 (or $x279 $x644 $x923 $x1224 $x1822 $x271 $x285 $x918 $x237 $x488 $x1607 $x1439 $x779 $x441))))))))))))))))
(assert
 (let (($x441 (and (distinct (_ bv1 2) co_3) true)))
(let (($x779 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1439 (and (distinct (_ bv1 2) co_5) true)))
(let (($x1607 (and (distinct (_ bv0 2) co_0) true)))
(let (($x488 (and (distinct rf_3_6 true) true)))
(let (($x237 (and (distinct rf_1_6 false) true)))
(let (($x918 (and (distinct rf_5_4 false) true)))
(let (($x285 (and (distinct rf_0_4 true) true)))
(let (($x998 (and (distinct rf_5_2 false) true)))
(let (($x151 (and (distinct rf_0_2 true) true)))
(let (($x1224 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x923 (and (distinct (_ bv0 32) read_t1_no) true)))
(let (($x1227 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x279 (and (distinct input_b false) true)))
(or $x279 $x1227 $x923 $x1224 $x151 $x998 $x285 $x918 $x237 $x488 $x1607 $x1439 $x779 $x441))))))))))))))))
(check-sat)
