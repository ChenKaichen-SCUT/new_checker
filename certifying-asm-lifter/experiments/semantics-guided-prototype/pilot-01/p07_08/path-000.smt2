; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_8 () Bool)
(declare-fun rf_5_8 () Bool)
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
(assert
 true)
(assert
 (= input_b true))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_7) true))
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
 (=> rf_7_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_7_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_yes)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_6 rf_3_6 rf_7_6))
(assert
 (=> rf_1_8 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_5_8 (= (bvadd read_t0_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_8 rf_5_8))
(assert
 (let (($x1495 (bvult co_0 co_3)))
 (let (($x51 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (not (and $x51 $x1495)))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (not (and $x1176 false))))
(assert
 (let (($x1343 (bvult co_7 co_3)))
 (let (($x1154 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (not (and $x1154 $x1343)))))
(assert
 (let (($x1217 (bvult co_0 co_7)))
 (let (($x967 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x967 $x1217)))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (not (and $x1821 false))))
(assert
 (let (($x1953 (bvult co_3 co_7)))
 (let (($x13 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (not (and $x13 $x1953)))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (not (and $x1821 false))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x447 (bvult co_1 co_5)))
 (let (($x1004 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1004 $x447)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_0 topo_U_8))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_0 topo_T_8)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false rf_1_8 false or) (bvult topo_U_1 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_1_8)) (bvult topo_T_1 topo_T_8)))
(assert
 (let (($x51 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x51) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1426 (and true false)))
 (let (($x51 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x51 $x1426) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x142 (or false false false $x1176 $x1426)))
 (=> $x142 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (=> (or false false false $x1176 $x198) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1132 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x1132) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x198 (and false false)))
 (let (($x1132 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x1132 $x198) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x211 (or true false false $x1176 $x198)))
 (=> $x211 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x211 (or true false false $x1176 $x198)))
 (=> $x211 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x142 (or false false false $x1176 $x1426)))
 (=> $x142 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1154 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1154) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1154 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1154 $x1426) (bvult topo_T_2 topo_T_7)))))
(assert
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1822 (or false false false $x1176)))
 (=> $x1822 (bvult topo_U_2 topo_U_8)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1176 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x142 (or false false false $x1176 $x1426)))
 (=> $x142 (bvult topo_T_2 topo_T_8))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x198 (and false false)))
 (let (($x1915 (or true false false or $x198)))
 (=> $x1915 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x198 (and false false)))
 (let (($x1915 (or true false false or $x198)))
 (=> $x1915 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (=> (or false false (bvult co_3 co_7) or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false (bvult co_3 co_7) or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_3 topo_U_8))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_3 topo_T_8)))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x885 (or false false false $x1294 $x1426)))
 (=> $x885 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1004 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1004) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1004 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1004 $x1426) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1375 (or false false false $x1294 $x198)))
 (=> $x1375 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1375 (or false false false $x1294 $x198)))
 (=> $x1375 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1375 (or false false false $x1294 $x198)))
 (=> $x1375 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x463 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x463) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x198 (and false false)))
 (let (($x463 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x463 $x198) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x885 (or false false false $x1294 $x1426)))
 (=> $x885 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x885 (or false false false $x1294 $x1426)))
 (=> $x885 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1241 (or false false false $x1294)))
 (=> $x1241 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1294 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x885 (or false false false $x1294 $x1426)))
 (=> $x885 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x198 (and false false)))
 (let (($x1206 (or false false false or $x198)))
 (=> $x1206 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x198 (and false false)))
 (let (($x1206 (or false false false or $x198)))
 (=> $x1206 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_5 topo_T_7)))))
(assert
 (=> (or false rf_5_8 false or) (bvult topo_U_5 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_5_8)) (bvult topo_T_5 topo_T_8)))
(assert
 (let (($x967 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x967) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1426 (and true false)))
 (let (($x967 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x967 $x1426) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1456 (or false false false $x1821 $x1426)))
 (=> $x1456 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1456 (or false false false $x1821 $x1426)))
 (=> $x1456 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x13 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x13) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1426 (and true false)))
 (let (($x13 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x13 $x1426) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1456 (or false false false $x1821 $x1426)))
 (=> $x1456 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1456 (or false false false $x1821 $x1426)))
 (=> $x1456 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (=> (or false false false $x1821 $x198) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1345 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1345) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x198 (and false false)))
 (let (($x1345 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1345 $x198) (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1629 (or false false false $x1821)))
 (=> $x1629 (bvult topo_U_6 topo_U_8)))))
(assert
 (let (($x198 (and false false)))
 (let (($x1821 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (=> (or true false false $x1821 $x198) (bvult topo_T_6 topo_T_8)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (=> (or false false (bvult co_7 co_3) or) (bvult topo_U_7 topo_U_3)))
(assert
 (=> (or false false (bvult co_7 co_3) or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1692 (or false false false or $x1426)))
 (=> $x1692 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x1432 (or false false false or)))
 (=> $x1432 (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x198 (and false false)))
 (let (($x1915 (or true false false or $x198)))
 (=> $x1915 (bvult topo_T_7 topo_T_8)))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_0)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x2030 (or false false false $x691 $x1426)))
 (=> $x2030 (bvult topo_T_8 topo_T_0))))))
(assert
 (let (($x1863 (or (and rf_1_8 (bvult co_1 co_1)) (and rf_5_8 (bvult co_5 co_1)))))
 (=> (or false false false $x1863) (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x1426 (and true false)))
 (let (($x1863 (or (and rf_1_8 (bvult co_1 co_1)) (and rf_5_8 (bvult co_5 co_1)))))
 (=> (or false false false $x1863 $x1426) (bvult topo_T_8 topo_T_1)))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_2)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x2030 (or false false false $x691 $x1426)))
 (=> $x2030 (bvult topo_T_8 topo_T_2))))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_3)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x2030 (or false false false $x691 $x1426)))
 (=> $x2030 (bvult topo_T_8 topo_T_3))))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_4)))))
(assert
 (let (($x1426 (and true false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x2030 (or false false false $x691 $x1426)))
 (=> $x2030 (bvult topo_T_8 topo_T_4))))))
(assert
 (let (($x2249 (or (and rf_1_8 (bvult co_1 co_5)) (and rf_5_8 (bvult co_5 co_5)))))
 (=> (or false false false $x2249) (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x1426 (and true false)))
 (let (($x2249 (or (and rf_1_8 (bvult co_1 co_5)) (and rf_5_8 (bvult co_5 co_5)))))
 (=> (or false false false $x2249 $x1426) (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_6)))))
(assert
 (let (($x198 (and false false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x1761 (or false false false $x691 $x198)))
 (=> $x1761 (bvult topo_T_8 topo_T_6))))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_7)))))
(assert
 (let (($x198 (and false false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x1761 (or false false false $x691 $x198)))
 (=> $x1761 (bvult topo_T_8 topo_T_7))))))
(assert
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x544 (or false false false $x691)))
 (=> $x544 (bvult topo_U_8 topo_U_8)))))
(assert
 (let (($x198 (and false false)))
 (let (($x691 (or (and rf_1_8 false) (and rf_5_8 false))))
 (let (($x1761 (or false false false $x691 $x198)))
 (=> $x1761 (bvult topo_T_8 topo_T_8))))))
(assert
 (let (($x1347 (= co_0 (_ bv2 2))))
 (=> $x1347 (= (_ bv0 32) final_x))))
(assert
 (let (($x1724 (= co_3 (_ bv2 2))))
 (=> $x1724 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x733 (= co_7 (_ bv2 2))))
 (=> $x733 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x345 (= co_1 (_ bv1 2))))
 (=> $x345 (= (_ bv0 32) final_y))))
(assert
 (let (($x620 (= co_5 (_ bv1 2))))
(=> $x620 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(check-sat)
