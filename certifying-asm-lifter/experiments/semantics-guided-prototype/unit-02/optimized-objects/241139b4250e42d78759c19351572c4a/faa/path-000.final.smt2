; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_a () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_b () (_ BitVec 32))
(declare-fun rf_4_1 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_4) true))
(assert
 (=> rf_0_1 (= (_ bv0 32) read_a)))
(assert
 (=> rf_2_1 (= (bvadd read_a (_ bv1 32)) read_a)))
(assert
 (=> rf_4_1 (= (bvadd read_b (_ bv1 32)) read_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_b)))
(assert
 (=> rf_2_3 (= (bvadd read_a (_ bv1 32)) read_b)))
(assert
 (=> rf_4_3 (= (bvadd read_b (_ bv1 32)) read_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x207 (bvult co_0 co_2)))
 (let (($x210 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x210 $x207)))))
(assert
 (let (($x302 (bvult co_4 co_2)))
 (let (($x301 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x301 $x302)))))
(assert
 (let (($x255 (bvult co_0 co_4)))
 (let (($x93 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x93 $x255)))))
(assert
 (let (($x377 (bvult co_2 co_4)))
 (let (($x17 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x17 $x377)))))
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
 (let (($x210 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x210) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x205 (and true false)))
 (let (($x210 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x210 $x205) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x336 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x296 (or false false false $x336)))
 (=> $x296 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x105 (and false false)))
 (let (($x336 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x336 $x105) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x396 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x396) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x105 (and false false)))
 (let (($x396 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x396 $x105) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x336 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x296 (or false false false $x336)))
 (=> $x296 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x205 (and true false)))
 (let (($x336 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x336 $x205) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x301 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x301) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x205 (and true false)))
 (let (($x301 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x301 $x205) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x93 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x93) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x205 (and true false)))
 (let (($x93 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x93 $x205) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x374 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x344 (or false false false $x374)))
 (=> $x344 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x205 (and true false)))
 (let (($x374 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x374 $x205) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x17 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x17) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x205 (and true false)))
 (let (($x17 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x17 $x205) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x374 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x344 (or false false false $x374)))
 (=> $x344 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x105 (and false false)))
 (let (($x374 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x374 $x105) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x406 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x406) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x105 (and false false)))
 (let (($x406 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x406 $x105) (bvult topo_T_3 topo_T_4)))))
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
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x531 (= co_2 (_ bv2 2))))
 (=> $x531 (= final_x (bvadd read_a (_ bv1 32))))))
(assert
 (let (($x537 (= co_4 (_ bv2 2))))
 (=> $x537 (= final_x (bvadd read_b (_ bv1 32))))))
(assert
 (let (($x567 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x556 (and (distinct rf_4_3 false) true)))
 (let (($x569 (and (distinct rf_2_1 false) true)))
 (or (and (distinct (_ bv1 32) read_a) true) (and (distinct (_ bv0 32) read_b) true) (and (distinct rf_0_1 false) true) $x569 (and (distinct rf_4_1 true) true) (and (distinct rf_0_3 true) true) (and (distinct rf_2_3 false) true) $x556 $x567 (and (distinct (_ bv2 2) co_2) true) (and (distinct (_ bv1 2) co_4) true))))))
(assert
 (let (($x567 (and (distinct (_ bv0 2) co_0) true)))
(let (($x556 (and (distinct rf_4_3 false) true)))
(let (($x569 (and (distinct rf_2_1 false) true)))
(or (and (distinct (_ bv0 32) read_a) true) (and (distinct (_ bv1 32) read_b) true) (and (distinct rf_0_1 true) true) $x569 (and (distinct rf_4_1 false) true) (and (distinct rf_0_3 false) true) (and (distinct rf_2_3 true) true) $x556 $x567 (and (distinct (_ bv1 2) co_2) true) (and (distinct (_ bv2 2) co_4) true))))))
(check-sat)
