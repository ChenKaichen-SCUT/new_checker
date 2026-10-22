; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_2_4 () Bool)
(declare-fun rf_5_4 () Bool)
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
 (let (($x643 (= (_ bv0 32) read_t1_a)))
 (= $x643 true)))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_5) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (let (($x643 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_3 $x643)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_2_4 (= (_ bv1 32) read_t1_yes)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_4 rf_2_4 rf_5_4))
(assert
 (let (($x23 (bvult co_0 co_5)))
 (let (($x68 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (not (and $x68 $x23)))))
(assert
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (not (and $x866 false))))
(assert
 (let (($x1173 (bvult co_2 co_5)))
 (let (($x928 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (not (and $x928 $x1173)))))
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
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_2 topo_T_3)))))
(assert
 (=> (or false rf_2_4 false or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_2_4)) (bvult topo_T_2 topo_T_4)))
(assert
 (=> (or false false (bvult co_2 co_5) or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false (bvult co_2 co_5) or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1087 (or false false false $x413)))
 (=> $x1087 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x733 (and true false)))
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1119 (or false false false $x413 $x733)))
 (=> $x1119 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x733 (and true false)))
 (let (($x1154 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x1154 $x733) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1087 (or false false false $x413)))
 (=> $x1087 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x733 (and true false)))
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1119 (or false false false $x413 $x733)))
 (=> $x1119 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1087 (or false false false $x413)))
 (=> $x1087 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x504 (and false false)))
 (let (($x413 (or (and rf_1_3 false))))
 (=> (or false false false $x413 $x504) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1087 (or false false false $x413)))
 (=> $x1087 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x504 (and false false)))
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x829 (or true false false $x413 $x504)))
 (=> $x829 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x1087 (or false false false $x413)))
 (=> $x1087 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x504 (and false false)))
 (let (($x413 (or (and rf_1_3 false))))
 (let (($x829 (or true false false $x413 $x504)))
 (=> $x829 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x68 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x68) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x733 (and true false)))
 (let (($x68 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x68 $x733) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x957 (or false false false $x866)))
 (=> $x957 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x733 (and true false)))
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (=> (or false false false $x866 $x733) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x928 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (=> (or false false false $x928) (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x733 (and true false)))
 (let (($x928 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (=> (or false false false $x928 $x733) (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x957 (or false false false $x866)))
 (=> $x957 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x504 (and false false)))
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x988 (or false false false $x866 $x504)))
 (=> $x988 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x957 (or false false false $x866)))
 (=> $x957 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x504 (and false false)))
 (let (($x866 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x988 (or false false false $x866 $x504)))
 (=> $x988 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x468 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_2_4 (bvult co_2 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x468) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x504 (and false false)))
 (let (($x468 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_2_4 (bvult co_2 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x468 $x504) (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x733 (and true false)))
 (let (($x247 (or false false false or $x733)))
 (=> $x247 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false false (bvult co_5 co_2) or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false (bvult co_5 co_2) or (and true false)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x544 (or false false false or)))
 (=> $x544 (bvult topo_U_5 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x534 (= co_0 (_ bv2 2))))
 (=> $x534 (= (_ bv0 32) final_x))))
(assert
 (let (($x54 (= co_2 (_ bv2 2))))
 (=> $x54 (= (_ bv1 32) final_x))))
(assert
 (let (($x441 (= co_5 (_ bv2 2))))
 (=> $x441 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x430 (= co_1 (_ bv0 1))))
(=> $x430 (= (_ bv0 32) final_y))))
(check-sat)
