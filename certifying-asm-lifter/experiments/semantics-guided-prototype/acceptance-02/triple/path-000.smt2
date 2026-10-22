; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 3))
(declare-fun co_2 () (_ BitVec 3))
(declare-fun co_4 () (_ BitVec 3))
(declare-fun co_6 () (_ BitVec 3))
(declare-fun read_a () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_b () (_ BitVec 32))
(declare-fun rf_4_1 () Bool)
(declare-fun read_c () (_ BitVec 32))
(declare-fun rf_6_1 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_6_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_6_5 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv4 3)))
(assert
 (= co_0 (_ bv0 3)))
(assert
 (bvult co_2 (_ bv4 3)))
(assert
 (bvult co_4 (_ bv4 3)))
(assert
 (bvult co_6 (_ bv4 3)))
(assert
 (and (distinct co_0 co_2 co_4 co_6) true))
(assert
 (=> rf_0_1 (= (_ bv0 32) read_a)))
(assert
 (=> rf_2_1 (= (bvadd read_a (_ bv1 32)) read_a)))
(assert
 (=> rf_4_1 (= (bvadd read_b (_ bv1 32)) read_a)))
(assert
 (=> rf_6_1 (= (bvadd read_c (_ bv1 32)) read_a)))
(assert
 ((_ pbeq 1 1 1 1 1) rf_0_1 rf_2_1 rf_4_1 rf_6_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_b)))
(assert
 (=> rf_2_3 (= (bvadd read_a (_ bv1 32)) read_b)))
(assert
 (=> rf_4_3 (= (bvadd read_b (_ bv1 32)) read_b)))
(assert
 (=> rf_6_3 (= (bvadd read_c (_ bv1 32)) read_b)))
(assert
 ((_ pbeq 1 1 1 1 1) rf_0_3 rf_2_3 rf_4_3 rf_6_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_c)))
(assert
 (=> rf_2_5 (= (bvadd read_a (_ bv1 32)) read_c)))
(assert
 (=> rf_4_5 (= (bvadd read_b (_ bv1 32)) read_c)))
(assert
 (=> rf_6_5 (= (bvadd read_c (_ bv1 32)) read_c)))
(assert
 ((_ pbeq 1 1 1 1 1) rf_0_5 rf_2_5 rf_4_5 rf_6_5))
(assert
 (let (($x643 (bvult co_0 co_2)))
 (let (($x421 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)) (and rf_6_1 (bvult co_6 co_0)))))
 (not (and $x421 $x643)))))
(assert
 (let (($x812 (bvult co_4 co_2)))
 (let (($x541 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)) (and rf_6_1 (bvult co_6 co_4)))))
 (not (and $x541 $x812)))))
(assert
 (let (($x568 (bvult co_6 co_2)))
 (let (($x368 (or (and rf_0_1 (bvult co_0 co_6)) (and rf_2_1 (bvult co_2 co_6)) (and rf_4_1 (bvult co_4 co_6)) (and rf_6_1 (bvult co_6 co_6)))))
 (not (and $x368 $x568)))))
(assert
 (let (($x83 (bvult co_0 co_4)))
 (let (($x120 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)) (and rf_6_3 (bvult co_6 co_0)))))
 (not (and $x120 $x83)))))
(assert
 (let (($x1008 (bvult co_2 co_4)))
 (let (($x164 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)) (and rf_6_3 (bvult co_6 co_2)))))
 (not (and $x164 $x1008)))))
(assert
 (let (($x490 (bvult co_6 co_4)))
 (let (($x454 (or (and rf_0_3 (bvult co_0 co_6)) (and rf_2_3 (bvult co_2 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (not (and $x454 $x490)))))
(assert
 (let (($x288 (bvult co_0 co_6)))
 (let (($x373 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_4_5 (bvult co_4 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x373 $x288)))))
(assert
 (let (($x712 (bvult co_2 co_6)))
 (let (($x87 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_4_5 (bvult co_4 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (not (and $x87 $x712)))))
(assert
 (let (($x504 (bvult co_4 co_6)))
 (let (($x480 (or (and rf_0_5 (bvult co_0 co_4)) (and rf_2_5 (bvult co_2 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (not (and $x480 $x504)))))
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
 (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x421 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)) (and rf_6_1 (bvult co_6 co_0)))))
 (=> (or false false false $x421) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x500 (and true false)))
 (let (($x421 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)) (and rf_6_1 (bvult co_6 co_0)))))
 (=> (or false false false $x421 $x500) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (let (($x47 (or false false false $x848)))
 (=> $x47 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x410 (and false false)))
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (=> (or false false false $x848 $x410) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x341 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)) (and rf_6_1 (bvult co_6 co_2)))))
 (=> (or true false false $x341) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x410 (and false false)))
 (let (($x341 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)) (and rf_6_1 (bvult co_6 co_2)))))
 (=> (or true false false $x341 $x410) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (let (($x47 (or false false false $x848)))
 (=> $x47 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x500 (and true false)))
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (let (($x75 (or false false false $x848 $x500)))
 (=> $x75 (bvult topo_T_1 topo_T_3))))))
(assert
 (let (($x541 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)) (and rf_6_1 (bvult co_6 co_4)))))
 (=> (or false false false $x541) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x500 (and true false)))
 (let (($x541 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)) (and rf_6_1 (bvult co_6 co_4)))))
 (=> (or false false false $x541 $x500) (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (let (($x47 (or false false false $x848)))
 (=> $x47 (bvult topo_U_1 topo_U_5)))))
(assert
 (let (($x500 (and true false)))
 (let (($x848 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false) (and rf_6_1 false))))
 (let (($x75 (or false false false $x848 $x500)))
 (=> $x75 (bvult topo_T_1 topo_T_5))))))
(assert
 (let (($x368 (or (and rf_0_1 (bvult co_0 co_6)) (and rf_2_1 (bvult co_2 co_6)) (and rf_4_1 (bvult co_4 co_6)) (and rf_6_1 (bvult co_6 co_6)))))
 (=> (or false false false $x368) (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x500 (and true false)))
 (let (($x368 (or (and rf_0_1 (bvult co_0 co_6)) (and rf_2_1 (bvult co_2 co_6)) (and rf_4_1 (bvult co_4 co_6)) (and rf_6_1 (bvult co_6 co_6)))))
 (=> (or false false false $x368 $x500) (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert
 (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (=> (or false false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false (bvult co_2 co_4) or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false (bvult co_2 co_6) or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x120 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)) (and rf_6_3 (bvult co_6 co_0)))))
 (=> (or false false false $x120) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x500 (and true false)))
 (let (($x120 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)) (and rf_6_3 (bvult co_6 co_0)))))
 (=> (or false false false $x120 $x500) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x375 (or false false false $x869)))
 (=> $x375 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x500 (and true false)))
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x498 (or false false false $x869 $x500)))
 (=> $x498 (bvult topo_T_3 topo_T_1))))))
(assert
 (let (($x164 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)) (and rf_6_3 (bvult co_6 co_2)))))
 (=> (or false false false $x164) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x500 (and true false)))
 (let (($x164 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)) (and rf_6_3 (bvult co_6 co_2)))))
 (=> (or false false false $x164 $x500) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x375 (or false false false $x869)))
 (=> $x375 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x410 (and false false)))
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (=> (or false false false $x869 $x410) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x494 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x494) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x410 (and false false)))
 (let (($x494 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x494 $x410) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x375 (or false false false $x869)))
 (=> $x375 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x500 (and true false)))
 (let (($x869 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x498 (or false false false $x869 $x500)))
 (=> $x498 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x454 (or (and rf_0_3 (bvult co_0 co_6)) (and rf_2_3 (bvult co_2 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x454) (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x500 (and true false)))
 (let (($x454 (or (and rf_0_3 (bvult co_0 co_6)) (and rf_2_3 (bvult co_2 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x454 $x500) (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (=> (or false rf_4_1 false or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_4_1)) (bvult topo_T_4 topo_T_1)))
(assert
 (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false (bvult co_4 co_2) or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert
 (=> (or false false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert
 (=> (or false false (bvult co_4 co_6) or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x373 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_4_5 (bvult co_4 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x373) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x500 (and true false)))
 (let (($x373 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_4_5 (bvult co_4 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x373 $x500) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x102 (or false false false $x739)))
 (=> $x102 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x500 (and true false)))
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x165 (or false false false $x739 $x500)))
 (=> $x165 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x87 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_4_5 (bvult co_4 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x87) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x500 (and true false)))
 (let (($x87 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_4_5 (bvult co_4 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x87 $x500) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x102 (or false false false $x739)))
 (=> $x102 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x500 (and true false)))
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x165 (or false false false $x739 $x500)))
 (=> $x165 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x480 (or (and rf_0_5 (bvult co_0 co_4)) (and rf_2_5 (bvult co_2 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x480) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x500 (and true false)))
 (let (($x480 (or (and rf_0_5 (bvult co_0 co_4)) (and rf_2_5 (bvult co_2 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x480 $x500) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x102 (or false false false $x739)))
 (=> $x102 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x410 (and false false)))
 (let (($x739 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (=> (or false false false $x739 $x410) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x857 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x857) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x410 (and false false)))
 (let (($x857 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x857 $x410) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (=> (or false rf_6_1 false or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_6_1)) (bvult topo_T_6 topo_T_1)))
(assert
 (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false (bvult co_6 co_2) or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert
 (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false (bvult co_6 co_4) or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x972 (= co_0 (_ bv3 3))))
 (=> $x972 (= (_ bv0 32) final_x))))
(assert
 (let (($x975 (= co_2 (_ bv3 3))))
 (=> $x975 (= final_x (bvadd read_a (_ bv1 32))))))
(assert
 (let (($x979 (= co_4 (_ bv3 3))))
 (=> $x979 (= final_x (bvadd read_b (_ bv1 32))))))
(assert
 (let (($x993 (= co_6 (_ bv3 3))))
(=> $x993 (= final_x (bvadd read_c (_ bv1 32))))))
(check-sat)
