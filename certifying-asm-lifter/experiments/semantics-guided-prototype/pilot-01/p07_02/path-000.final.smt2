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
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
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
 (let (($x1381 (bvult co_0 co_3)))
 (let (($x1271 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1271 $x1381)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1473 false))))
(assert
 (let (($x361 (bvult co_1 co_7)))
 (let (($x1768 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (not (and $x1768 $x361)))))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1473 false))))
(assert
 (let (($x1046 (bvult co_5 co_7)))
 (let (($x1456 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (not (and $x1456 $x1046)))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (not (and $x853 false))))
(assert
 (let (($x546 (bvult co_1 co_5)))
 (let (($x1536 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (not (and $x1536 $x546)))))
(assert
 (let (($x1024 (bvult co_7 co_5)))
 (let (($x2039 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (not (and $x2039 $x1024)))))
(assert
 (bvult topo_U_0 (_ bv8 4)))
(assert
 (bvult topo_U_1 (_ bv8 4)))
(assert
 (bvult topo_U_2 (_ bv8 4)))
(assert
 (bvult topo_U_3 (_ bv8 4)))
(assert
 (bvult topo_U_4 (_ bv8 4)))
(assert
 (bvult topo_U_5 (_ bv8 4)))
(assert
 (bvult topo_U_6 (_ bv8 4)))
(assert
 (bvult topo_U_7 (_ bv8 4)))
(assert
 (bvult topo_T_0 (_ bv8 4)))
(assert
 (bvult topo_T_1 (_ bv8 4)))
(assert
 (bvult topo_T_2 (_ bv8 4)))
(assert
 (bvult topo_T_3 (_ bv8 4)))
(assert
 (bvult topo_T_4 (_ bv8 4)))
(assert
 (bvult topo_T_5 (_ bv8 4)))
(assert
 (bvult topo_T_6 (_ bv8 4)))
(assert
 (bvult topo_T_7 (_ bv8 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_0 topo_T_7)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_1 topo_T_3)))))
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
 (let (($x1271 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1271) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1271 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1271 $x1742) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x594 (or false false false $x1204 $x1742)))
 (=> $x594 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1204 $x2040) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x619 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x619) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x2040 (and false false)))
 (let (($x619 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x619 $x2040) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x69 (or true false false $x1204 $x2040)))
 (=> $x69 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x69 (or true false false $x1204 $x2040)))
 (=> $x69 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x594 (or false false false $x1204 $x1742)))
 (=> $x594 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1959 (or false false false $x1204)))
 (=> $x1959 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1204 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x594 (or false false false $x1204 $x1742)))
 (=> $x594 (bvult topo_T_2 topo_T_7))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1801 (or true false false or $x2040)))
 (=> $x1801 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1801 (or true false false or $x2040)))
 (=> $x1801 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x34 (or false false false $x853)))
 (=> $x34 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x542 (or false false false $x853 $x1742)))
 (=> $x542 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1536 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x1536) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1536 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x1536 $x1742) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x34 (or false false false $x853)))
 (=> $x34 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x215 (or false false false $x853 $x2040)))
 (=> $x215 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x34 (or false false false $x853)))
 (=> $x34 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x215 (or false false false $x853 $x2040)))
 (=> $x215 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x34 (or false false false $x853)))
 (=> $x34 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x215 (or false false false $x853 $x2040)))
 (=> $x215 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x303 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x303) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x2040 (and false false)))
 (let (($x303 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x303 $x2040) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x34 (or false false false $x853)))
 (=> $x34 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x853 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x542 (or false false false $x853 $x1742)))
 (=> $x542 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x2039 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x2039) (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x1742 (and true false)))
 (let (($x2039 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x2039 $x1742) (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x2040 (and false false)))
 (let (($x732 (or false false false or $x2040)))
 (=> $x732 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x2040 (and false false)))
 (let (($x732 (or false false false or $x2040)))
 (=> $x732 (bvult topo_T_5 topo_T_3)))))
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
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x582 (or false false false $x1473)))
 (=> $x582 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1253 (or false false false $x1473 $x1742)))
 (=> $x1253 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1768 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1768) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1768 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1768 $x1742) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x582 (or false false false $x1473)))
 (=> $x582 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1253 (or false false false $x1473 $x1742)))
 (=> $x1253 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x582 (or false false false $x1473)))
 (=> $x582 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1253 (or false false false $x1473 $x1742)))
 (=> $x1253 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x582 (or false false false $x1473)))
 (=> $x582 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1253 (or false false false $x1473 $x1742)))
 (=> $x1253 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1456 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1456) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1456 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1456 $x1742) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x582 (or false false false $x1473)))
 (=> $x582 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1473 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (=> (or false false false $x1473 $x2040) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1925 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1925) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x2040 (and false false)))
 (let (($x1925 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1925 $x2040) (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_7 topo_T_0)))))
(assert
 (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert
 (=> (or false false (bvult co_7 co_1) or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x382 (or false false false or)))
 (=> $x382 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1742 (and true false)))
 (let (($x1281 (or false false false or $x1742)))
 (=> $x1281 (bvult topo_T_7 topo_T_3)))))
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
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1285 (= co_3 (_ bv1 2))))
 (=> $x1285 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1378 (= co_5 (_ bv2 2))))
 (=> $x1378 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x1135 (= co_7 (_ bv2 2))))
 (=> $x1135 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x392 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x142 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x968 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x82 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1431 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x353 (and (distinct rf_7_6 false) true)))
 (let (($x354 (and (distinct rf_5_6 true) true)))
 (let (($x1901 (and (distinct rf_1_6 false) true)))
 (let (($x217 (and (distinct rf_7_4 false) true)))
 (let (($x1049 (and (distinct rf_5_4 false) true)))
 (let (($x459 (and (distinct rf_1_4 true) true)))
 (let (($x630 (and (distinct rf_3_2 false) true)))
 (let (($x1397 (and (distinct rf_0_2 true) true)))
 (let (($x5 (and (distinct (_ bv2 32) read_t1_a) true)))
 (let (($x1727 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1222 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1453 (and (distinct input_b false) true)))
 (or $x1453 $x1222 $x1727 $x5 $x1397 $x630 $x459 $x1049 $x217 $x1901 $x354 $x353 $x1431 $x82 $x968 $x142 $x392)))))))))))))))))))
(assert
 (let (($x380 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x926 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x968 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x82 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1431 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x353 (and (distinct rf_7_6 false) true)))
 (let (($x447 (and (distinct rf_5_6 false) true)))
 (let (($x269 (and (distinct rf_1_6 true) true)))
 (let (($x1755 (and (distinct rf_7_4 true) true)))
 (let (($x1049 (and (distinct rf_5_4 false) true)))
 (let (($x1379 (and (distinct rf_1_4 false) true)))
 (let (($x630 (and (distinct rf_3_2 false) true)))
 (let (($x1397 (and (distinct rf_0_2 true) true)))
 (let (($x265 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1761 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1222 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1453 (and (distinct input_b false) true)))
 (or $x1453 $x1222 $x1761 $x265 $x1397 $x630 $x1379 $x1049 $x1755 $x269 $x447 $x353 $x1431 $x82 $x968 $x926 $x380)))))))))))))))))))
(assert
 (let (($x380 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x926 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x968 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x82 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1431 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x353 (and (distinct rf_7_6 false) true)))
 (let (($x447 (and (distinct rf_5_6 false) true)))
 (let (($x269 (and (distinct rf_1_6 true) true)))
 (let (($x1755 (and (distinct rf_7_4 true) true)))
 (let (($x1049 (and (distinct rf_5_4 false) true)))
 (let (($x1379 (and (distinct rf_1_4 false) true)))
 (let (($x630 (and (distinct rf_3_2 false) true)))
 (let (($x1397 (and (distinct rf_0_2 true) true)))
 (let (($x265 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1761 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1222 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x895 (and (distinct input_b true) true)))
 (or $x895 $x1222 $x1761 $x265 $x1397 $x630 $x1379 $x1049 $x1755 $x269 $x447 $x353 $x1431 $x82 $x968 $x926 $x380)))))))))))))))))))
(assert
 (let (($x392 (and (distinct (_ bv2 2) co_7) true)))
(let (($x142 (and (distinct (_ bv1 2) co_5) true)))
(let (($x968 (and (distinct (_ bv0 2) co_1) true)))
(let (($x82 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1431 (and (distinct (_ bv0 2) co_0) true)))
(let (($x353 (and (distinct rf_7_6 false) true)))
(let (($x354 (and (distinct rf_5_6 true) true)))
(let (($x1901 (and (distinct rf_1_6 false) true)))
(let (($x217 (and (distinct rf_7_4 false) true)))
(let (($x1049 (and (distinct rf_5_4 false) true)))
(let (($x459 (and (distinct rf_1_4 true) true)))
(let (($x630 (and (distinct rf_3_2 false) true)))
(let (($x1397 (and (distinct rf_0_2 true) true)))
(let (($x5 (and (distinct (_ bv2 32) read_t1_a) true)))
(let (($x1727 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x1222 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x895 (and (distinct input_b true) true)))
(or $x895 $x1222 $x1727 $x5 $x1397 $x630 $x459 $x1049 $x217 $x1901 $x354 $x353 $x1431 $x82 $x968 $x142 $x392)))))))))))))))))))
(check-sat)
