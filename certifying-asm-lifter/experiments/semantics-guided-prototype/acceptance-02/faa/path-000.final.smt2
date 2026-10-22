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
 (let (($x735 (bvult co_0 co_2)))
 (let (($x269 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x269 $x735)))))
(assert
 (let (($x579 (bvult co_4 co_2)))
 (let (($x121 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x121 $x579)))))
(assert
 (let (($x305 (bvult co_0 co_4)))
 (let (($x426 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x426 $x305)))))
(assert
 (let (($x397 (bvult co_2 co_4)))
 (let (($x512 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x512 $x397)))))
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
 (let (($x269 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x269) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x374 (and true false)))
 (let (($x269 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x269 $x374) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x391 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x101 (or false false false $x391)))
 (=> $x101 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x138 (and false false)))
 (let (($x391 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x391 $x138) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x13 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x13) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x138 (and false false)))
 (let (($x13 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x13 $x138) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x391 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x101 (or false false false $x391)))
 (=> $x101 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x374 (and true false)))
 (let (($x391 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x391 $x374) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x121 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x121) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x374 (and true false)))
 (let (($x121 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x121 $x374) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x426 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x426) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x374 (and true false)))
 (let (($x426 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x426 $x374) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x257 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x619 (or false false false $x257)))
 (=> $x619 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x374 (and true false)))
 (let (($x257 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x257 $x374) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x512 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x512) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x374 (and true false)))
 (let (($x512 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x512 $x374) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x257 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x619 (or false false false $x257)))
 (=> $x619 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x138 (and false false)))
 (let (($x257 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x257 $x138) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x334 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x334) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x138 (and false false)))
 (let (($x334 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x334 $x138) (bvult topo_T_3 topo_T_4)))))
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
 (let (($x797 (= co_2 (_ bv2 2))))
 (=> $x797 (= final_x (bvadd read_a (_ bv1 32))))))
(assert
 (let (($x116 (= co_4 (_ bv2 2))))
 (=> $x116 (= final_x (bvadd read_b (_ bv1 32))))))
(assert
 (let (($x173 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x485 (and (distinct rf_4_3 false) true)))
 (let (($x143 (and (distinct rf_2_1 false) true)))
 (or (and (distinct (_ bv1 32) read_a) true) (and (distinct (_ bv0 32) read_b) true) (and (distinct rf_0_1 false) true) $x143 (and (distinct rf_4_1 true) true) (and (distinct rf_0_3 true) true) (and (distinct rf_2_3 false) true) $x485 $x173 (and (distinct (_ bv2 2) co_2) true) (and (distinct (_ bv1 2) co_4) true))))))
(assert
 (let (($x173 (and (distinct (_ bv0 2) co_0) true)))
(let (($x485 (and (distinct rf_4_3 false) true)))
(let (($x143 (and (distinct rf_2_1 false) true)))
(or (and (distinct (_ bv0 32) read_a) true) (and (distinct (_ bv1 32) read_b) true) (and (distinct rf_0_1 true) true) $x143 (and (distinct rf_4_1 false) true) (and (distinct rf_0_3 false) true) (and (distinct rf_2_3 true) true) $x485 $x173 (and (distinct (_ bv1 2) co_2) true) (and (distinct (_ bv2 2) co_4) true))))))
(check-sat)
