; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
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
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (let (($x423 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x423)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (let (($x10 (= (_ bv0 32) read_t1_b)))
 (=> rf_0_5 $x10)))
(assert
 ((_ pbeq 1 1) rf_0_5))
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
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x21 (and true false)))
 (let (($x152 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x152 $x21) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x285 (or false false false $x378)))
 (=> $x285 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x21 (and true false)))
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x381 (or false false false $x378 $x21)))
 (=> $x381 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x285 (or false false false $x378)))
 (=> $x285 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x243 (and false false)))
 (let (($x378 (or (and rf_0_2 false))))
 (=> (or false false false $x378 $x243) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x285 (or false false false $x378)))
 (=> $x285 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x21 (and true false)))
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x381 (or false false false $x378 $x21)))
 (=> $x381 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x285 (or false false false $x378)))
 (=> $x285 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x21 (and true false)))
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x381 (or false false false $x378 $x21)))
 (=> $x381 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x285 (or false false false $x378)))
 (=> $x285 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x21 (and true false)))
 (let (($x378 (or (and rf_0_2 false))))
 (let (($x381 (or false false false $x378 $x21)))
 (=> $x381 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x243 (and false false)))
 (let (($x395 (or false false false or $x243)))
 (=> $x395 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_3 topo_U_5))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x21 (and true false)))
 (let (($x111 (or false false false or $x21)))
 (=> $x111 (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x243 (and false false)))
 (let (($x395 (or false false false or $x243)))
 (=> $x395 (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_4))))
(assert
 (let (($x243 (and false false)))
 (let (($x395 (or false false false or $x243)))
 (=> $x395 (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x566 (or false false false or)))
 (=> $x566 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x243 (and false false)))
 (let (($x395 (or false false false or $x243)))
 (=> $x395 (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false false (or (and rf_0_5 (bvult co_0 co_0)))) (bvult topo_U_5 topo_U_0)))
(assert
 (let (($x21 (and true false)))
 (let (($x452 (or (and rf_0_5 (bvult co_0 co_0)))))
 (=> (or false false false $x452 $x21) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x445 (or false false false $x444)))
 (=> $x445 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x21 (and true false)))
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x93 (or false false false $x444 $x21)))
 (=> $x93 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x445 (or false false false $x444)))
 (=> $x445 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x21 (and true false)))
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x93 (or false false false $x444 $x21)))
 (=> $x93 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x445 (or false false false $x444)))
 (=> $x445 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x243 (and false false)))
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x585 (or false false false $x444 $x243)))
 (=> $x585 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x445 (or false false false $x444)))
 (=> $x445 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x243 (and false false)))
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x585 (or false false false $x444 $x243)))
 (=> $x585 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x445 (or false false false $x444)))
 (=> $x445 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x243 (and false false)))
 (let (($x444 (or (and rf_0_5 false))))
 (let (($x585 (or false false false $x444 $x243)))
 (=> $x585 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x549 (= (_ bv0 32) final_x)))
 (let (($x245 (= co_0 (_ bv0 1))))
 (=> $x245 $x549))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x541 (= (_ bv1 32) final_y)))
 (let (($x518 (= co_3 (_ bv1 2))))
 (=> $x518 $x541))))
(assert
 (let (($x531 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x574 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x539 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x543 (and (distinct rf_0_5 true) true)))
 (let (($x538 (and (distinct rf_0_2 true) true)))
 (let (($x534 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x530 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x530 $x534 $x538 $x543 $x539 $x574 $x531)))))))))
(assert
 (let (($x531 (and (distinct (_ bv1 2) co_3) true)))
(let (($x574 (and (distinct (_ bv0 2) co_1) true)))
(let (($x539 (and (distinct (_ bv0 1) co_0) true)))
(let (($x543 (and (distinct rf_0_5 true) true)))
(let (($x538 (and (distinct rf_0_2 true) true)))
(let (($x534 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x530 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x530 $x534 $x538 $x543 $x539 $x574 $x531)))))))))
(check-sat)
