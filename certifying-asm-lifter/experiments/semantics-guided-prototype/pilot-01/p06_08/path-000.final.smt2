; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
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
 (= input_b true))
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
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
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
 (let (($x152 (= (_ bv0 32) read_t1_b)))
 (=> rf_1_7 $x152)))
(assert
 ((_ pbeq 1 1) rf_1_7))
(assert
 (let (($x1447 (bvult co_0 co_3)))
 (let (($x1436 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (not (and $x1436 $x1447)))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x1070 false))))
(assert
 (let (($x1277 (bvult co_6 co_3)))
 (let (($x1314 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x1314 $x1277)))))
(assert
 (let (($x390 (bvult co_0 co_6)))
 (let (($x69 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x69 $x390)))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (not (and $x1584 false))))
(assert
 (let (($x1059 (bvult co_3 co_6)))
 (let (($x1280 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (not (and $x1280 $x1059)))))
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
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_0 topo_T_7)))))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert
 (let (($x1436 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1436) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x976 (and true false)))
 (let (($x1436 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1436 $x976) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x785 (or false false false $x1070)))
 (=> $x785 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1408 (or false false false $x1070 $x976)))
 (=> $x1408 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x785 (or false false false $x1070)))
 (=> $x785 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x1070 $x890) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x979 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x979) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x890 (and false false)))
 (let (($x979 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x979 $x890) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x785 (or false false false $x1070)))
 (=> $x785 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or true false false $x1070 $x890) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x785 (or false false false $x1070)))
 (=> $x785 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1408 (or false false false $x1070 $x976)))
 (=> $x1408 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1314 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1314) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x976 (and true false)))
 (let (($x1314 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1314 $x976) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x785 (or false false false $x1070)))
 (=> $x785 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1070 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1408 (or false false false $x1070 $x976)))
 (=> $x1408 (bvult topo_T_2 topo_T_7))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x890 (and false false)))
 (let (($x670 (or true false false or $x890)))
 (=> $x670 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x821 (or false false false $x1375 $x976)))
 (=> $x821 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x976 (and true false)))
 (let (($x1442 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1442 $x976) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x561 (or false false false $x1375 $x890)))
 (=> $x561 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x561 (or false false false $x1375 $x890)))
 (=> $x561 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x561 (or false false false $x1375 $x890)))
 (=> $x561 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x821 (or false false false $x1375 $x976)))
 (=> $x821 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x821 (or false false false $x1375 $x976)))
 (=> $x821 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x20 (or false false false $x1375)))
 (=> $x20 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1375 (or (and rf_1_4 false))))
 (let (($x821 (or false false false $x1375 $x976)))
 (=> $x821 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x69 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x69) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x976 (and true false)))
 (let (($x69 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x69 $x976) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1095 (or false false false $x1584)))
 (=> $x1095 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1904 (or false false false $x1584 $x976)))
 (=> $x1904 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1095 (or false false false $x1584)))
 (=> $x1095 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1904 (or false false false $x1584 $x976)))
 (=> $x1904 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1280 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x1280) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x976 (and true false)))
 (let (($x1280 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x1280 $x976) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1095 (or false false false $x1584)))
 (=> $x1095 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1904 (or false false false $x1584 $x976)))
 (=> $x1904 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1095 (or false false false $x1584)))
 (=> $x1095 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or false false false $x1584 $x890) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x146 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x146) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x890 (and false false)))
 (let (($x146 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x146 $x890) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1095 (or false false false $x1584)))
 (=> $x1095 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1584 (or (and rf_0_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or true false false $x1584 $x890) (bvult topo_T_5 topo_T_7)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false (bvult co_6 co_3) or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x976 (and true false)))
 (let (($x1676 (or false false false or $x976)))
 (=> $x1676 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x766 (or false false false or)))
 (=> $x766 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x890 (and false false)))
 (let (($x670 (or true false false or $x890)))
 (=> $x670 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_0)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x82 (or false false false $x1577 $x976)))
 (=> $x82 (bvult topo_T_7 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_7 (bvult co_1 co_1)))) (bvult topo_U_7 topo_U_1)))
(assert
 (let (($x976 (and true false)))
 (let (($x797 (or (and rf_1_7 (bvult co_1 co_1)))))
 (=> (or false false false $x797 $x976) (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x82 (or false false false $x1577 $x976)))
 (=> $x82 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x82 (or false false false $x1577 $x976)))
 (=> $x82 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x976 (and true false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x82 (or false false false $x1577 $x976)))
 (=> $x82 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x566 (or false false false $x1577 $x890)))
 (=> $x566 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x566 (or false false false $x1577 $x890)))
 (=> $x566 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x1626 (or false false false $x1577)))
 (=> $x1626 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x890 (and false false)))
 (let (($x1577 (or (and rf_1_7 false))))
 (let (($x566 (or false false false $x1577 $x890)))
 (=> $x566 (bvult topo_T_7 topo_T_7))))))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x675 (= co_3 (_ bv2 2))))
 (=> $x675 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1697 (= co_6 (_ bv2 2))))
 (=> $x1697 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x860 (= (_ bv0 32) final_y)))
 (let (($x2259 (= co_1 (_ bv0 1))))
 (=> $x2259 $x860))))
(assert
 (let (($x1653 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1871 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x900 (and (distinct rf_1_7 true) true)))
 (let (($x38 (and (distinct rf_6_5 false) true)))
 (let (($x288 (and (distinct rf_1_4 true) true)))
 (let (($x1144 (and (distinct rf_3_2 false) true)))
 (let (($x5 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x969 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1177 (and (distinct input_b true) true)))
 (or $x1177 (and (distinct (_ bv0 32) read_t0_a) true) $x969 (and (distinct (_ bv1 32) read_t1_yes) true) $x5 (and (distinct rf_0_2 true) true) $x1144 (and (distinct rf_6_2 false) true) $x288 (and (distinct rf_0_5 false) true) (and (distinct rf_3_5 true) true) $x38 $x900 $x1871 (and (distinct (_ bv1 2) co_3) true) (and (distinct (_ bv2 2) co_6) true) $x1653)))))))))))
(assert
 (let (($x1653 (and (distinct (_ bv0 1) co_1) true)))
(let (($x1871 (and (distinct (_ bv0 2) co_0) true)))
(let (($x900 (and (distinct rf_1_7 true) true)))
(let (($x38 (and (distinct rf_6_5 false) true)))
(let (($x288 (and (distinct rf_1_4 true) true)))
(let (($x1144 (and (distinct rf_3_2 false) true)))
(let (($x5 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x969 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x1177 (and (distinct input_b true) true)))
(or $x1177 (and (distinct (_ bv1 32) read_t0_a) true) $x969 (and (distinct (_ bv0 32) read_t1_yes) true) $x5 (and (distinct rf_0_2 false) true) $x1144 (and (distinct rf_6_2 true) true) $x288 (and (distinct rf_0_5 true) true) (and (distinct rf_3_5 false) true) $x38 $x900 $x1871 (and (distinct (_ bv2 2) co_3) true) (and (distinct (_ bv1 2) co_6) true) $x1653)))))))))))
(check-sat)
