; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
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
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
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
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x987 (or false false false or)))
 (=> $x987 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x370 (and true false)))
 (let (($x187 (or false false false or $x370)))
 (=> $x187 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x23 (= co_2 (_ bv1 2))))
 (=> $x23 (= (_ bv1 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x712 (= co_3 (_ bv1 2))))
 (=> $x712 (= (_ bv1 32) final_y))))
(assert
 (let (($x802 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x476 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x401 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x103 (and (distinct (_ bv0 2) co_0) true)))
 (or (and (distinct input_b false) true) $x103 $x401 $x476 $x802))))))
(assert
 (let (($x802 (and (distinct (_ bv1 2) co_3) true)))
(let (($x476 (and (distinct (_ bv0 2) co_1) true)))
(let (($x401 (and (distinct (_ bv1 2) co_2) true)))
(let (($x103 (and (distinct (_ bv0 2) co_0) true)))
(or (and (distinct input_b true) true) $x103 $x401 $x476 $x802))))))
(check-sat)
