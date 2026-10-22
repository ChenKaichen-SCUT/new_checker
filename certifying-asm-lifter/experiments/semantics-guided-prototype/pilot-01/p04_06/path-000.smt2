; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_2_7 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_1 co_6) true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_6_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_7 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_2_7))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x1503 (bvult co_1 co_6)))
 (let (($x995 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x995 $x1503)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
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
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1576 (and false false)))
 (let (($x577 (or false false false or $x1576)))
 (=> $x577 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false rf_2_7 false or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_2_7)) (bvult topo_T_2 topo_T_7)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1576 (and false false)))
 (let (($x577 (or false false false or $x1576)))
 (=> $x577 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x1576 (and false false)))
 (let (($x577 (or false false false or $x1576)))
 (=> $x577 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1576 (and false false)))
 (let (($x577 (or false false false or $x1576)))
 (=> $x577 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x456 (or false false false $x1638 $x1375)))
 (=> $x456 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1521 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1521) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1521 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1521 $x1375) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1923 (or false false false $x1638 $x1576)))
 (=> $x1923 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1923 (or false false false $x1638 $x1576)))
 (=> $x1923 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1923 (or false false false $x1638 $x1576)))
 (=> $x1923 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x456 (or false false false $x1638 $x1375)))
 (=> $x456 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x490 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x490) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1375 (and true false)))
 (let (($x490 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x490 $x1375) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x1243 (or false false false $x1638)))
 (=> $x1243 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1638 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x456 (or false false false $x1638 $x1375)))
 (=> $x456 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x602 (or false false false $x318 $x1375)))
 (=> $x602 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x995 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x995) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1375 (and true false)))
 (let (($x995 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x995 $x1375) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x602 (or false false false $x318 $x1375)))
 (=> $x602 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x602 (or false false false $x318 $x1375)))
 (=> $x602 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x602 (or false false false $x318 $x1375)))
 (=> $x602 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x318 $x1576) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1149 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1149) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1576 (and false false)))
 (let (($x1149 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1149 $x1576) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x552 (or false false false $x318)))
 (=> $x552 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x318 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or true false false $x318 $x1576) (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1188 (or false false false or $x1375)))
 (=> $x1188 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1129 (or false false false or)))
 (=> $x1129 (bvult topo_U_6 topo_U_7))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert
 (let (($x1069 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x1069) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1069 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x1069 $x1375) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x257 (or false false false $x892 $x1375)))
 (=> $x257 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1436 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x1436) (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x1375 (and true false)))
 (let (($x1436 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x1436 $x1375) (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x257 (or false false false $x892 $x1375)))
 (=> $x257 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x1375 (and true false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x257 (or false false false $x892 $x1375)))
 (=> $x257 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x535 (or false false false $x892 $x1576)))
 (=> $x535 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x535 (or false false false $x892 $x1576)))
 (=> $x535 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x760 (or false false false $x892)))
 (=> $x760 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x1576 (and false false)))
 (let (($x892 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x535 (or false false false $x892 $x1576)))
 (=> $x535 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x555 (= co_0 (_ bv1 2))))
 (=> $x555 (= (_ bv0 32) final_x))))
(assert
 (let (($x499 (= co_2 (_ bv1 2))))
 (=> $x499 (= (_ bv1 32) final_x))))
(assert
 (let (($x35 (= co_1 (_ bv1 2))))
 (=> $x35 (= (_ bv0 32) final_y))))
(assert
 (let (($x97 (= co_6 (_ bv1 2))))
(=> $x97 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
