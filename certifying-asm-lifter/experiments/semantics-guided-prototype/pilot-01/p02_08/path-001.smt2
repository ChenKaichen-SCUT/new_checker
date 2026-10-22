; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_5_2 () Bool)
(declare-fun rf_0_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (= input_b false))
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
 (=> rf_5_2 (= (bvadd read_t1_no (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_5_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_no)))
(assert
 (=> rf_3_4 (= (bvadd read_t0_a (_ bv1 32)) read_t1_no)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_4 rf_3_4 rf_5_4))
(assert
 (=> rf_1_6 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_1_6))
(assert
 (let (($x690 (bvult co_0 co_3)))
 (let (($x803 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (not (and $x803 $x690)))))
(assert
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (not (and $x184 false))))
(assert
 (let (($x288 (bvult co_5 co_3)))
 (let (($x545 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (not (and $x545 $x288)))))
(assert
 (let (($x1040 (bvult co_0 co_5)))
 (let (($x253 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_3_4 (bvult co_3 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (not (and $x253 $x1040)))))
(assert
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (not (and $x69 false))))
(assert
 (let (($x201 (bvult co_3 co_5)))
 (let (($x1008 (or (and rf_0_4 (bvult co_0 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (not (and $x1008 $x201)))))
(assert
 (bvult topo_U_0 (_ bv7 3)))
(assert
 (bvult topo_U_1 (_ bv7 3)))
(assert
 (bvult topo_U_2 (_ bv7 3)))
(assert
 (bvult topo_U_3 (_ bv7 3)))
(assert
 (bvult topo_U_4 (_ bv7 3)))
(assert
 (bvult topo_U_5 (_ bv7 3)))
(assert
 (bvult topo_U_6 (_ bv7 3)))
(assert
 (bvult topo_T_0 (_ bv7 3)))
(assert
 (bvult topo_T_1 (_ bv7 3)))
(assert
 (bvult topo_T_2 (_ bv7 3)))
(assert
 (bvult topo_T_3 (_ bv7 3)))
(assert
 (bvult topo_T_4 (_ bv7 3)))
(assert
 (bvult topo_T_5 (_ bv7 3)))
(assert
 (bvult topo_T_6 (_ bv7 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x803 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x803) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x416 (and true false)))
 (let (($x803 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x803 $x416) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x106 (or false false false $x184)))
 (=> $x106 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x416 (and true false)))
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x1092 (or false false false $x184 $x416)))
 (=> $x1092 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x106 (or false false false $x184)))
 (=> $x106 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x589 (and false false)))
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x184 $x589) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x808 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x808) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x589 (and false false)))
 (let (($x808 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x808 $x589) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x106 (or false false false $x184)))
 (=> $x106 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x416 (and true false)))
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x1092 (or false false false $x184 $x416)))
 (=> $x1092 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x545 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x545) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x416 (and true false)))
 (let (($x545 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x545 $x416) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x106 (or false false false $x184)))
 (=> $x106 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x416 (and true false)))
 (let (($x184 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x1092 (or false false false $x184 $x416)))
 (=> $x1092 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x253 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_3_4 (bvult co_3 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x253) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x416 (and true false)))
 (let (($x253 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_3_4 (bvult co_3 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x253 $x416) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x533 (or false false false $x69)))
 (=> $x533 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x416 (and true false)))
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x664 (or false false false $x69 $x416)))
 (=> $x664 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x533 (or false false false $x69)))
 (=> $x533 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x416 (and true false)))
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x664 (or false false false $x69 $x416)))
 (=> $x664 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1008 (or (and rf_0_4 (bvult co_0 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x1008) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x416 (and true false)))
 (let (($x1008 (or (and rf_0_4 (bvult co_0 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x1008 $x416) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x533 (or false false false $x69)))
 (=> $x533 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x589 (and false false)))
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or false false false $x69 $x589) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x285 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x285) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x589 (and false false)))
 (let (($x285 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x285 $x589) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x533 (or false false false $x69)))
 (=> $x533 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x589 (and false false)))
 (let (($x69 (or (and rf_0_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or true false false $x69 $x589) (bvult topo_T_4 topo_T_6)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x416 (and true false)))
 (let (($x195 (or false false false or $x416)))
 (=> $x195 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x327 (or false false false or)))
 (=> $x327 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x416 (and true false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x161 (or false false false $x1049 $x416)))
 (=> $x161 (bvult topo_T_6 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_6 (bvult co_1 co_1)))) (bvult topo_U_6 topo_U_1)))
(assert
 (let (($x416 (and true false)))
 (let (($x1137 (or (and rf_1_6 (bvult co_1 co_1)))))
 (=> (or false false false $x1137 $x416) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x416 (and true false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x161 (or false false false $x1049 $x416)))
 (=> $x161 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x416 (and true false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x161 (or false false false $x1049 $x416)))
 (=> $x161 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x589 (and false false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x1113 (or false false false $x1049 $x589)))
 (=> $x1113 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x589 (and false false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x1113 (or false false false $x1049 $x589)))
 (=> $x1113 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x315 (or false false false $x1049)))
 (=> $x315 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x589 (and false false)))
 (let (($x1049 (or (and rf_1_6 false))))
 (let (($x1113 (or false false false $x1049 $x589)))
 (=> $x1113 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x979 (= co_0 (_ bv2 2))))
 (=> $x979 (= (_ bv0 32) final_x))))
(assert
 (let (($x89 (= co_3 (_ bv2 2))))
 (=> $x89 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x992 (= co_5 (_ bv2 2))))
 (=> $x992 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (let (($x622 (= co_1 (_ bv0 1))))
(=> $x622 (= (_ bv0 32) final_y))))
(check-sat)
