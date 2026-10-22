; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun topo_U_0 () (_ BitVec 2))
(declare-fun topo_U_1 () (_ BitVec 2))
(declare-fun topo_T_0 () (_ BitVec 2))
(declare-fun topo_T_1 () (_ BitVec 2))
(declare-fun final_x () (_ BitVec 32))
(declare-fun input_n () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (and (distinct co_0 co_1) true))
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
 (=> (or false false (bvult co_0 co_1) or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false (bvult co_0 co_1) or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_1 co_0) or) (bvult topo_U_1 topo_U_0)))
(assert
 (=> (or false false (bvult co_1 co_0) or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x115 (= co_0 (_ bv1 2))))
 (=> $x115 (= (_ bv0 32) final_x))))
(assert
 (let (($x122 (= final_x input_n)))
(let (($x121 (= co_1 (_ bv1 2))))
(=> $x121 $x122))))
(check-sat)
