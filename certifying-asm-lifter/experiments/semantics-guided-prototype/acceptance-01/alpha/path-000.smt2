; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_yes () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_other () (_ BitVec 32))
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
 (= input_b true))
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
 (=> rf_0_1 (= (_ bv0 32) read_yes)))
(assert
 (=> rf_2_1 (= (bvadd read_yes (_ bv1 32)) read_yes)))
(assert
 (=> rf_4_1 (= (bvadd read_other (_ bv1 32)) read_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_3 (= (bvadd read_yes (_ bv1 32)) read_other)))
(assert
 (=> rf_4_3 (= (bvadd read_other (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x2190 (bvult co_0 co_2)))
 (let (($x1251 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x1251 $x2190)))))
(assert
 (let (($x145 (bvult co_4 co_2)))
 (let (($x433 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x433 $x145)))))
(assert
 (let (($x429 (bvult co_0 co_4)))
 (let (($x948 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x948 $x429)))))
(assert
 (let (($x707 (bvult co_2 co_4)))
 (let (($x134 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x134 $x707)))))
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
 (let (($x1251 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x1251) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x230 (and true false)))
 (let (($x1251 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x1251 $x230) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x257 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x268 (or false false false $x257)))
 (=> $x268 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x447 (and false false)))
 (let (($x257 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x257 $x447) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x405 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x405) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x447 (and false false)))
 (let (($x405 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x405 $x447) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x257 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x268 (or false false false $x257)))
 (=> $x268 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x230 (and true false)))
 (let (($x257 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x257 $x230) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x433 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x433) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x230 (and true false)))
 (let (($x433 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x433 $x230) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x948 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x948) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x230 (and true false)))
 (let (($x948 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x948 $x230) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x2234 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x494 (or false false false $x2234)))
 (=> $x494 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x230 (and true false)))
 (let (($x2234 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x2234 $x230) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x134 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x134) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x230 (and true false)))
 (let (($x134 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x134 $x230) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x2234 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x494 (or false false false $x2234)))
 (=> $x494 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x447 (and false false)))
 (let (($x2234 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x2234 $x447) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1105 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1105) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x447 (and false false)))
 (let (($x1105 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1105 $x447) (bvult topo_T_3 topo_T_4)))))
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
 (let (($x1238 (= co_0 (_ bv2 2))))
 (=> $x1238 (= (_ bv0 32) final_x))))
(assert
 (let (($x2230 (= co_2 (_ bv2 2))))
 (=> $x2230 (= final_x (bvadd read_yes (_ bv1 32))))))
(assert
 (let (($x1053 (= co_4 (_ bv2 2))))
(=> $x1053 (= final_x (bvadd read_other (_ bv1 32))))))
(check-sat)
