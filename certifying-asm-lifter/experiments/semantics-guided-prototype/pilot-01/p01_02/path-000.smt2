; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x1067 (bvult co_1 co_4)))
 (let (($x1078 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x1078 $x1067)))))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
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
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x25 (or false false false $x352)))
 (=> $x25 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x438 (and true false)))
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x541 (or false false false $x352 $x438)))
 (=> $x541 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1078 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1078) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x438 (and true false)))
 (let (($x1078 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1078 $x438) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x25 (or false false false $x352)))
 (=> $x25 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x438 (and true false)))
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x541 (or false false false $x352 $x438)))
 (=> $x541 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x25 (or false false false $x352)))
 (=> $x25 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x653 (and false false)))
 (let (($x352 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x352 $x653) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x752 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x752) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x653 (and false false)))
 (let (($x752 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x752 $x653) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x822 (or false false false or)))
 (=> $x822 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x438 (and true false)))
 (let (($x140 (or false false false or $x438)))
 (=> $x140 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x693 (= co_0 (_ bv1 2))))
 (=> $x693 (= (_ bv0 32) final_x))))
(assert
 (let (($x409 (= co_2 (_ bv1 2))))
 (=> $x409 (= (_ bv1 32) final_x))))
(assert
 (let (($x536 (= co_1 (_ bv1 2))))
 (=> $x536 (= (_ bv0 32) final_y))))
(assert
 (let (($x134 (= co_4 (_ bv1 2))))
(=> $x134 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
