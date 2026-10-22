; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun topo_U_0 () (_ BitVec 2))
(declare-fun topo_U_1 () (_ BitVec 2))
(declare-fun topo_T_0 () (_ BitVec 2))
(declare-fun topo_T_1 () (_ BitVec 2))
(declare-fun final_x () (_ BitVec 32))
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
 (let (($x475 (= (_ bv0 32) read_other)))
 (=> rf_0_1 $x475)))
(assert
 ((_ pbeq 1 1) rf_0_1))
(assert
 (bvult topo_U_0 (_ bv2 2)))
(assert
 (bvult topo_U_1 (_ bv2 2)))
(assert
 (bvult topo_T_0 (_ bv2 2)))
(assert
 (bvult topo_T_1 (_ bv2 2)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x14 (or false rf_0_1 false or)))
 (=> $x14 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1149 (or false false false or (and true rf_0_1))))
 (=> $x1149 (bvult topo_T_0 topo_T_1))))
(assert
 (=> (or false false false (or (and rf_0_1 (bvult co_0 co_0)))) (bvult topo_U_1 topo_U_0)))
(assert
 (let (($x677 (and true false)))
 (let (($x802 (or (and rf_0_1 (bvult co_0 co_0)))))
 (=> (or false false false $x802 $x677) (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false false (or (and rf_0_1 false))) (bvult topo_U_1 topo_U_1)))
(assert
 (let (($x528 (and false false)))
 (let (($x166 (and rf_0_1 false)))
 (let (($x738 (or $x166)))
 (=> (or false false false $x738 $x528) (bvult topo_T_1 topo_T_1))))))
(assert
 (let (($x122 (= (_ bv0 32) final_x)))
(let (($x669 (= co_0 (_ bv0 1))))
(=> $x669 $x122))))
(check-sat)
