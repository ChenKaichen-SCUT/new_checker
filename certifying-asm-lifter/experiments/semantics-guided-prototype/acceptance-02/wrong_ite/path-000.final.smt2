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
 (=> rf_2_1 (= (bvadd read_merged (ite input_b (_ bv2 32) (_ bv1 32))) read_merged)))
(assert
 (=> rf_4_1 (= (bvadd read_other (_ bv1 32)) read_merged)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (let ((?x48 (ite input_b (_ bv2 32) (_ bv1 32))))
 (let ((?x11 (bvadd read_merged ?x48)))
 (let (($x423 (= ?x11 read_other)))
 (=> rf_2_3 $x423)))))
(assert
 (=> rf_4_3 (= (bvadd read_other (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x139 (bvult co_0 co_2)))
 (let (($x429 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x429 $x139)))))
(assert
 (let (($x85 (bvult co_4 co_2)))
 (let (($x761 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x761 $x85)))))
(assert
 (let (($x1075 (bvult co_0 co_4)))
 (let (($x482 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x482 $x1075)))))
(assert
 (let (($x494 (bvult co_2 co_4)))
 (let (($x540 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x540 $x494)))))
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
 (let (($x429 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x429) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1303 (and true false)))
 (let (($x429 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x429 $x1303) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x871 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x538 (or false false false $x871)))
 (=> $x538 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x367 (and false false)))
 (let (($x871 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x871 $x367) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x70 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x70) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x367 (and false false)))
 (let (($x70 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x70 $x367) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x871 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x538 (or false false false $x871)))
 (=> $x538 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x1303 (and true false)))
 (let (($x871 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x871 $x1303) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x761 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x761) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1303 (and true false)))
 (let (($x761 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x761 $x1303) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x482 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x482) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1303 (and true false)))
 (let (($x482 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x482 $x1303) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x893 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x260 (or false false false $x893)))
 (=> $x260 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x1303 (and true false)))
 (let (($x893 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x893 $x1303) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x540 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x540) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1303 (and true false)))
 (let (($x540 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x540 $x1303) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x893 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x260 (or false false false $x893)))
 (=> $x260 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x367 (and false false)))
 (let (($x893 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x893 $x367) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x790 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x790) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x367 (and false false)))
 (let (($x790 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x790 $x367) (bvult topo_T_3 topo_T_4)))))
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
 (let ((?x48 (ite input_b (_ bv2 32) (_ bv1 32))))
 (let ((?x11 (bvadd read_merged ?x48)))
 (let (($x71 (= final_x ?x11)))
 (let (($x743 (= co_2 (_ bv2 2))))
 (=> $x743 $x71))))))
(assert
 (let (($x969 (= co_4 (_ bv2 2))))
 (=> $x969 (= final_x (bvadd read_other (_ bv1 32))))))
(assert
 (let (($x702 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x474 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x1098 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1020 (and (distinct rf_4_3 false) true)))
 (let (($x631 (and (distinct rf_2_3 false) true)))
 (let (($x2228 (and (distinct rf_0_3 true) true)))
 (let (($x1227 (and (distinct rf_4_1 true) true)))
 (let (($x2249 (and (distinct rf_2_1 false) true)))
 (let (($x54 (and (distinct rf_0_1 false) true)))
 (let (($x549 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x625 (and (distinct (_ bv1 32) read_merged) true)))
 (let (($x530 (and (distinct input_b true) true)))
 (or $x530 $x625 $x549 $x54 $x2249 $x1227 $x2228 $x631 $x1020 $x1098 $x474 $x702))))))))))))))
(assert
 (let (($x880 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x261 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1098 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1020 (and (distinct rf_4_3 false) true)))
 (let (($x2209 (and (distinct rf_2_3 true) true)))
 (let (($x1169 (and (distinct rf_0_3 false) true)))
 (let (($x243 (and (distinct rf_4_1 false) true)))
 (let (($x2249 (and (distinct rf_2_1 false) true)))
 (let (($x345 (and (distinct rf_0_1 true) true)))
 (let (($x427 (and (distinct (_ bv0 32) read_merged) true)))
 (let (($x821 (and (distinct input_b false) true)))
 (or $x821 $x427 (and (distinct (_ bv1 32) read_other) true) $x345 $x2249 $x243 $x1169 $x2209 $x1020 $x1098 $x261 $x880)))))))))))))
(assert
 (let (($x880 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x261 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1098 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1020 (and (distinct rf_4_3 false) true)))
 (let (($x2209 (and (distinct rf_2_3 true) true)))
 (let (($x1169 (and (distinct rf_0_3 false) true)))
 (let (($x243 (and (distinct rf_4_1 false) true)))
 (let (($x2249 (and (distinct rf_2_1 false) true)))
 (let (($x345 (and (distinct rf_0_1 true) true)))
 (let (($x427 (and (distinct (_ bv0 32) read_merged) true)))
 (let (($x530 (and (distinct input_b true) true)))
 (or $x530 $x427 (and (distinct (_ bv2 32) read_other) true) $x345 $x2249 $x243 $x1169 $x2209 $x1020 $x1098 $x261 $x880)))))))))))))
(assert
 (let (($x702 (and (distinct (_ bv1 2) co_4) true)))
(let (($x474 (and (distinct (_ bv2 2) co_2) true)))
(let (($x1098 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1020 (and (distinct rf_4_3 false) true)))
(let (($x631 (and (distinct rf_2_3 false) true)))
(let (($x2228 (and (distinct rf_0_3 true) true)))
(let (($x1227 (and (distinct rf_4_1 true) true)))
(let (($x2249 (and (distinct rf_2_1 false) true)))
(let (($x54 (and (distinct rf_0_1 false) true)))
(let (($x549 (and (distinct (_ bv0 32) read_other) true)))
(let (($x625 (and (distinct (_ bv1 32) read_merged) true)))
(let (($x821 (and (distinct input_b false) true)))
(or $x821 $x625 $x549 $x54 $x2249 $x1227 $x2228 $x631 $x1020 $x1098 $x474 $x702))))))))))))))
(check-sat)
