; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
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
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
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
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x112 (and true false)))
 (let (($x113 (or false false false or $x112)))
 (=> $x113 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x112 (and true false)))
 (let (($x113 (or false false false or $x112)))
 (=> $x113 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x112 (and true false)))
 (let (($x113 (or false false false or $x112)))
 (=> $x113 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x107 (or false false false or)))
 (=> $x107 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x112 (and true false)))
 (let (($x113 (or false false false or $x112)))
 (=> $x113 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x112 (and true false)))
 (let (($x182 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x182 $x112) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x194 (or (and rf_0_2 false))))
 (let (($x195 (or false false false $x194)))
 (=> $x195 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x112 (and true false)))
 (let (($x194 (or (and rf_0_2 false))))
 (let (($x200 (or false false false $x194 $x112)))
 (=> $x200 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x194 (or (and rf_0_2 false))))
 (let (($x195 (or false false false $x194)))
 (=> $x195 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x101 (and false false)))
 (let (($x194 (or (and rf_0_2 false))))
 (=> (or false false false $x194 $x101) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x194 (or (and rf_0_2 false))))
 (let (($x195 (or false false false $x194)))
 (=> $x195 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x112 (and true false)))
 (let (($x194 (or (and rf_0_2 false))))
 (let (($x200 (or false false false $x194 $x112)))
 (=> $x200 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x223 (or (and rf_1_3 false))))
 (let (($x224 (or false false false $x223)))
 (=> $x224 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x112 (and true false)))
 (let (($x223 (or (and rf_1_3 false))))
 (let (($x229 (or false false false $x223 $x112)))
 (=> $x229 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x112 (and true false)))
 (let (($x235 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x235 $x112) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x223 (or (and rf_1_3 false))))
 (let (($x224 (or false false false $x223)))
 (=> $x224 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x112 (and true false)))
 (let (($x223 (or (and rf_1_3 false))))
 (let (($x229 (or false false false $x223 $x112)))
 (=> $x229 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x223 (or (and rf_1_3 false))))
 (let (($x224 (or false false false $x223)))
 (=> $x224 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x101 (and false false)))
 (let (($x223 (or (and rf_1_3 false))))
 (=> (or false false false $x223 $x101) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x34 (= co_0 (_ bv0 1))))
 (=> $x34 (= (_ bv0 32) final_x))))
(assert
 (let (($x43 (= co_1 (_ bv0 1))))
(=> $x43 (= (_ bv0 32) final_y))))
(check-sat)
