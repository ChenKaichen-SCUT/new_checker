; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_8_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_8 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_8) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_1 co_6) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 (=> rf_8_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_8_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_6_4))
(assert
 (let (($x1235 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x1235)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 (=> rf_8_7 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_7 rf_3_7 rf_8_7))
(assert
 (let (($x1084 (bvult co_0 co_3)))
 (let (($x1467 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (not (and $x1467 $x1084)))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (not (and $x271 false))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (not (and $x271 false))))
(assert
 (let (($x379 (bvult co_8 co_3)))
 (let (($x1327 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (not (and $x1327 $x379)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x172 (bvult co_1 co_6)))
 (let (($x805 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x805 $x172)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x1425 (bvult co_0 co_8)))
 (let (($x1604 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (not (and $x1604 $x1425)))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (not (and $x1474 false))))
(assert
 (let (($x1380 (bvult co_3 co_8)))
 (let (($x1009 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (not (and $x1009 $x1380)))))
(assert
 (bvult topo_U_0 (_ bv9 4)))
(assert
 (bvult topo_U_1 (_ bv9 4)))
(assert
 (bvult topo_U_2 (_ bv9 4)))
(assert
 (bvult topo_U_3 (_ bv9 4)))
(assert
 (bvult topo_U_4 (_ bv9 4)))
(assert
 (bvult topo_U_5 (_ bv9 4)))
(assert
 (bvult topo_U_6 (_ bv9 4)))
(assert
 (bvult topo_U_7 (_ bv9 4)))
(assert
 (bvult topo_U_8 (_ bv9 4)))
(assert
 (bvult topo_T_0 (_ bv9 4)))
(assert
 (bvult topo_T_1 (_ bv9 4)))
(assert
 (bvult topo_T_2 (_ bv9 4)))
(assert
 (bvult topo_T_3 (_ bv9 4)))
(assert
 (bvult topo_T_4 (_ bv9 4)))
(assert
 (bvult topo_T_5 (_ bv9 4)))
(assert
 (bvult topo_T_6 (_ bv9 4)))
(assert
 (bvult topo_T_7 (_ bv9 4)))
(assert
 (bvult topo_T_8 (_ bv9 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false (bvult co_0 co_8) or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1467 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x1467) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1467 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x1467 $x1400) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x480 (or false false false $x271 $x1400)))
 (=> $x480 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x882 (and false false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (=> (or false false false $x271 $x882) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1814 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_8_2 (bvult co_8 co_3)))))
 (=> (or true false false $x1814) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x882 (and false false)))
 (let (($x1814 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_8_2 (bvult co_8 co_3)))))
 (=> (or true false false $x1814 $x882) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x882 (and false false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (=> (or true false false $x271 $x882) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x480 (or false false false $x271 $x1400)))
 (=> $x480 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x480 (or false false false $x271 $x1400)))
 (=> $x480 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1191 (or false false false $x271)))
 (=> $x1191 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x271 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x480 (or false false false $x271 $x1400)))
 (=> $x480 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1327 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x1327) (bvult topo_U_2 topo_U_8))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1327 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x1327 $x1400) (bvult topo_T_2 topo_T_8)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x882 (and false false)))
 (let (($x1741 (or true false false or $x882)))
 (=> $x1741 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (=> (or false false (bvult co_3 co_8) or) (bvult topo_U_3 topo_U_8)))
(assert
 (=> (or false false (bvult co_3 co_8) or (and true false)) (bvult topo_T_3 topo_T_8)))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x851 (or false false false $x1290 $x1400)))
 (=> $x851 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x279 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x279) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1400 (and true false)))
 (let (($x279 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x279 $x1400) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x356 (or false false false $x1290 $x882)))
 (=> $x356 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x356 (or false false false $x1290 $x882)))
 (=> $x356 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x356 (or false false false $x1290 $x882)))
 (=> $x356 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x851 (or false false false $x1290 $x1400)))
 (=> $x851 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1275 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1275) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1275 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1275 $x1400) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x851 (or false false false $x1290 $x1400)))
 (=> $x851 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x178 (or false false false $x1290)))
 (=> $x178 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1290 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x851 (or false false false $x1290 $x1400)))
 (=> $x851 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1974 (or false false false $x766 $x1400)))
 (=> $x1974 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x805 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x805) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1400 (and true false)))
 (let (($x805 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x805 $x1400) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1974 (or false false false $x766 $x1400)))
 (=> $x1974 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1974 (or false false false $x766 $x1400)))
 (=> $x1974 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1974 (or false false false $x766 $x1400)))
 (=> $x1974 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x882 (and false false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x766 $x882) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x156 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x156) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x882 (and false false)))
 (let (($x156 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x156 $x882) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x882 (and false false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1485 (or true false false $x766 $x882)))
 (=> $x1485 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1767 (or false false false $x766)))
 (=> $x1767 (bvult topo_U_5 topo_U_8)))))
(assert
 (let (($x882 (and false false)))
 (let (($x766 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1485 (or true false false $x766 $x882)))
 (=> $x1485 (bvult topo_T_5 topo_T_8))))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x882 (and false false)))
 (let (($x1741 (or true false false or $x882)))
 (=> $x1741 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_6 topo_U_8))))
(assert
 (let (($x882 (and false false)))
 (let (($x1741 (or true false false or $x882)))
 (=> $x1741 (bvult topo_T_6 topo_T_8)))))
(assert
 (let (($x1604 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1604) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1604 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1604 $x1400) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x1402 (or false false false $x1474 $x1400)))
 (=> $x1402 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x1402 (or false false false $x1474 $x1400)))
 (=> $x1402 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1009 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (=> (or false false false $x1009) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1009 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (=> (or false false false $x1009 $x1400) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x1402 (or false false false $x1474 $x1400)))
 (=> $x1402 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x402 (or false false false $x1474 $x882)))
 (=> $x402 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x402 (or false false false $x1474 $x882)))
 (=> $x402 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x500 (or false false false $x1474)))
 (=> $x500 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x882 (and false false)))
 (let (($x1474 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x402 (or false false false $x1474 $x882)))
 (=> $x402 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x640 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_3_7 (bvult co_3 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x640) (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x882 (and false false)))
 (let (($x640 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_3_7 (bvult co_3 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x640 $x882) (bvult topo_T_7 topo_T_8)))))
(assert
 (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert
 (=> (or false false (bvult co_8 co_0) or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_8 topo_T_1)))))
(assert
 (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert
 (=> (or false false (bvult co_8 co_3) or) (bvult topo_U_8 topo_U_3)))
(assert
 (=> (or false false (bvult co_8 co_3) or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_8 topo_U_4))))
(assert
 (let (($x1400 (and true false)))
 (let (($x1646 (or false false false or $x1400)))
 (=> $x1646 (bvult topo_T_8 topo_T_4)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x882 (and false false)))
 (let (($x71 (or false false false or $x882)))
 (=> $x71 (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x246 (or false false false or)))
 (=> $x246 (bvult topo_U_8 topo_U_6))))
(assert
 (let (($x882 (and false false)))
 (let (($x71 (or false false false or $x882)))
 (=> $x71 (bvult topo_T_8 topo_T_6)))))
(assert
 (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert
 (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert
 (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert
 (=> (or false false (bvult co_8 co_8) or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x811 (= co_3 (_ bv2 2))))
 (=> $x811 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1704 (= co_8 (_ bv2 2))))
 (=> $x1704 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1078 (= co_6 (_ bv1 2))))
 (=> $x1078 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x367 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1254 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x565 (and (distinct rf_8_7 false) true)))
 (let (($x538 (and (distinct rf_3_7 true) true)))
 (let (($x1527 (and (distinct rf_0_7 false) true)))
 (let (($x106 (and (distinct rf_6_5 false) true)))
 (let (($x784 (and (distinct rf_1_5 true) true)))
 (let (($x919 (and (distinct rf_6_4 true) true)))
 (let (($x1182 (and (distinct rf_1_4 false) true)))
 (let (($x1471 (and (distinct rf_8_2 false) true)))
 (let (($x16 (and (distinct rf_3_2 false) true)))
 (let (($x803 (and (distinct rf_0_2 true) true)))
 (let (($x159 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1168 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x260 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1429 (and (distinct input_b false) true)))
 (or $x1429 $x260 $x1168 $x1710 $x159 $x803 $x16 $x1471 $x1182 $x919 $x784 $x106 $x1527 $x538 $x565 $x1497 $x1254 $x367 $x2439 $x154))))))))))))))))))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x2259 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x2262 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x565 (and (distinct rf_8_7 false) true)))
 (let (($x2265 (and (distinct rf_3_7 false) true)))
 (let (($x2268 (and (distinct rf_0_7 true) true)))
 (let (($x106 (and (distinct rf_6_5 false) true)))
 (let (($x784 (and (distinct rf_1_5 true) true)))
 (let (($x919 (and (distinct rf_6_4 true) true)))
 (let (($x1182 (and (distinct rf_1_4 false) true)))
 (let (($x2271 (and (distinct rf_8_2 true) true)))
 (let (($x16 (and (distinct rf_3_2 false) true)))
 (let (($x2274 (and (distinct rf_0_2 false) true)))
 (let (($x2277 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1168 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2280 (and (distinct (_ bv2 32) read_t0_a) true)))
 (let (($x1429 (and (distinct input_b false) true)))
 (or $x1429 $x2280 $x1168 $x1710 $x2277 $x2274 $x16 $x2271 $x1182 $x919 $x784 $x106 $x2268 $x2265 $x565 $x1497 $x2262 $x2259 $x2439 $x154))))))))))))))))))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x2259 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x2262 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x565 (and (distinct rf_8_7 false) true)))
 (let (($x2265 (and (distinct rf_3_7 false) true)))
 (let (($x2268 (and (distinct rf_0_7 true) true)))
 (let (($x106 (and (distinct rf_6_5 false) true)))
 (let (($x784 (and (distinct rf_1_5 true) true)))
 (let (($x919 (and (distinct rf_6_4 true) true)))
 (let (($x1182 (and (distinct rf_1_4 false) true)))
 (let (($x2271 (and (distinct rf_8_2 true) true)))
 (let (($x16 (and (distinct rf_3_2 false) true)))
 (let (($x2274 (and (distinct rf_0_2 false) true)))
 (let (($x2277 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1168 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2280 (and (distinct (_ bv2 32) read_t0_a) true)))
 (let (($x2241 (and (distinct input_b true) true)))
 (or $x2241 $x2280 $x1168 $x1710 $x2277 $x2274 $x16 $x2271 $x1182 $x919 $x784 $x106 $x2268 $x2265 $x565 $x1497 $x2262 $x2259 $x2439 $x154))))))))))))))))))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x367 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1254 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x565 (and (distinct rf_8_7 false) true)))
 (let (($x538 (and (distinct rf_3_7 true) true)))
 (let (($x1527 (and (distinct rf_0_7 false) true)))
 (let (($x106 (and (distinct rf_6_5 false) true)))
 (let (($x784 (and (distinct rf_1_5 true) true)))
 (let (($x919 (and (distinct rf_6_4 true) true)))
 (let (($x1182 (and (distinct rf_1_4 false) true)))
 (let (($x1471 (and (distinct rf_8_2 false) true)))
 (let (($x16 (and (distinct rf_3_2 false) true)))
 (let (($x803 (and (distinct rf_0_2 true) true)))
 (let (($x159 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1168 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x260 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x2241 (and (distinct input_b true) true)))
 (or $x2241 $x260 $x1168 $x1710 $x159 $x803 $x16 $x1471 $x1182 $x919 $x784 $x106 $x1527 $x538 $x565 $x1497 $x1254 $x367 $x2439 $x154))))))))))))))))))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x367 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1254 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x565 (and (distinct rf_8_7 false) true)))
 (let (($x538 (and (distinct rf_3_7 true) true)))
 (let (($x1527 (and (distinct rf_0_7 false) true)))
 (let (($x106 (and (distinct rf_6_5 false) true)))
 (let (($x784 (and (distinct rf_1_5 true) true)))
 (let (($x2291 (and (distinct rf_6_4 false) true)))
 (let (($x2377 (and (distinct rf_1_4 true) true)))
 (let (($x1471 (and (distinct rf_8_2 false) true)))
 (let (($x16 (and (distinct rf_3_2 false) true)))
 (let (($x803 (and (distinct rf_0_2 true) true)))
 (let (($x159 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x2245 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x260 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1429 (and (distinct input_b false) true)))
 (or $x1429 $x260 $x2245 $x1710 $x159 $x803 $x16 $x1471 $x2377 $x2291 $x784 $x106 $x1527 $x538 $x565 $x1497 $x1254 $x367 $x2439 $x154))))))))))))))))))))))
(assert
 (let (($x154 (and (distinct (_ bv1 2) co_6) true)))
(let (($x2439 (and (distinct (_ bv0 2) co_1) true)))
(let (($x367 (and (distinct (_ bv2 2) co_8) true)))
(let (($x1254 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1497 (and (distinct (_ bv0 2) co_0) true)))
(let (($x565 (and (distinct rf_8_7 false) true)))
(let (($x538 (and (distinct rf_3_7 true) true)))
(let (($x1527 (and (distinct rf_0_7 false) true)))
(let (($x106 (and (distinct rf_6_5 false) true)))
(let (($x784 (and (distinct rf_1_5 true) true)))
(let (($x2291 (and (distinct rf_6_4 false) true)))
(let (($x2377 (and (distinct rf_1_4 true) true)))
(let (($x1471 (and (distinct rf_8_2 false) true)))
(let (($x16 (and (distinct rf_3_2 false) true)))
(let (($x803 (and (distinct rf_0_2 true) true)))
(let (($x159 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x1710 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x2245 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x260 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x2241 (and (distinct input_b true) true)))
(or $x2241 $x260 $x2245 $x1710 $x159 $x803 $x16 $x1471 $x2377 $x2291 $x784 $x106 $x1527 $x538 $x565 $x1497 $x1254 $x367 $x2439 $x154))))))))))))))))))))))
(check-sat)
