; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
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
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (bvult topo_U_0 (_ bv5 3)))
(assert
 (bvult topo_U_1 (_ bv5 3)))
(assert
 (bvult topo_U_2 (_ bv5 3)))
(assert
 (bvult topo_U_3 (_ bv5 3)))
(assert
 (bvult topo_U_4 (_ bv5 3)))
(assert
 (bvult topo_T_0 (_ bv5 3)))
(assert
 (bvult topo_T_1 (_ bv5 3)))
(assert
 (bvult topo_T_2 (_ bv5 3)))
(assert
 (bvult topo_T_3 (_ bv5 3)))
(assert
 (bvult topo_T_4 (_ bv5 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x143 (and true false)))
 (let (($x21 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x21 $x143) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x158 (or false false false $x192)))
 (=> $x158 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x143 (and true false)))
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x40 (or false false false $x192 $x143)))
 (=> $x40 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x158 (or false false false $x192)))
 (=> $x158 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x164 (and false false)))
 (let (($x192 (or (and rf_0_2 false))))
 (=> (or false false false $x192 $x164) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x158 (or false false false $x192)))
 (=> $x158 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x143 (and true false)))
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x40 (or false false false $x192 $x143)))
 (=> $x40 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x158 (or false false false $x192)))
 (=> $x158 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x143 (and true false)))
 (let (($x192 (or (and rf_0_2 false))))
 (let (($x40 (or false false false $x192 $x143)))
 (=> $x40 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x143 (and true false)))
 (let (($x51 (or false false false or $x143)))
 (=> $x51 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x191 (or false false false or)))
 (=> $x191 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x143 (and true false)))
 (let (($x293 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x293 $x143) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x385 (or false false false $x409)))
 (=> $x385 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x143 (and true false)))
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x393 (or false false false $x409 $x143)))
 (=> $x393 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x385 (or false false false $x409)))
 (=> $x385 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x143 (and true false)))
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x393 (or false false false $x409 $x143)))
 (=> $x393 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x385 (or false false false $x409)))
 (=> $x385 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x164 (and false false)))
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x151 (or false false false $x409 $x164)))
 (=> $x151 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x385 (or false false false $x409)))
 (=> $x385 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x164 (and false false)))
 (let (($x409 (or (and rf_0_4 false))))
 (let (($x151 (or false false false $x409 $x164)))
 (=> $x151 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x412 (= co_0 (_ bv0 1))))
 (=> $x412 (= (_ bv0 32) final_x))))
(assert
 (let (($x214 (= co_1 (_ bv1 2))))
 (=> $x214 (= (_ bv0 32) final_y))))
(assert
 (let (($x59 (= co_3 (_ bv1 2))))
(=> $x59 (= (_ bv1 32) final_y))))
(check-sat)
