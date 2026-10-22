; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
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
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_6) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_6_5))
(assert
 (=> rf_1_7 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_1_7))
(assert
 (let (($x384 (bvult co_0 co_6)))
 (let (($x141 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x141 $x384)))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (not (and $x558 false))))
(assert
 (let (($x121 (bvult co_2 co_6)))
 (let (($x1175 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (not (and $x1175 $x121)))))
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
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_0 topo_T_7)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x124 (and false false)))
 (let (($x1265 (or false false false or $x124)))
 (=> $x1265 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false (bvult co_2 co_6) or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_2 topo_T_7)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x124 (and false false)))
 (let (($x1265 (or false false false or $x124)))
 (=> $x1265 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x124 (and false false)))
 (let (($x1265 (or false false false or $x124)))
 (=> $x1265 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x124 (and false false)))
 (let (($x1265 (or false false false or $x124)))
 (=> $x1265 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x658 (and true false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1169 (or false false false $x279 $x658)))
 (=> $x1169 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x658 (and true false)))
 (let (($x1499 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1499 $x658) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x124 (and false false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x279 $x124)))
 (=> $x490 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x124 (and false false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x279 $x124)))
 (=> $x490 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x124 (and false false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x279 $x124)))
 (=> $x490 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x658 (and true false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1169 (or false false false $x279 $x658)))
 (=> $x1169 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x658 (and true false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1169 (or false false false $x279 $x658)))
 (=> $x1169 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1235 (or false false false $x279)))
 (=> $x1235 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x658 (and true false)))
 (let (($x279 (or (and rf_1_4 false))))
 (let (($x1169 (or false false false $x279 $x658)))
 (=> $x1169 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x141 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x141) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x658 (and true false)))
 (let (($x141 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x141 $x658) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x823 (or false false false $x558)))
 (=> $x823 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x658 (and true false)))
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x831 (or false false false $x558 $x658)))
 (=> $x831 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1175 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x1175) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x658 (and true false)))
 (let (($x1175 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x1175 $x658) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x823 (or false false false $x558)))
 (=> $x823 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x658 (and true false)))
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x831 (or false false false $x558 $x658)))
 (=> $x831 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x823 (or false false false $x558)))
 (=> $x823 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x658 (and true false)))
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x831 (or false false false $x558 $x658)))
 (=> $x831 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x823 (or false false false $x558)))
 (=> $x823 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x124 (and false false)))
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (=> (or false false false $x558 $x124) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x852 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x852) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x124 (and false false)))
 (let (($x852 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x852 $x124) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x823 (or false false false $x558)))
 (=> $x823 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x124 (and false false)))
 (let (($x558 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (=> (or true false false $x558 $x124) (bvult topo_T_5 topo_T_7)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false (bvult co_6 co_2) or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x658 (and true false)))
 (let (($x126 (or false false false or $x658)))
 (=> $x126 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_6 topo_U_7))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_0)))))
(assert
 (let (($x658 (and true false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x1319 (or false false false $x1623 $x658)))
 (=> $x1319 (bvult topo_T_7 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_7 (bvult co_1 co_1)))) (bvult topo_U_7 topo_U_1)))
(assert
 (let (($x658 (and true false)))
 (let (($x828 (or (and rf_1_7 (bvult co_1 co_1)))))
 (=> (or false false false $x828 $x658) (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x658 (and true false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x1319 (or false false false $x1623 $x658)))
 (=> $x1319 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x658 (and true false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x1319 (or false false false $x1623 $x658)))
 (=> $x1319 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x658 (and true false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x1319 (or false false false $x1623 $x658)))
 (=> $x1319 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x124 (and false false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x182 (or false false false $x1623 $x124)))
 (=> $x182 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x124 (and false false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x182 (or false false false $x1623 $x124)))
 (=> $x182 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x778 (or false false false $x1623)))
 (=> $x778 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x124 (and false false)))
 (let (($x1623 (or (and rf_1_7 false))))
 (let (($x182 (or false false false $x1623 $x124)))
 (=> $x182 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x117 (= co_0 (_ bv2 2))))
 (=> $x117 (= (_ bv0 32) final_x))))
(assert
 (let (($x176 (= co_2 (_ bv2 2))))
 (=> $x176 (= (_ bv1 32) final_x))))
(assert
 (let (($x1465 (= co_6 (_ bv2 2))))
 (=> $x1465 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x325 (= co_1 (_ bv0 1))))
(=> $x325 (= (_ bv0 32) final_y))))
(check-sat)
