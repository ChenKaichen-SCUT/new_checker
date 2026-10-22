; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
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
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_5 co_6) true))
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
 (=> rf_6_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_6_4))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_3_7))
(assert
 (let (($x1316 (bvult co_0 co_3)))
 (let (($x1035 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1035 $x1316)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (not (and $x554 false))))
(assert
 (let (($x483 (bvult co_1 co_5)))
 (let (($x1046 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (not (and $x1046 $x483)))))
(assert
 (let (($x191 (bvult co_6 co_5)))
 (let (($x752 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (not (and $x752 $x191)))))
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
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1035 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1035) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x343 (and true false)))
 (let (($x1035 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1035 $x343) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x283 (or false false false $x1744 $x343)))
 (=> $x283 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x973 (and false false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1744 $x973) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x462 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x462) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x973 (and false false)))
 (let (($x462 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x462 $x973) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x973 (and false false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1263 (or true false false $x1744 $x973)))
 (=> $x1263 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x973 (and false false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1263 (or true false false $x1744 $x973)))
 (=> $x1263 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x283 (or false false false $x1744 $x343)))
 (=> $x283 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x98 (or false false false $x1744)))
 (=> $x98 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1744 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x283 (or false false false $x1744 $x343)))
 (=> $x283 (bvult topo_T_2 topo_T_7))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x973 (and false false)))
 (let (($x1787 (or true false false or $x973)))
 (=> $x1787 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x973 (and false false)))
 (let (($x1787 (or true false false or $x973)))
 (=> $x1787 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1748 (or false false false $x554)))
 (=> $x1748 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x343 (and true false)))
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x889 (or false false false $x554 $x343)))
 (=> $x889 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1046 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1046) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x343 (and true false)))
 (let (($x1046 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1046 $x343) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1748 (or false false false $x554)))
 (=> $x1748 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x973 (and false false)))
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1845 (or false false false $x554 $x973)))
 (=> $x1845 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1748 (or false false false $x554)))
 (=> $x1748 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x973 (and false false)))
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1845 (or false false false $x554 $x973)))
 (=> $x1845 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1748 (or false false false $x554)))
 (=> $x1748 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x973 (and false false)))
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1845 (or false false false $x554 $x973)))
 (=> $x1845 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1571 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1571) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x973 (and false false)))
 (let (($x1571 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1571 $x973) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x752 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x752) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x343 (and true false)))
 (let (($x752 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x752 $x343) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1748 (or false false false $x554)))
 (=> $x1748 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x343 (and true false)))
 (let (($x554 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x889 (or false false false $x554 $x343)))
 (=> $x889 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x973 (and false false)))
 (let (($x1542 (or false false false or $x973)))
 (=> $x1542 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x973 (and false false)))
 (let (($x1542 (or false false false or $x973)))
 (=> $x1542 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false false (bvult co_5 co_6) or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false (bvult co_5 co_6) or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x343 (and true false)))
 (let (($x34 (or false false false or $x343)))
 (=> $x34 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false false (bvult co_6 co_5) or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false (bvult co_6 co_5) or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1313 (or false false false or)))
 (=> $x1313 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x973 (and false false)))
 (let (($x1542 (or false false false or $x973)))
 (=> $x1542 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1090 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x1090) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x343 (and true false)))
 (let (($x1090 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x1090 $x343) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x846 (or false false false $x1667 $x343)))
 (=> $x846 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x846 (or false false false $x1667 $x343)))
 (=> $x846 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x638 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x638) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x343 (and true false)))
 (let (($x638 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x638 $x343) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x846 (or false false false $x1667 $x343)))
 (=> $x846 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x343 (and true false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x846 (or false false false $x1667 $x343)))
 (=> $x846 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x973 (and false false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x234 (or false false false $x1667 $x973)))
 (=> $x234 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1602 (or false false false $x1667)))
 (=> $x1602 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x973 (and false false)))
 (let (($x1667 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x234 (or false false false $x1667 $x973)))
 (=> $x234 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2071 (= co_0 (_ bv1 2))))
 (=> $x2071 (= (_ bv0 32) final_x))))
(assert
 (let (($x1910 (= co_3 (_ bv1 2))))
 (=> $x1910 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x211 (= co_1 (_ bv2 2))))
 (=> $x211 (= (_ bv0 32) final_y))))
(assert
 (let (($x1628 (= co_5 (_ bv2 2))))
 (=> $x1628 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x295 (= co_6 (_ bv2 2))))
(=> $x295 (= (_ bv1 32) final_y))))
(check-sat)
