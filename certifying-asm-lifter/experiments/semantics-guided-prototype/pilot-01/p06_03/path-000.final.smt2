; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
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
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_3_6))
(assert
 (let (($x251 (bvult co_0 co_3)))
 (let (($x140 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x140 $x251)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
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
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x140 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x140) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x670 (and true false)))
 (let (($x140 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x140 $x670) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x601 (or false false false $x1098)))
 (=> $x601 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1371 (or false false false $x1098 $x670)))
 (=> $x1371 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x601 (or false false false $x1098)))
 (=> $x601 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1098 $x1634) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x363 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x363) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1634 (and false false)))
 (let (($x363 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x363 $x1634) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x601 (or false false false $x1098)))
 (=> $x601 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x1098 $x1634) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x601 (or false false false $x1098)))
 (=> $x601 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1371 (or false false false $x1098 $x670)))
 (=> $x1371 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x601 (or false false false $x1098)))
 (=> $x601 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1098 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1371 (or false false false $x1098 $x670)))
 (=> $x1371 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x769 (or false false false $x672)))
 (=> $x769 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x670 (and true false)))
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1357 (or false false false $x672 $x670)))
 (=> $x1357 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1227 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1227) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x670 (and true false)))
 (let (($x1227 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1227 $x670) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x769 (or false false false $x672)))
 (=> $x769 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x571 (or false false false $x672 $x1634)))
 (=> $x571 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x769 (or false false false $x672)))
 (=> $x769 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x571 (or false false false $x672 $x1634)))
 (=> $x571 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x769 (or false false false $x672)))
 (=> $x769 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x571 (or false false false $x672 $x1634)))
 (=> $x571 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x870 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x870) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x670 (and true false)))
 (let (($x870 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x870 $x670) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x769 (or false false false $x672)))
 (=> $x769 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x670 (and true false)))
 (let (($x672 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1357 (or false false false $x672 $x670)))
 (=> $x1357 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x670 (and true false)))
 (let (($x1172 (or false false false or $x670)))
 (=> $x1172 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x783 (or false false false or)))
 (=> $x783 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x1354 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x1354) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x670 (and true false)))
 (let (($x1354 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x1354 $x670) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1599 (or false false false $x1712)))
 (=> $x1599 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1193 (or false false false $x1712 $x670)))
 (=> $x1193 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1599 (or false false false $x1712)))
 (=> $x1599 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1193 (or false false false $x1712 $x670)))
 (=> $x1193 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1181 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x1181) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x670 (and true false)))
 (let (($x1181 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x1181 $x670) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1599 (or false false false $x1712)))
 (=> $x1599 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x670 (and true false)))
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1193 (or false false false $x1712 $x670)))
 (=> $x1193 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1599 (or false false false $x1712)))
 (=> $x1599 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1298 (or false false false $x1712 $x1634)))
 (=> $x1298 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1599 (or false false false $x1712)))
 (=> $x1599 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1634 (and false false)))
 (let (($x1712 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x1298 (or false false false $x1712 $x1634)))
 (=> $x1298 (bvult topo_T_6 topo_T_6))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x101 (= co_3 (_ bv1 2))))
 (=> $x101 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1570 (= co_5 (_ bv1 2))))
 (=> $x1570 (= (_ bv1 32) final_y))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1435 (and (distinct rf_3_6 false) true)))
 (let (($x420 (and (distinct rf_0_6 true) true)))
 (let (($x1019 (and (distinct rf_5_4 true) true)))
 (let (($x677 (and (distinct rf_1_4 false) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x1141 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1562 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1589 (and (distinct input_b false) true)))
 (or $x1589 $x747 $x1562 $x1141 $x1555 $x587 $x677 $x1019 $x420 $x1435 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1435 (and (distinct rf_3_6 false) true)))
 (let (($x420 (and (distinct rf_0_6 true) true)))
 (let (($x1844 (and (distinct rf_5_4 false) true)))
 (let (($x476 (and (distinct rf_1_4 true) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x1141 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x466 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1589 (and (distinct input_b false) true)))
 (or $x1589 $x747 $x466 $x1141 $x1555 $x587 $x476 $x1844 $x420 $x1435 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1435 (and (distinct rf_3_6 false) true)))
 (let (($x420 (and (distinct rf_0_6 true) true)))
 (let (($x1844 (and (distinct rf_5_4 false) true)))
 (let (($x476 (and (distinct rf_1_4 true) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x1141 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x466 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1919 (and (distinct input_b true) true)))
 (or $x1919 $x747 $x466 $x1141 $x1555 $x587 $x476 $x1844 $x420 $x1435 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1435 (and (distinct rf_3_6 false) true)))
 (let (($x420 (and (distinct rf_0_6 true) true)))
 (let (($x1019 (and (distinct rf_5_4 true) true)))
 (let (($x677 (and (distinct rf_1_4 false) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x1141 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1562 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1919 (and (distinct input_b true) true)))
 (or $x1919 $x747 $x1562 $x1141 $x1555 $x587 $x677 $x1019 $x420 $x1435 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x958 (and (distinct rf_3_6 true) true)))
 (let (($x185 (and (distinct rf_0_6 false) true)))
 (let (($x1019 (and (distinct rf_5_4 true) true)))
 (let (($x677 (and (distinct rf_1_4 false) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1562 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1919 (and (distinct input_b true) true)))
 (or $x1919 $x747 $x1562 $x991 $x1555 $x587 $x677 $x1019 $x185 $x958 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x958 (and (distinct rf_3_6 true) true)))
 (let (($x185 (and (distinct rf_0_6 false) true)))
 (let (($x1844 (and (distinct rf_5_4 false) true)))
 (let (($x476 (and (distinct rf_1_4 true) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x466 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1919 (and (distinct input_b true) true)))
 (or $x1919 $x747 $x466 $x991 $x1555 $x587 $x476 $x1844 $x185 $x958 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x355 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x75 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x958 (and (distinct rf_3_6 true) true)))
 (let (($x185 (and (distinct rf_0_6 false) true)))
 (let (($x1844 (and (distinct rf_5_4 false) true)))
 (let (($x476 (and (distinct rf_1_4 true) true)))
 (let (($x587 (and (distinct rf_3_2 false) true)))
 (let (($x1555 (and (distinct rf_0_2 true) true)))
 (let (($x991 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x466 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1589 (and (distinct input_b false) true)))
 (or $x1589 $x747 $x466 $x991 $x1555 $x587 $x476 $x1844 $x185 $x958 $x75 $x1275 $x355 $x949))))))))))))))))
(assert
 (let (($x949 (and (distinct (_ bv1 2) co_5) true)))
(let (($x355 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1275 (and (distinct (_ bv1 2) co_3) true)))
(let (($x75 (and (distinct (_ bv0 2) co_0) true)))
(let (($x958 (and (distinct rf_3_6 true) true)))
(let (($x185 (and (distinct rf_0_6 false) true)))
(let (($x1019 (and (distinct rf_5_4 true) true)))
(let (($x677 (and (distinct rf_1_4 false) true)))
(let (($x587 (and (distinct rf_3_2 false) true)))
(let (($x1555 (and (distinct rf_0_2 true) true)))
(let (($x991 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x1562 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x747 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x1589 (and (distinct input_b false) true)))
(or $x1589 $x747 $x1562 $x991 $x1555 $x587 $x677 $x1019 $x185 $x958 $x75 $x1275 $x355 $x949))))))))))))))))
(check-sat)
