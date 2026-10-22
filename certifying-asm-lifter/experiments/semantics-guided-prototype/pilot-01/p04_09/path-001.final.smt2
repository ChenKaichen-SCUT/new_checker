; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_2_6 () Bool)
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
(assert
 true)
(assert
 (let (($x615 (= (_ bv0 32) read_t1_a)))
 (= $x615 false)))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_7) true))
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
 (let (($x615 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x615)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_no)))
(assert
 (=> rf_2_6 (= (_ bv1 32) read_t1_no)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_6 rf_2_6 rf_7_6))
(assert
 (let (($x828 (bvult co_0 co_7)))
 (let (($x361 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x361 $x828)))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (not (and $x740 false))))
(assert
 (let (($x1011 (bvult co_2 co_7)))
 (let (($x966 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (not (and $x966 $x1011)))))
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
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1180 (or false false false or $x1678)))
 (=> $x1180 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (=> (or false false (bvult co_2 co_7) or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false (bvult co_2 co_7) or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1180 (or false false false or $x1678)))
 (=> $x1180 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1180 (or false false false or $x1678)))
 (=> $x1180 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1180 (or false false false or $x1678)))
 (=> $x1180 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x634 (or false false false $x1619 $x405)))
 (=> $x634 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x405 (and true false)))
 (let (($x999 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x999 $x405) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1537 (or false false false $x1619 $x1678)))
 (=> $x1537 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1537 (or false false false $x1619 $x1678)))
 (=> $x1537 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1537 (or false false false $x1619 $x1678)))
 (=> $x1537 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x634 (or false false false $x1619 $x405)))
 (=> $x634 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x634 (or false false false $x1619 $x405)))
 (=> $x634 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x1125 (or false false false $x1619)))
 (=> $x1125 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1619 (or (and rf_1_4 false))))
 (let (($x634 (or false false false $x1619 $x405)))
 (=> $x634 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1335 (or false false false $x1526 $x405)))
 (=> $x1335 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x405 (and true false)))
 (let (($x422 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x422 $x405) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1335 (or false false false $x1526 $x405)))
 (=> $x1335 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1335 (or false false false $x1526 $x405)))
 (=> $x1335 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x405 (and true false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1335 (or false false false $x1526 $x405)))
 (=> $x1335 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (=> (or false false false $x1526 $x1678) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x32 (or true false false $x1526 $x1678)))
 (=> $x32 (bvult topo_T_5 topo_T_6))))))
(assert
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x1730 (or false false false $x1526)))
 (=> $x1730 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1526 (or (and rf_1_5 false))))
 (let (($x32 (or true false false $x1526 $x1678)))
 (=> $x32 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x361 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x361) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x405 (and true false)))
 (let (($x361 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x361 $x405) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x370 (or false false false $x740)))
 (=> $x370 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x405 (and true false)))
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1062 (or false false false $x740 $x405)))
 (=> $x1062 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x966 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (=> (or false false false $x966) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x405 (and true false)))
 (let (($x966 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (=> (or false false false $x966 $x405) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x370 (or false false false $x740)))
 (=> $x370 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x405 (and true false)))
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1062 (or false false false $x740 $x405)))
 (=> $x1062 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x370 (or false false false $x740)))
 (=> $x370 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x405 (and true false)))
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1062 (or false false false $x740 $x405)))
 (=> $x1062 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x370 (or false false false $x740)))
 (=> $x370 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1089 (or false false false $x740 $x1678)))
 (=> $x1089 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x370 (or false false false $x740)))
 (=> $x370 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1678 (and false false)))
 (let (($x740 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1089 (or false false false $x740 $x1678)))
 (=> $x1089 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1140 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_2_6 (bvult co_2 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1140) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1140 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_2_6 (bvult co_2 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1140 $x1678) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false false (bvult co_7 co_2) or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false (bvult co_7 co_2) or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x405 (and true false)))
 (let (($x279 (or false false false or $x405)))
 (=> $x279 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x1703 (or false false false or)))
 (=> $x1703 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x1678 (and false false)))
 (let (($x1180 (or false false false or $x1678)))
 (=> $x1180 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x156 (= co_0 (_ bv2 2))))
 (=> $x156 (= (_ bv0 32) final_x))))
(assert
 (let (($x1037 (= co_2 (_ bv2 2))))
 (=> $x1037 (= (_ bv1 32) final_x))))
(assert
 (let (($x217 (= co_7 (_ bv2 2))))
 (=> $x217 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (let (($x1047 (= co_1 (_ bv0 1))))
(=> $x1047 (= (_ bv0 32) final_y))))
(check-sat)
