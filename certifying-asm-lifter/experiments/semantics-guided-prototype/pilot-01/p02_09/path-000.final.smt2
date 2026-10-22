; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x561 (= (_ bv0 32) read_t1_a)))
 (= $x561 true)))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_6) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_6_2))
(assert
 (let (($x561 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x561)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_a (_ bv1 32)) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_5 rf_3_5 rf_6_5))
(assert
 (let (($x923 (bvult co_0 co_3)))
 (let (($x647 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (not (and $x647 $x923)))))
(assert
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x660 false))))
(assert
 (let (($x770 (bvult co_6 co_3)))
 (let (($x18 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x18 $x770)))))
(assert
 (let (($x602 (bvult co_0 co_6)))
 (let (($x447 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x447 $x602)))))
(assert
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (not (and $x1040 false))))
(assert
 (let (($x401 (bvult co_3 co_6)))
 (let (($x953 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (not (and $x953 $x401)))))
(assert
 (bvult topo_U_0 (_ bv7 3)))
(assert
 (bvult topo_U_1 (_ bv7 3)))
(assert
 (bvult topo_U_2 (_ bv7 3)))
(assert
 (bvult topo_U_3 (_ bv7 3)))
(assert
 (bvult topo_U_4 (_ bv7 3)))
(assert
 (bvult topo_U_5 (_ bv7 3)))
(assert
 (bvult topo_U_6 (_ bv7 3)))
(assert
 (bvult topo_T_0 (_ bv7 3)))
(assert
 (bvult topo_T_1 (_ bv7 3)))
(assert
 (bvult topo_T_2 (_ bv7 3)))
(assert
 (bvult topo_T_3 (_ bv7 3)))
(assert
 (bvult topo_T_4 (_ bv7 3)))
(assert
 (bvult topo_T_5 (_ bv7 3)))
(assert
 (bvult topo_T_6 (_ bv7 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x647 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x647) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x717 (and true false)))
 (let (($x647 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x647 $x717) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x970 (or false false false $x660)))
 (=> $x970 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x717 (and true false)))
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x696 (or false false false $x660 $x717)))
 (=> $x696 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x970 (or false false false $x660)))
 (=> $x970 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x660 $x1002) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x655 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x655) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1002 (and false false)))
 (let (($x655 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x655 $x1002) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x970 (or false false false $x660)))
 (=> $x970 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x717 (and true false)))
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x696 (or false false false $x660 $x717)))
 (=> $x696 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x970 (or false false false $x660)))
 (=> $x970 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x717 (and true false)))
 (let (($x660 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x696 (or false false false $x660 $x717)))
 (=> $x696 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x18 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x18) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x717 (and true false)))
 (let (($x18 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x18 $x717) (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x717 (and true false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x220 (or false false false $x1482 $x717)))
 (=> $x220 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x717 (and true false)))
 (let (($x1129 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1129 $x717) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x717 (and true false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x220 (or false false false $x1482 $x717)))
 (=> $x220 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x717 (and true false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x220 (or false false false $x1482 $x717)))
 (=> $x220 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (=> (or false false false $x1482 $x1002) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1668 (or true false false $x1482 $x1002)))
 (=> $x1668 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1481 (or false false false $x1482)))
 (=> $x1481 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1482 (or (and rf_1_4 false))))
 (let (($x1668 (or true false false $x1482 $x1002)))
 (=> $x1668 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x447 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x447) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x717 (and true false)))
 (let (($x447 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x447 $x717) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1566 (or false false false $x1040)))
 (=> $x1566 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x717 (and true false)))
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1747 (or false false false $x1040 $x717)))
 (=> $x1747 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1566 (or false false false $x1040)))
 (=> $x1566 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x717 (and true false)))
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1747 (or false false false $x1040 $x717)))
 (=> $x1747 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x953 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x953) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x717 (and true false)))
 (let (($x953 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x953 $x717) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1566 (or false false false $x1040)))
 (=> $x1566 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1614 (or false false false $x1040 $x1002)))
 (=> $x1614 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1566 (or false false false $x1040)))
 (=> $x1566 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1040 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1614 (or false false false $x1040 $x1002)))
 (=> $x1614 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x1696 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1696) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1002 (and false false)))
 (let (($x1696 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1696 $x1002) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x717 (and true false)))
 (let (($x35 (or false false false or $x717)))
 (=> $x35 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false (bvult co_6 co_3) or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert
 (let (($x821 (or false false false or)))
 (=> $x821 (bvult topo_U_6 topo_U_4))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1625 (= co_3 (_ bv2 2))))
 (=> $x1625 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1724 (= co_6 (_ bv2 2))))
 (=> $x1724 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x1603 (= (_ bv0 32) final_y)))
 (let (($x188 (= co_1 (_ bv0 1))))
 (=> $x188 $x1603))))
(assert
 (let (($x1501 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x822 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1557 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1487 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1700 (and (distinct rf_6_5 false) true)))
 (let (($x1533 (and (distinct rf_3_5 true) true)))
 (let (($x1666 (and (distinct rf_0_5 false) true)))
 (let (($x1502 (and (distinct rf_1_4 true) true)))
 (let (($x1523 (and (distinct rf_6_2 false) true)))
 (let (($x1521 (and (distinct rf_3_2 false) true)))
 (let (($x1663 (and (distinct rf_0_2 true) true)))
 (let (($x1518 (and (distinct (_ bv1 32) read_t1_yes) true)))
 (let (($x1536 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1584 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1578 (and (distinct input_b false) true)))
 (or $x1578 $x1584 $x1536 $x1518 $x1663 $x1521 $x1523 $x1502 $x1666 $x1533 $x1700 $x1487 $x1557 $x822 $x1501)))))))))))))))))
(assert
 (let (($x1501 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x822 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1557 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1487 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1700 (and (distinct rf_6_5 false) true)))
 (let (($x1533 (and (distinct rf_3_5 true) true)))
 (let (($x1666 (and (distinct rf_0_5 false) true)))
 (let (($x1502 (and (distinct rf_1_4 true) true)))
 (let (($x1523 (and (distinct rf_6_2 false) true)))
 (let (($x1521 (and (distinct rf_3_2 false) true)))
 (let (($x1663 (and (distinct rf_0_2 true) true)))
 (let (($x1518 (and (distinct (_ bv1 32) read_t1_yes) true)))
 (let (($x1536 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1584 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x931 (and (distinct input_b true) true)))
 (or $x931 $x1584 $x1536 $x1518 $x1663 $x1521 $x1523 $x1502 $x1666 $x1533 $x1700 $x1487 $x1557 $x822 $x1501)))))))))))))))))
(assert
 (let (($x1501 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x852 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x515 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x1487 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1700 (and (distinct rf_6_5 false) true)))
 (let (($x146 (and (distinct rf_3_5 false) true)))
 (let (($x592 (and (distinct rf_0_5 true) true)))
 (let (($x1502 (and (distinct rf_1_4 true) true)))
 (let (($x8 (and (distinct rf_6_2 true) true)))
 (let (($x1521 (and (distinct rf_3_2 false) true)))
 (let (($x143 (and (distinct rf_0_2 false) true)))
 (let (($x966 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1536 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x782 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x1578 (and (distinct input_b false) true)))
 (or $x1578 $x782 $x1536 $x966 $x143 $x1521 $x8 $x1502 $x592 $x146 $x1700 $x1487 $x515 $x852 $x1501)))))))))))))))))
(assert
 (let (($x1501 (and (distinct (_ bv0 1) co_1) true)))
(let (($x852 (and (distinct (_ bv1 2) co_6) true)))
(let (($x515 (and (distinct (_ bv2 2) co_3) true)))
(let (($x1487 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1700 (and (distinct rf_6_5 false) true)))
(let (($x146 (and (distinct rf_3_5 false) true)))
(let (($x592 (and (distinct rf_0_5 true) true)))
(let (($x1502 (and (distinct rf_1_4 true) true)))
(let (($x8 (and (distinct rf_6_2 true) true)))
(let (($x1521 (and (distinct rf_3_2 false) true)))
(let (($x143 (and (distinct rf_0_2 false) true)))
(let (($x966 (and (distinct (_ bv0 32) read_t1_yes) true)))
(let (($x1536 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x782 (and (distinct (_ bv1 32) read_t0_a) true)))
(let (($x931 (and (distinct input_b true) true)))
(or $x931 $x782 $x1536 $x966 $x143 $x1521 $x8 $x1502 $x592 $x146 $x1700 $x1487 $x515 $x852 $x1501)))))))))))))))))
(check-sat)
