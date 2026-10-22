; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_4_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_0 co_4) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_4_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_4_2))
(assert
 (let (($x430 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_3 $x430)))
(assert
 ((_ pbeq 1 1) rf_1_3))
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
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x337 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_4_2 (bvult co_4 co_0)))))
 (=> (or false false false $x337) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x108 (and true false)))
 (let (($x337 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_4_2 (bvult co_4 co_0)))))
 (=> (or false false false $x337 $x108) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x51 (or false false false $x198)))
 (=> $x51 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x108 (and true false)))
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x85 (or false false false $x198 $x108)))
 (=> $x85 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x51 (or false false false $x198)))
 (=> $x51 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x262 (and false false)))
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (=> (or false false false $x198 $x262) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x51 (or false false false $x198)))
 (=> $x51 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x108 (and true false)))
 (let (($x198 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x85 (or false false false $x198 $x108)))
 (=> $x85 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x519 (or (and rf_0_2 (bvult co_0 co_4)) (and rf_4_2 (bvult co_4 co_4)))))
 (=> (or false false false $x519) (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x108 (and true false)))
 (let (($x519 (or (and rf_0_2 (bvult co_0 co_4)) (and rf_4_2 (bvult co_4 co_4)))))
 (=> (or false false false $x519 $x108) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x292 (or false false false $x516)))
 (=> $x292 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x108 (and true false)))
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x176 (or false false false $x516 $x108)))
 (=> $x176 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x108 (and true false)))
 (let (($x397 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x397 $x108) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x292 (or false false false $x516)))
 (=> $x292 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x108 (and true false)))
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x176 (or false false false $x516 $x108)))
 (=> $x176 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x292 (or false false false $x516)))
 (=> $x292 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x262 (and false false)))
 (let (($x516 (or (and rf_1_3 false))))
 (=> (or false false false $x516 $x262) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x516 (or (and rf_1_3 false))))
 (let (($x292 (or false false false $x516)))
 (=> $x292 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x262 (and false false)))
 (let (($x516 (or (and rf_1_3 false))))
 (=> (or true false false $x516 $x262) (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x108 (and true false)))
 (let (($x121 (or false false false or $x108)))
 (=> $x121 (bvult topo_T_4 topo_T_1)))))
(assert
 (=> (or false rf_4_2 false or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_4_2)) (bvult topo_T_4 topo_T_2)))
(assert
 (let (($x323 (or false false false or)))
 (=> $x323 (bvult topo_U_4 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x282 (= (_ bv1 32) final_x)))
 (let (($x75 (= co_4 (_ bv1 2))))
 (=> $x75 $x282))))
(assert
 (let (($x73 (= (_ bv0 32) final_y)))
 (let (($x564 (= co_1 (_ bv0 1))))
 (=> $x564 $x73))))
(assert
 (let (($x424 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x11 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x166 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x364 (and (distinct rf_1_3 true) true)))
 (let (($x261 (and (distinct rf_4_2 true) true)))
 (let (($x511 (and (distinct rf_0_2 false) true)))
 (let (($x62 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x20 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x167 (and (distinct input_b false) true)))
 (or $x167 $x20 $x62 $x511 $x261 $x364 $x166 $x11 $x424)))))))))))
(assert
 (let (($x424 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x11 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x166 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x364 (and (distinct rf_1_3 true) true)))
 (let (($x739 (and (distinct rf_4_2 false) true)))
 (let (($x627 (and (distinct rf_0_2 true) true)))
 (let (($x62 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x708 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x167 (and (distinct input_b false) true)))
 (or $x167 $x708 $x62 $x627 $x739 $x364 $x166 $x11 $x424)))))))))))
(assert
 (let (($x424 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x11 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x166 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x364 (and (distinct rf_1_3 true) true)))
 (let (($x739 (and (distinct rf_4_2 false) true)))
 (let (($x627 (and (distinct rf_0_2 true) true)))
 (let (($x62 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x708 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x654 (and (distinct input_b true) true)))
 (or $x654 $x708 $x62 $x627 $x739 $x364 $x166 $x11 $x424)))))))))))
(assert
 (let (($x424 (and (distinct (_ bv0 1) co_1) true)))
(let (($x11 (and (distinct (_ bv1 2) co_4) true)))
(let (($x166 (and (distinct (_ bv0 2) co_0) true)))
(let (($x364 (and (distinct rf_1_3 true) true)))
(let (($x261 (and (distinct rf_4_2 true) true)))
(let (($x511 (and (distinct rf_0_2 false) true)))
(let (($x62 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x20 (and (distinct (_ bv1 32) read_t0_a) true)))
(let (($x654 (and (distinct input_b true) true)))
(or $x654 $x20 $x62 $x511 $x261 $x364 $x166 $x11 $x424)))))))))))
(check-sat)
