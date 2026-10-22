; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_7_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
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
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_1 co_5 co_7) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 (=> rf_7_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_7_4))
(assert
 (=> rf_1_6 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_6 (= (bvadd read_t0_b (_ bv2 32)) read_t1_a)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_6 rf_5_6 rf_7_6))
(assert
 (=> rf_0_8 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_8 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_8 rf_3_8))
(assert
 (let (($x2008 (bvult co_0 co_3)))
 (let (($x1489 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1489 $x2008)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1718 false))))
(assert
 (let (($x483 (bvult co_1 co_7)))
 (let (($x1272 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (not (and $x1272 $x483)))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1718 false))))
(assert
 (let (($x942 (bvult co_5 co_7)))
 (let (($x1432 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (not (and $x1432 $x942)))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (not (and $x1379 false))))
(assert
 (let (($x499 (bvult co_1 co_5)))
 (let (($x164 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (not (and $x164 $x499)))))
(assert
 (let (($x273 (bvult co_7 co_5)))
 (let (($x1507 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (not (and $x1507 $x273)))))
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
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_0 topo_T_7)))))
(assert
 (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false (bvult co_1 co_7) or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1489 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1489) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1489 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1489 $x1151) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x82 (or false false false $x785 $x1151)))
 (=> $x82 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x785 $x1787) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x885 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x885) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1787 (and false false)))
 (let (($x885 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x885 $x1787) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1737 (or true false false $x785 $x1787)))
 (=> $x1737 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1737 (or true false false $x785 $x1787)))
 (=> $x1737 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x82 (or false false false $x785 $x1151)))
 (=> $x82 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x82 (or false false false $x785 $x1151)))
 (=> $x82 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x325 (or false false false $x785)))
 (=> $x325 (bvult topo_U_2 topo_U_8)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x785 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x82 (or false false false $x785 $x1151)))
 (=> $x82 (bvult topo_T_2 topo_T_8))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1406 (or true false false or $x1787)))
 (=> $x1406 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1406 (or true false false or $x1787)))
 (=> $x1406 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_3 topo_T_7)))))
(assert
 (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1953 (or false false false $x1379 $x1151)))
 (=> $x1953 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x164 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x164) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1151 (and true false)))
 (let (($x164 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x164 $x1151) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1167 (or false false false $x1379 $x1787)))
 (=> $x1167 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1167 (or false false false $x1379 $x1787)))
 (=> $x1167 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1167 (or false false false $x1379 $x1787)))
 (=> $x1167 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x770 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x770) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1787 (and false false)))
 (let (($x770 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x770 $x1787) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1953 (or false false false $x1379 $x1151)))
 (=> $x1953 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1507 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x1507) (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1507 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x1507 $x1151) (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1495 (or false false false $x1379)))
 (=> $x1495 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1379 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1953 (or false false false $x1379 $x1151)))
 (=> $x1953 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1787 (and false false)))
 (let (($x110 (or false false false or $x1787)))
 (=> $x110 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1787 (and false false)))
 (let (($x110 (or false false false or $x1787)))
 (=> $x110 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert
 (=> (or false false (bvult co_5 co_7) or) (bvult topo_U_5 topo_U_7)))
(assert
 (=> (or false false (bvult co_5 co_7) or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_5 topo_U_8))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_5 topo_T_8)))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2044 (or false false false $x1718 $x1151)))
 (=> $x2044 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1272 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1272) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1272 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1272 $x1151) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2044 (or false false false $x1718 $x1151)))
 (=> $x2044 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2044 (or false false false $x1718 $x1151)))
 (=> $x2044 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2044 (or false false false $x1718 $x1151)))
 (=> $x2044 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1432 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1432) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1432 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1432 $x1151) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (=> (or false false false $x1718 $x1787) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1563 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1563) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1563 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1563 $x1787) (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x184 (or false false false $x1718)))
 (=> $x184 (bvult topo_U_6 topo_U_8)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1718 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (=> (or true false false $x1718 $x1787) (bvult topo_T_6 topo_T_8)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_7 topo_T_0)))))
(assert
 (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert
 (=> (or false false (bvult co_7 co_1) or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2018 (or false false false or $x1151)))
 (=> $x2018 (bvult topo_T_7 topo_T_3)))))
(assert
 (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert
 (=> (or false false (bvult co_7 co_5) or) (bvult topo_U_7 topo_U_5)))
(assert
 (=> (or false false (bvult co_7 co_5) or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x653 (or false false false or)))
 (=> $x653 (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x1787 (and false false)))
 (let (($x1406 (or true false false or $x1787)))
 (=> $x1406 (bvult topo_T_7 topo_T_8)))))
(assert
 (let (($x462 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)))))
 (=> (or false false false $x462) (bvult topo_U_8 topo_U_0))))
(assert
 (let (($x1151 (and true false)))
 (let (($x462 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)))))
 (=> (or false false false $x462 $x1151) (bvult topo_T_8 topo_T_0)))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_1)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1681 (or false false false $x2032 $x1151)))
 (=> $x1681 (bvult topo_T_8 topo_T_1))))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_2)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1681 (or false false false $x2032 $x1151)))
 (=> $x1681 (bvult topo_T_8 topo_T_2))))))
(assert
 (let (($x1483 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)))))
 (=> (or false false false $x1483) (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x1151 (and true false)))
 (let (($x1483 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)))))
 (=> (or false false false $x1483 $x1151) (bvult topo_T_8 topo_T_3)))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_4)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1681 (or false false false $x2032 $x1151)))
 (=> $x1681 (bvult topo_T_8 topo_T_4))))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_5)))))
(assert
 (let (($x1151 (and true false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1681 (or false false false $x2032 $x1151)))
 (=> $x1681 (bvult topo_T_8 topo_T_5))))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_6)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x307 (or false false false $x2032 $x1787)))
 (=> $x307 (bvult topo_T_8 topo_T_6))))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_7)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x307 (or false false false $x2032 $x1787)))
 (=> $x307 (bvult topo_T_8 topo_T_7))))))
(assert
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x390 (or false false false $x2032)))
 (=> $x390 (bvult topo_U_8 topo_U_8)))))
(assert
 (let (($x1787 (and false false)))
 (let (($x2032 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x307 (or false false false $x2032 $x1787)))
 (=> $x307 (bvult topo_T_8 topo_T_8))))))
(assert
 (let (($x1118 (= co_0 (_ bv1 2))))
 (=> $x1118 (= (_ bv0 32) final_x))))
(assert
 (let (($x78 (= co_3 (_ bv1 2))))
 (=> $x78 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1487 (= co_1 (_ bv2 2))))
 (=> $x1487 (= (_ bv0 32) final_y))))
(assert
 (let (($x1152 (= co_5 (_ bv2 2))))
 (=> $x1152 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x1700 (= co_7 (_ bv2 2))))
(=> $x1700 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
