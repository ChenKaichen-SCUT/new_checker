; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_5))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x385 (bvult co_1 co_4)))
 (let (($x344 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x344 $x385)))))
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
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x321 (and true false)))
 (let (($x367 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x367 $x321) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x410 (or false false false $x43)))
 (=> $x410 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x321 (and true false)))
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x240 (or false false false $x43 $x321)))
 (=> $x240 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x410 (or false false false $x43)))
 (=> $x410 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x71 (and false false)))
 (let (($x43 (or (and rf_0_2 false))))
 (=> (or false false false $x43 $x71) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x410 (or false false false $x43)))
 (=> $x410 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x321 (and true false)))
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x240 (or false false false $x43 $x321)))
 (=> $x240 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x410 (or false false false $x43)))
 (=> $x410 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x321 (and true false)))
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x240 (or false false false $x43 $x321)))
 (=> $x240 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x410 (or false false false $x43)))
 (=> $x410 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x321 (and true false)))
 (let (($x43 (or (and rf_0_2 false))))
 (let (($x240 (or false false false $x43 $x321)))
 (=> $x240 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x534 (or false false false $x81)))
 (=> $x534 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x321 (and true false)))
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x541 (or false false false $x81 $x321)))
 (=> $x541 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x344 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x344) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x321 (and true false)))
 (let (($x344 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x344 $x321) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x534 (or false false false $x81)))
 (=> $x534 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x321 (and true false)))
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x541 (or false false false $x81 $x321)))
 (=> $x541 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x534 (or false false false $x81)))
 (=> $x534 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x71 (and false false)))
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x81 $x71) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x426 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x426) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x71 (and false false)))
 (let (($x426 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x426 $x71) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x534 (or false false false $x81)))
 (=> $x534 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x71 (and false false)))
 (let (($x81 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or true false false $x81 $x71) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x321 (and true false)))
 (let (($x79 (or false false false or $x321)))
 (=> $x79 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x330 (or false false false or)))
 (=> $x330 (bvult topo_U_4 topo_U_5))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert
 (=> (or false false false (or (and rf_0_5 (bvult co_0 co_0)))) (bvult topo_U_5 topo_U_0)))
(assert
 (let (($x321 (and true false)))
 (let (($x211 (or (and rf_0_5 (bvult co_0 co_0)))))
 (=> (or false false false $x211 $x321) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x582 (or false false false $x32)))
 (=> $x582 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x321 (and true false)))
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x227 (or false false false $x32 $x321)))
 (=> $x227 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x582 (or false false false $x32)))
 (=> $x582 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x321 (and true false)))
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x227 (or false false false $x32 $x321)))
 (=> $x227 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x582 (or false false false $x32)))
 (=> $x582 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x71 (and false false)))
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x180 (or false false false $x32 $x71)))
 (=> $x180 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x582 (or false false false $x32)))
 (=> $x582 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x71 (and false false)))
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x180 (or false false false $x32 $x71)))
 (=> $x180 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x582 (or false false false $x32)))
 (=> $x582 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x71 (and false false)))
 (let (($x32 (or (and rf_0_5 false))))
 (let (($x180 (or false false false $x32 $x71)))
 (=> $x180 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x256 (= co_0 (_ bv0 1))))
 (=> $x256 (= (_ bv0 32) final_x))))
(assert
 (let (($x302 (= co_1 (_ bv1 2))))
 (=> $x302 (= (_ bv0 32) final_y))))
(assert
 (let (($x341 (= co_4 (_ bv1 2))))
(=> $x341 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
