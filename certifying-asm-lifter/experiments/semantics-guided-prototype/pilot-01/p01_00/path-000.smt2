; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
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
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_3))
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
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x804 (or false false false or)))
 (=> $x804 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x800 (and true false)))
 (let (($x325 (or false false false or $x800)))
 (=> $x325 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x292 (or (and rf_1_3 false))))
 (let (($x199 (or false false false $x292)))
 (=> $x199 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x800 (and true false)))
 (let (($x292 (or (and rf_1_3 false))))
 (let (($x612 (or false false false $x292 $x800)))
 (=> $x612 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x800 (and true false)))
 (let (($x160 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x160 $x800) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x292 (or (and rf_1_3 false))))
 (let (($x199 (or false false false $x292)))
 (=> $x199 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x800 (and true false)))
 (let (($x292 (or (and rf_1_3 false))))
 (let (($x612 (or false false false $x292 $x800)))
 (=> $x612 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x292 (or (and rf_1_3 false))))
 (let (($x199 (or false false false $x292)))
 (=> $x199 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x499 (and false false)))
 (let (($x292 (or (and rf_1_3 false))))
 (=> (or false false false $x292 $x499) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1099 (= co_0 (_ bv1 2))))
 (=> $x1099 (= (_ bv0 32) final_x))))
(assert
 (let (($x161 (= co_2 (_ bv1 2))))
 (=> $x161 (= (_ bv1 32) final_x))))
(assert
 (let (($x1140 (= co_1 (_ bv0 1))))
(=> $x1140 (= (_ bv0 32) final_y))))
(check-sat)
