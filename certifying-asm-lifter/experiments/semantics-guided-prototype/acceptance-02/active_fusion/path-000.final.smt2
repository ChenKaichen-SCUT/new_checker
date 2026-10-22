; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun read_fused () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (=> rf_0_1 (= (_ bv0 32) read_fused)))
(assert
 (=> rf_2_1 (= (bvadd read_fused (_ bv2 32)) read_fused)))
(assert
 ((_ pbeq 1 1 1) rf_0_1 rf_2_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_3 (= (bvadd read_fused (_ bv2 32)) read_other)))
(assert
 ((_ pbeq 1 1 1) rf_0_3 rf_2_3))
(assert
 (let (($x432 (bvult co_0 co_2)))
 (let (($x864 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (not (and $x864 $x432)))))
(assert
 (bvult topo_U_0 (_ bv4 3)))
(assert
 (bvult topo_U_1 (_ bv4 3)))
(assert
 (bvult topo_U_2 (_ bv4 3)))
(assert
 (bvult topo_U_3 (_ bv4 3)))
(assert
 (bvult topo_T_0 (_ bv4 3)))
(assert
 (bvult topo_T_1 (_ bv4 3)))
(assert
 (bvult topo_T_2 (_ bv4 3)))
(assert
 (bvult topo_T_3 (_ bv4 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x864 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x864) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x244 (and true false)))
 (let (($x864 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x864 $x244) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x11 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x71 (or false false false $x11)))
 (=> $x71 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x1194 (and false false)))
 (let (($x11 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x11 $x1194) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x303 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x303) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1194 (and false false)))
 (let (($x303 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x303 $x1194) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x11 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x71 (or false false false $x11)))
 (=> $x71 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x244 (and true false)))
 (let (($x11 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x11 $x244) (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert
 (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x494 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x494) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x244 (and true false)))
 (let (($x494 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x494 $x244) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x558 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x2249 (or false false false $x558)))
 (=> $x2249 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x244 (and true false)))
 (let (($x558 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x558 $x244) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x755 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x755) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x244 (and true false)))
 (let (($x755 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x755 $x244) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x558 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x2249 (or false false false $x558)))
 (=> $x2249 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1194 (and false false)))
 (let (($x558 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x558 $x1194) (bvult topo_T_3 topo_T_3)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x897 (= co_2 (_ bv1 2))))
 (=> $x897 (= final_x (bvadd read_fused (_ bv2 32))))))
(assert
 (let (($x1193 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x151 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x499 (and (distinct rf_2_1 false) true)))
 (let (($x451 (and (distinct rf_0_1 true) true)))
 (let (($x210 (and (distinct (_ bv0 32) read_fused) true)))
 (or $x210 (and (distinct (_ bv0 32) read_other) true) $x451 $x499 (and (distinct rf_0_3 true) true) (and (distinct rf_2_3 false) true) $x151 $x1193)))))))
(assert
 (let (($x1193 (and (distinct (_ bv1 2) co_2) true)))
(let (($x151 (and (distinct (_ bv0 2) co_0) true)))
(let (($x499 (and (distinct rf_2_1 false) true)))
(let (($x451 (and (distinct rf_0_1 true) true)))
(let (($x210 (and (distinct (_ bv0 32) read_fused) true)))
(or $x210 (and (distinct (_ bv2 32) read_other) true) $x451 $x499 (and (distinct rf_0_3 false) true) (and (distinct rf_2_3 true) true) $x151 $x1193)))))))
(check-sat)
