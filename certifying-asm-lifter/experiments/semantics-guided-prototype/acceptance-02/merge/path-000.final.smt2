; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_merged () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun input_b () Bool)
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
 (=> rf_0_1 (= (_ bv0 32) read_merged)))
(assert
 (=> rf_2_1 (= (bvadd read_merged (ite input_b (_ bv1 32) (_ bv2 32))) read_merged)))
(assert
 (=> rf_4_1 (= (bvadd read_other (_ bv1 32)) read_merged)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (let ((?x759 (ite input_b (_ bv1 32) (_ bv2 32))))
 (let ((?x184 (bvadd read_merged ?x759)))
 (let (($x1290 (= ?x184 read_other)))
 (=> rf_2_3 $x1290)))))
(assert
 (=> rf_4_3 (= (bvadd read_other (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x1279 (bvult co_0 co_2)))
 (let (($x200 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x200 $x1279)))))
(assert
 (let (($x1297 (bvult co_4 co_2)))
 (let (($x1335 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x1335 $x1297)))))
(assert
 (let (($x1199 (bvult co_0 co_4)))
 (let (($x1231 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x1231 $x1199)))))
(assert
 (let (($x1296 (bvult co_2 co_4)))
 (let (($x2207 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x2207 $x1296)))))
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
 (let (($x200 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x200) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x241 (and true false)))
 (let (($x200 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x200 $x241) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x344 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x2186 (or false false false $x344)))
 (=> $x2186 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x668 (and false false)))
 (let (($x344 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x344 $x668) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x939 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x939) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x668 (and false false)))
 (let (($x939 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x939 $x668) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x344 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x2186 (or false false false $x344)))
 (=> $x2186 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x241 (and true false)))
 (let (($x344 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x344 $x241) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x1335 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1335) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x241 (and true false)))
 (let (($x1335 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1335 $x241) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x1231 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x1231) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x241 (and true false)))
 (let (($x1231 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x1231 $x241) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x701 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x435 (or false false false $x701)))
 (=> $x435 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x241 (and true false)))
 (let (($x701 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x701 $x241) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x2207 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x2207) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x241 (and true false)))
 (let (($x2207 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x2207 $x241) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x701 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x435 (or false false false $x701)))
 (=> $x435 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x668 (and false false)))
 (let (($x701 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x701 $x668) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x586 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x586) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x668 (and false false)))
 (let (($x586 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x586 $x668) (bvult topo_T_3 topo_T_4)))))
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
 (let ((?x759 (ite input_b (_ bv1 32) (_ bv2 32))))
 (let ((?x184 (bvadd read_merged ?x759)))
 (let (($x2252 (= final_x ?x184)))
 (let (($x428 (= co_2 (_ bv2 2))))
 (=> $x428 $x2252))))))
(assert
 (let (($x970 (= co_4 (_ bv2 2))))
 (=> $x970 (= final_x (bvadd read_other (_ bv1 32))))))
(assert
 (let (($x800 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x894 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x379 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x460 (and (distinct rf_4_3 false) true)))
 (let (($x950 (and (distinct rf_2_3 true) true)))
 (let (($x301 (and (distinct rf_0_3 false) true)))
 (let (($x1045 (and (distinct rf_4_1 false) true)))
 (let (($x477 (and (distinct rf_2_1 false) true)))
 (let (($x1223 (and (distinct rf_0_1 true) true)))
 (let (($x1010 (and (distinct (_ bv0 32) read_merged) true)))
 (let (($x1165 (and (distinct input_b false) true)))
 (or $x1165 $x1010 (and (distinct (_ bv2 32) read_other) true) $x1223 $x477 $x1045 $x301 $x950 $x460 $x379 $x894 $x800)))))))))))))
(assert
 (let (($x1200 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1146 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x379 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x460 (and (distinct rf_4_3 false) true)))
 (let (($x1227 (and (distinct rf_2_3 false) true)))
 (let (($x361 (and (distinct rf_0_3 true) true)))
 (let (($x1170 (and (distinct rf_4_1 true) true)))
 (let (($x477 (and (distinct rf_2_1 false) true)))
 (let (($x525 (and (distinct rf_0_1 false) true)))
 (let (($x277 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x1217 (and (distinct (_ bv1 32) read_merged) true)))
 (let (($x1165 (and (distinct input_b false) true)))
 (or $x1165 $x1217 $x277 $x525 $x477 $x1170 $x361 $x1227 $x460 $x379 $x1146 $x1200))))))))))))))
(assert
 (let (($x1200 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1146 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x379 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x460 (and (distinct rf_4_3 false) true)))
 (let (($x1227 (and (distinct rf_2_3 false) true)))
 (let (($x361 (and (distinct rf_0_3 true) true)))
 (let (($x1170 (and (distinct rf_4_1 true) true)))
 (let (($x477 (and (distinct rf_2_1 false) true)))
 (let (($x525 (and (distinct rf_0_1 false) true)))
 (let (($x277 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x1217 (and (distinct (_ bv1 32) read_merged) true)))
 (let (($x236 (and (distinct input_b true) true)))
 (or $x236 $x1217 $x277 $x525 $x477 $x1170 $x361 $x1227 $x460 $x379 $x1146 $x1200))))))))))))))
(assert
 (let (($x800 (and (distinct (_ bv2 2) co_4) true)))
(let (($x894 (and (distinct (_ bv1 2) co_2) true)))
(let (($x379 (and (distinct (_ bv0 2) co_0) true)))
(let (($x460 (and (distinct rf_4_3 false) true)))
(let (($x950 (and (distinct rf_2_3 true) true)))
(let (($x301 (and (distinct rf_0_3 false) true)))
(let (($x1045 (and (distinct rf_4_1 false) true)))
(let (($x477 (and (distinct rf_2_1 false) true)))
(let (($x1223 (and (distinct rf_0_1 true) true)))
(let (($x1010 (and (distinct (_ bv0 32) read_merged) true)))
(let (($x236 (and (distinct input_b true) true)))
(or $x236 $x1010 (and (distinct (_ bv1 32) read_other) true) $x1223 $x477 $x1045 $x301 $x950 $x460 $x379 $x894 $x800)))))))))))))
(check-sat)
