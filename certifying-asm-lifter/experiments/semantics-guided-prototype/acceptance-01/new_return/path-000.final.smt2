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
 (let ((?x250 (ite input_b (_ bv1 32) (_ bv2 32))))
 (let ((?x832 (bvadd read_merged ?x250)))
 (let (($x98 (= ?x832 read_other)))
 (=> rf_2_3 $x98)))))
(assert
 (=> rf_4_3 (= (bvadd read_other (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x787 (bvult co_0 co_2)))
 (let (($x337 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x337 $x787)))))
(assert
 (let (($x880 (bvult co_4 co_2)))
 (let (($x987 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x987 $x880)))))
(assert
 (let (($x303 (bvult co_0 co_4)))
 (let (($x938 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x938 $x303)))))
(assert
 (let (($x1086 (bvult co_2 co_4)))
 (let (($x1072 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x1072 $x1086)))))
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
 (let (($x337 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x337) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x402 (and true false)))
 (let (($x337 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x337 $x402) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x128 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x947 (or false false false $x128)))
 (=> $x947 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x743 (and false false)))
 (let (($x128 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x128 $x743) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x949 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x949) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x743 (and false false)))
 (let (($x949 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x949 $x743) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x128 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x947 (or false false false $x128)))
 (=> $x947 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x402 (and true false)))
 (let (($x128 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x128 $x402) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x987 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x987) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x402 (and true false)))
 (let (($x987 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x987 $x402) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x938 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x938) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x402 (and true false)))
 (let (($x938 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x938 $x402) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x131 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x271 (or false false false $x131)))
 (=> $x271 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x402 (and true false)))
 (let (($x131 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x131 $x402) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1072 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x1072) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x402 (and true false)))
 (let (($x1072 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x1072 $x402) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x131 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x271 (or false false false $x131)))
 (=> $x271 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x743 (and false false)))
 (let (($x131 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x131 $x743) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x23 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x23) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x743 (and false false)))
 (let (($x23 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x23 $x743) (bvult topo_T_3 topo_T_4)))))
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
 (let ((?x250 (ite input_b (_ bv1 32) (_ bv2 32))))
 (let ((?x832 (bvadd read_merged ?x250)))
 (let (($x593 (= final_x ?x832)))
 (let (($x995 (= co_2 (_ bv2 2))))
 (=> $x995 $x593))))))
(assert
 (let (($x1014 (= co_4 (_ bv2 2))))
 (=> $x1014 (= final_x (bvadd read_other (_ bv1 32))))))
(assert
 (let (($x177 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x21 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x118 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1188 (and (distinct rf_4_3 false) true)))
 (let (($x1018 (and (distinct rf_2_3 true) true)))
 (let (($x1299 (and (distinct rf_0_3 false) true)))
 (let (($x365 (and (distinct rf_4_1 false) true)))
 (let (($x870 (and (distinct rf_2_1 false) true)))
 (let (($x502 (and (distinct rf_0_1 true) true)))
 (let (($x95 (and (distinct (_ bv0 32) read_merged) true)))
 (let (($x968 (and (distinct input_b false) true)))
 (or $x968 $x95 (and (distinct (_ bv2 32) read_other) true) $x502 $x870 $x365 $x1299 $x1018 $x1188 $x118 $x21 $x177)))))))))))))
(assert
 (let (($x392 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x183 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x118 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1188 (and (distinct rf_4_3 false) true)))
 (let (($x1242 (and (distinct rf_2_3 false) true)))
 (let (($x677 (and (distinct rf_0_3 true) true)))
 (let (($x1095 (and (distinct rf_4_1 true) true)))
 (let (($x870 (and (distinct rf_2_1 false) true)))
 (let (($x469 (and (distinct rf_0_1 false) true)))
 (let (($x997 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x803 (and (distinct (_ bv1 32) read_merged) true)))
 (let (($x968 (and (distinct input_b false) true)))
 (or $x968 $x803 $x997 $x469 $x870 $x1095 $x677 $x1242 $x1188 $x118 $x183 $x392))))))))))))))
(assert
 (let (($x392 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x183 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x118 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1188 (and (distinct rf_4_3 false) true)))
 (let (($x1242 (and (distinct rf_2_3 false) true)))
 (let (($x677 (and (distinct rf_0_3 true) true)))
 (let (($x1095 (and (distinct rf_4_1 true) true)))
 (let (($x870 (and (distinct rf_2_1 false) true)))
 (let (($x469 (and (distinct rf_0_1 false) true)))
 (let (($x997 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x803 (and (distinct (_ bv1 32) read_merged) true)))
 (let (($x1224 (and (distinct input_b true) true)))
 (or $x1224 $x803 $x997 $x469 $x870 $x1095 $x677 $x1242 $x1188 $x118 $x183 $x392))))))))))))))
(assert
 (let (($x177 (and (distinct (_ bv2 2) co_4) true)))
(let (($x21 (and (distinct (_ bv1 2) co_2) true)))
(let (($x118 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1188 (and (distinct rf_4_3 false) true)))
(let (($x1018 (and (distinct rf_2_3 true) true)))
(let (($x1299 (and (distinct rf_0_3 false) true)))
(let (($x365 (and (distinct rf_4_1 false) true)))
(let (($x870 (and (distinct rf_2_1 false) true)))
(let (($x502 (and (distinct rf_0_1 true) true)))
(let (($x95 (and (distinct (_ bv0 32) read_merged) true)))
(let (($x1224 (and (distinct input_b true) true)))
(or $x1224 $x95 (and (distinct (_ bv1 32) read_other) true) $x502 $x870 $x365 $x1299 $x1018 $x1188 $x118 $x21 $x177)))))))))))))
(check-sat)
