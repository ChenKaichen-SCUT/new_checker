; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
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
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x157 (and true false)))
 (let (($x90 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x90 $x157) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x91 (or (and rf_0_2 false))))
 (let (($x88 (or false false false $x91)))
 (=> $x88 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x157 (and true false)))
 (let (($x91 (or (and rf_0_2 false))))
 (let (($x73 (or false false false $x91 $x157)))
 (=> $x73 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x91 (or (and rf_0_2 false))))
 (let (($x88 (or false false false $x91)))
 (=> $x88 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x168 (and false false)))
 (let (($x91 (or (and rf_0_2 false))))
 (=> (or false false false $x91 $x168) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x91 (or (and rf_0_2 false))))
 (let (($x88 (or false false false $x91)))
 (=> $x88 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x157 (and true false)))
 (let (($x91 (or (and rf_0_2 false))))
 (let (($x73 (or false false false $x91 $x157)))
 (=> $x73 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x157 (and true false)))
 (let (($x148 (or false false false or $x157)))
 (=> $x148 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x101 (= co_0 (_ bv0 1))))
 (=> $x101 (= (_ bv0 32) final_x))))
(assert
 (let (($x217 (= co_1 (_ bv1 2))))
 (=> $x217 (= (_ bv0 32) final_y))))
(assert
 (let (($x31 (= co_3 (_ bv1 2))))
(=> $x31 (= (_ bv1 32) final_y))))
(check-sat)
