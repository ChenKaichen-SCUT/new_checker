; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
 (= input_b true))
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
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_6) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_a (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_2 rf_3_2 rf_6_2))
(assert
 (let (($x19 (= (_ bv0 32) read_t0_b)))
 (=> rf_0_4 $x19)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_3_5 rf_6_5))
(assert
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x2132 false))))
(assert
 (let (($x1580 (bvult co_1 co_3)))
 (let (($x25 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (not (and $x25 $x1580)))))
(assert
 (let (($x2447 (bvult co_6 co_3)))
 (let (($x407 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x407 $x2447)))))
(assert
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (not (and $x2928 false))))
(assert
 (let (($x1025 (bvult co_1 co_6)))
 (let (($x842 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x842 $x1025)))))
(assert
 (let (($x1698 (bvult co_3 co_6)))
 (let (($x833 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (not (and $x833 $x1698)))))
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
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1448 (or false false false $x2132)))
 (=> $x1448 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x2455 (or false false false $x2132 $x1774)))
 (=> $x2455 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x25 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x25) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1774 (and true false)))
 (let (($x25 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x25 $x1774) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1448 (or false false false $x2132)))
 (=> $x1448 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x2132 $x1506) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1694 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x1694) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1506 (and false false)))
 (let (($x1694 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x1694 $x1506) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1448 (or false false false $x2132)))
 (=> $x1448 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or true false false $x2132 $x1506) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1448 (or false false false $x2132)))
 (=> $x1448 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x2132 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x2455 (or false false false $x2132 $x1774)))
 (=> $x2455 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x407 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x407) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1774 (and true false)))
 (let (($x407 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x407 $x1774) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x1774 (and true false)))
 (let (($x1891 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x1891 $x1774) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x613 (or false false false $x460 $x1774)))
 (=> $x613 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x1206 (or false false false $x460 $x1506)))
 (=> $x1206 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x1206 (or false false false $x460 $x1506)))
 (=> $x1206 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x1206 (or false false false $x460 $x1506)))
 (=> $x1206 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x613 (or false false false $x460 $x1774)))
 (=> $x613 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x645 (or false false false $x460)))
 (=> $x645 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x460 (or (and rf_0_4 false))))
 (let (($x613 (or false false false $x460 $x1774)))
 (=> $x613 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x2236 (or false false false $x2928)))
 (=> $x2236 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x232 (or false false false $x2928 $x1774)))
 (=> $x232 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x842 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x842) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1774 (and true false)))
 (let (($x842 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x842 $x1774) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x2236 (or false false false $x2928)))
 (=> $x2236 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x232 (or false false false $x2928 $x1774)))
 (=> $x232 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x833 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x833) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1774 (and true false)))
 (let (($x833 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x833 $x1774) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x2236 (or false false false $x2928)))
 (=> $x2236 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1774 (and true false)))
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x232 (or false false false $x2928 $x1774)))
 (=> $x232 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x2236 (or false false false $x2928)))
 (=> $x2236 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1506 (and false false)))
 (let (($x2928 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or false false false $x2928 $x1506) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x2257 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x2257) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1506 (and false false)))
 (let (($x2257 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x2257 $x1506) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false (bvult co_6 co_3) or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert
 (let (($x1272 (or false false false or)))
 (=> $x1272 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x1774 (and true false)))
 (let (($x530 (or false false false or $x1774)))
 (=> $x530 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1332 (= (_ bv0 32) final_x)))
 (let (($x1523 (= co_0 (_ bv0 1))))
 (=> $x1523 $x1332))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x381 (= co_3 (_ bv2 2))))
 (=> $x381 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x364 (= co_6 (_ bv2 2))))
 (=> $x364 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x1273 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1932 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x2647 (and (distinct rf_6_5 false) true)))
 (let (($x1858 (and (distinct rf_0_4 true) true)))
 (let (($x796 (and (distinct rf_3_2 false) true)))
 (let (($x706 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x404 (and (distinct input_b true) true)))
 (or $x404 (and (distinct (_ bv0 32) read_t0_yes) true) $x706 (and (distinct (_ bv1 32) read_t1_a) true) (and (distinct rf_1_2 true) true) $x796 (and (distinct rf_6_2 false) true) $x1858 (and (distinct rf_1_5 false) true) (and (distinct rf_3_5 true) true) $x2647 $x1932 $x1273 (and (distinct (_ bv1 2) co_3) true) (and (distinct (_ bv2 2) co_6) true))))))))))
(assert
 (let (($x1273 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1932 (and (distinct (_ bv0 1) co_0) true)))
(let (($x2647 (and (distinct rf_6_5 false) true)))
(let (($x1858 (and (distinct rf_0_4 true) true)))
(let (($x796 (and (distinct rf_3_2 false) true)))
(let (($x706 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x404 (and (distinct input_b true) true)))
(or $x404 (and (distinct (_ bv1 32) read_t0_yes) true) $x706 (and (distinct (_ bv0 32) read_t1_a) true) (and (distinct rf_1_2 false) true) $x796 (and (distinct rf_6_2 true) true) $x1858 (and (distinct rf_1_5 true) true) (and (distinct rf_3_5 false) true) $x2647 $x1932 $x1273 (and (distinct (_ bv2 2) co_3) true) (and (distinct (_ bv1 2) co_6) true))))))))))
(check-sat)
