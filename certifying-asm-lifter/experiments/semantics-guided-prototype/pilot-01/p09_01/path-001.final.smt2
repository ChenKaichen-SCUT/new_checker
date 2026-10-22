; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_5_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (let (($x694 (= (_ bv0 32) read_t0_a)))
 (= $x694 false)))
(assert
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_4 co_5) true))
(assert
 (let (($x694 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x694)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 (=> rf_5_3 (= (_ bv1 32) read_t0_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_5_3))
(assert
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (not (and $x783 false))))
(assert
 (let (($x496 (bvult co_1 co_4)))
 (let (($x2700 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (not (and $x2700 $x496)))))
(assert
 (let (($x832 (bvult co_5 co_4)))
 (let (($x416 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (not (and $x416 $x832)))))
(assert
 (bvult topo_U_0 (_ bv6 3)))
(assert
 (bvult topo_U_1 (_ bv6 3)))
(assert
 (bvult topo_U_2 (_ bv6 3)))
(assert
 (bvult topo_U_3 (_ bv6 3)))
(assert
 (bvult topo_U_4 (_ bv6 3)))
(assert
 (bvult topo_U_5 (_ bv6 3)))
(assert
 (bvult topo_T_0 (_ bv6 3)))
(assert
 (bvult topo_T_1 (_ bv6 3)))
(assert
 (bvult topo_T_2 (_ bv6 3)))
(assert
 (bvult topo_T_3 (_ bv6 3)))
(assert
 (bvult topo_T_4 (_ bv6 3)))
(assert
 (bvult topo_T_5 (_ bv6 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x2558 (and true false)))
 (let (($x2253 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x2253 $x2558) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x1773 (or false false false $x278)))
 (=> $x1773 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x2558 (and true false)))
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x420 (or false false false $x278 $x2558)))
 (=> $x420 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x1773 (or false false false $x278)))
 (=> $x1773 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x728 (and false false)))
 (let (($x278 (or (and rf_0_2 false))))
 (=> (or false false false $x278 $x728) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x1773 (or false false false $x278)))
 (=> $x1773 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x728 (and false false)))
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x2680 (or true false false $x278 $x728)))
 (=> $x2680 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x1773 (or false false false $x278)))
 (=> $x1773 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x728 (and false false)))
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x2680 (or true false false $x278 $x728)))
 (=> $x2680 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x1773 (or false false false $x278)))
 (=> $x1773 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2558 (and true false)))
 (let (($x278 (or (and rf_0_2 false))))
 (let (($x420 (or false false false $x278 $x2558)))
 (=> $x420 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1867 (or false false false $x783)))
 (=> $x1867 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x2558 (and true false)))
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (=> (or false false false $x783 $x2558) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x2700 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x2700) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2700 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x2700 $x2558) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1867 (or false false false $x783)))
 (=> $x1867 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x728 (and false false)))
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x2452 (or false false false $x783 $x728)))
 (=> $x2452 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1867 (or false false false $x783)))
 (=> $x1867 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x728 (and false false)))
 (let (($x783 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x2452 (or false false false $x783 $x728)))
 (=> $x2452 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1357 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x1357) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x728 (and false false)))
 (let (($x1357 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x1357 $x728) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x416 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x416) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x2558 (and true false)))
 (let (($x416 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x416 $x2558) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_4 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false (bvult co_4 co_5) or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x690 (or false false false or)))
 (=> $x690 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x2558 (and true false)))
 (let (($x2158 (or false false false or $x2558)))
 (=> $x2158 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false (bvult co_5 co_4) or (and true false)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x440 (= (_ bv0 32) final_x)))
 (let (($x1195 (= co_0 (_ bv0 1))))
 (=> $x1195 $x440))))
(assert
 (let (($x2112 (= co_1 (_ bv2 2))))
 (=> $x2112 (= (_ bv0 32) final_y))))
(assert
 (let (($x1096 (= co_4 (_ bv2 2))))
 (=> $x1096 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x287 (= co_5 (_ bv2 2))))
(=> $x287 (= (_ bv1 32) final_y))))
(check-sat)
