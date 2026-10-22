; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
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
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_7) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 (=> rf_7_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_7_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_6 rf_3_6 rf_7_6))
(assert
 (let (($x349 (bvult co_0 co_3)))
 (let (($x246 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (not (and $x246 $x349)))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (not (and $x1173 false))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (not (and $x1173 false))))
(assert
 (let (($x272 (bvult co_7 co_3)))
 (let (($x950 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (not (and $x950 $x272)))))
(assert
 (let (($x722 (bvult co_0 co_7)))
 (let (($x321 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x321 $x722)))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (not (and $x655 false))))
(assert
 (let (($x545 (bvult co_3 co_7)))
 (let (($x843 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (not (and $x843 $x545)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x202 (bvult co_1 co_5)))
 (let (($x774 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x774 $x202)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (bvult topo_U_0 (_ bv8 4)))
(assert
 (bvult topo_U_1 (_ bv8 4)))
(assert
 (bvult topo_U_2 (_ bv8 4)))
(assert
 (bvult topo_U_3 (_ bv8 4)))
(assert
 (bvult topo_U_4 (_ bv8 4)))
(assert
 (bvult topo_U_5 (_ bv8 4)))
(assert
 (bvult topo_U_6 (_ bv8 4)))
(assert
 (bvult topo_U_7 (_ bv8 4)))
(assert
 (bvult topo_T_0 (_ bv8 4)))
(assert
 (bvult topo_T_1 (_ bv8 4)))
(assert
 (bvult topo_T_2 (_ bv8 4)))
(assert
 (bvult topo_T_3 (_ bv8 4)))
(assert
 (bvult topo_T_4 (_ bv8 4)))
(assert
 (bvult topo_T_5 (_ bv8 4)))
(assert
 (bvult topo_T_6 (_ bv8 4)))
(assert
 (bvult topo_T_7 (_ bv8 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x246 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x246) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x988 (and true false)))
 (let (($x246 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x246 $x988) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x910 (or false false false $x1173)))
 (=> $x910 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1051 (or false false false $x1173 $x988)))
 (=> $x1051 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x910 (or false false false $x1173)))
 (=> $x910 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x112 (and false false)))
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (=> (or false false false $x1173 $x112) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x236 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x236) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x112 (and false false)))
 (let (($x236 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x236 $x112) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x910 (or false false false $x1173)))
 (=> $x910 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1051 (or false false false $x1173 $x988)))
 (=> $x1051 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x910 (or false false false $x1173)))
 (=> $x910 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1051 (or false false false $x1173 $x988)))
 (=> $x1051 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x910 (or false false false $x1173)))
 (=> $x910 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1173 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1051 (or false false false $x1173 $x988)))
 (=> $x1051 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x950 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x950) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x988 (and true false)))
 (let (($x950 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x950 $x988) (bvult topo_T_2 topo_T_7)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (=> (or false false (bvult co_3 co_7) or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false (bvult co_3 co_7) or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x336 (or false false false $x1095 $x988)))
 (=> $x336 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x774 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x774) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x988 (and true false)))
 (let (($x774 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x774 $x988) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x336 (or false false false $x1095 $x988)))
 (=> $x336 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x988 (and true false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x336 (or false false false $x1095 $x988)))
 (=> $x336 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x112 (and false false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x1095 $x112) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1015 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1015) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x112 (and false false)))
 (let (($x1015 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1015 $x112) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x112 (and false false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x41 (or true false false $x1095 $x112)))
 (=> $x41 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x239 (or false false false $x1095)))
 (=> $x239 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x112 (and false false)))
 (let (($x1095 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x41 (or true false false $x1095 $x112)))
 (=> $x41 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x112 (and false false)))
 (let (($x711 (or true false false or $x112)))
 (=> $x711 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x112 (and false false)))
 (let (($x711 (or true false false or $x112)))
 (=> $x711 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x321 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x321) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x988 (and true false)))
 (let (($x321 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x321 $x988) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x11 (or false false false $x655)))
 (=> $x11 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x988 (and true false)))
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x497 (or false false false $x655 $x988)))
 (=> $x497 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x11 (or false false false $x655)))
 (=> $x11 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x988 (and true false)))
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x497 (or false false false $x655 $x988)))
 (=> $x497 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x843 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x843) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x988 (and true false)))
 (let (($x843 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x843 $x988) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x11 (or false false false $x655)))
 (=> $x11 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x112 (and false false)))
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1161 (or false false false $x655 $x112)))
 (=> $x1161 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x11 (or false false false $x655)))
 (=> $x11 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x112 (and false false)))
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1161 (or false false false $x655 $x112)))
 (=> $x1161 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x11 (or false false false $x655)))
 (=> $x11 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x112 (and false false)))
 (let (($x655 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1161 (or false false false $x655 $x112)))
 (=> $x1161 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x439 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x439) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x112 (and false false)))
 (let (($x439 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x439 $x112) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x988 (and true false)))
 (let (($x429 (or false false false or $x988)))
 (=> $x429 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (=> (or false false (bvult co_7 co_3) or) (bvult topo_U_7 topo_U_3)))
(assert
 (=> (or false false (bvult co_7 co_3) or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x112 (and false false)))
 (let (($x785 (or false false false or $x112)))
 (=> $x785 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x112 (and false false)))
 (let (($x785 (or false false false or $x112)))
 (=> $x785 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x572 (= co_0 (_ bv2 2))))
 (=> $x572 (= (_ bv0 32) final_x))))
(assert
 (let (($x569 (= co_3 (_ bv2 2))))
 (=> $x569 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x611 (= co_7 (_ bv2 2))))
 (=> $x611 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (let (($x262 (= co_1 (_ bv1 2))))
 (=> $x262 (= (_ bv0 32) final_y))))
(assert
 (let (($x959 (= co_5 (_ bv1 2))))
(=> $x959 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
