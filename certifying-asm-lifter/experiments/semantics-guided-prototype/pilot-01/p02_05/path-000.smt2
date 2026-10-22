; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
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
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_5) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 (=> rf_5_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_5_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (let (($x1091 (bvult co_0 co_3)))
 (let (($x179 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (not (and $x179 $x1091)))))
(assert
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (not (and $x671 false))))
(assert
 (let (($x485 (bvult co_5 co_3)))
 (let (($x839 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (not (and $x839 $x485)))))
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
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x179 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x179) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x648 (and true false)))
 (let (($x179 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x179 $x648) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x636 (or false false false $x671)))
 (=> $x636 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x648 (and true false)))
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x441 (or false false false $x671 $x648)))
 (=> $x441 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x636 (or false false false $x671)))
 (=> $x636 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x247 (and false false)))
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x671 $x247) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x533 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x533) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x247 (and false false)))
 (let (($x533 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x533 $x247) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x636 (or false false false $x671)))
 (=> $x636 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x648 (and true false)))
 (let (($x671 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x441 (or false false false $x671 $x648)))
 (=> $x441 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x839 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x839) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x648 (and true false)))
 (let (($x839 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x839 $x648) (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x654 (or false false false $x644)))
 (=> $x654 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x648 (and true false)))
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x545 (or false false false $x644 $x648)))
 (=> $x545 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x648 (and true false)))
 (let (($x284 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x284 $x648) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x654 (or false false false $x644)))
 (=> $x654 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x648 (and true false)))
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x545 (or false false false $x644 $x648)))
 (=> $x545 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x654 (or false false false $x644)))
 (=> $x654 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x648 (and true false)))
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x545 (or false false false $x644 $x648)))
 (=> $x545 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x654 (or false false false $x644)))
 (=> $x654 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x247 (and false false)))
 (let (($x644 (or (and rf_1_4 false))))
 (=> (or false false false $x644 $x247) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x644 (or (and rf_1_4 false))))
 (let (($x654 (or false false false $x644)))
 (=> $x654 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x247 (and false false)))
 (let (($x644 (or (and rf_1_4 false))))
 (=> (or true false false $x644 $x247) (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x648 (and true false)))
 (let (($x430 (or false false false or $x648)))
 (=> $x430 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (let (($x470 (or false false false or)))
 (=> $x470 (bvult topo_U_5 topo_U_4))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x80 (= co_0 (_ bv2 2))))
 (=> $x80 (= (_ bv0 32) final_x))))
(assert
 (let (($x62 (= co_3 (_ bv2 2))))
 (=> $x62 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x438 (= co_5 (_ bv2 2))))
 (=> $x438 (= (_ bv1 32) final_x))))
(assert
 (let (($x612 (= co_1 (_ bv0 1))))
(=> $x612 (= (_ bv0 32) final_y))))
(check-sat)
