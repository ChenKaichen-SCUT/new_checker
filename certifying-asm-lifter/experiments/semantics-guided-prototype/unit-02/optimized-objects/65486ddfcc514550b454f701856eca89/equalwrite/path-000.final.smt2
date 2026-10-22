; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun topo_U_0 () (_ BitVec 2))
(declare-fun topo_U_1 () (_ BitVec 2))
(declare-fun topo_U_2 () (_ BitVec 2))
(declare-fun topo_T_0 () (_ BitVec 2))
(declare-fun topo_T_1 () (_ BitVec 2))
(declare-fun topo_T_2 () (_ BitVec 2))
(declare-fun final_x () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (and (distinct co_0 co_1 co_2) true))
(assert
 (bvult topo_U_0 (_ bv3 2)))
(assert
 (bvult topo_U_1 (_ bv3 2)))
(assert
 (bvult topo_U_2 (_ bv3 2)))
(assert
 (bvult topo_T_0 (_ bv3 2)))
(assert
 (bvult topo_T_1 (_ bv3 2)))
(assert
 (bvult topo_T_2 (_ bv3 2)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (=> (or false false (bvult co_0 co_1) or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false (bvult co_0 co_1) or (and true false)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_1 co_0) or) (bvult topo_U_1 topo_U_0)))
(assert
 (=> (or false false (bvult co_1 co_0) or (and true false)) (bvult topo_T_1 topo_T_0)))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (=> (or false false (bvult co_1 co_2) or) (bvult topo_U_1 topo_U_2)))
(assert
 (=> (or false false (bvult co_1 co_2) or (and true false)) (bvult topo_T_1 topo_T_2)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (=> (or false false (bvult co_2 co_1) or) (bvult topo_U_2 topo_U_1)))
(assert
 (=> (or false false (bvult co_2 co_1) or (and true false)) (bvult topo_T_2 topo_T_1)))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x236 (= (_ bv1 32) final_x)))
 (let (($x235 (= co_1 (_ bv2 2))))
 (=> $x235 $x236))))
(assert
 (let (($x236 (= (_ bv1 32) final_x)))
 (let (($x241 (= co_2 (_ bv2 2))))
 (=> $x241 $x236))))
(assert
 (let (($x250 (and (distinct (_ bv0 2) co_0) true)))
 (or $x250 (and (distinct (_ bv1 2) co_1) true) (and (distinct (_ bv2 2) co_2) true))))
(assert
 (let (($x250 (and (distinct (_ bv0 2) co_0) true)))
(or $x250 (and (distinct (_ bv2 2) co_1) true) (and (distinct (_ bv1 2) co_2) true))))
(check-sat)
