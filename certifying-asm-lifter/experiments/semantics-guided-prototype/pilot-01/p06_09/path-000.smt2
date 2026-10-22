; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
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
 (let (($x71 (= (_ bv0 32) read_t1_a)))
 (= $x71 true)))
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
 (=> rf_7_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_7_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (let (($x71 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x71)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_yes)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_6 rf_3_6 rf_7_6))
(assert
 (let (($x1392 (bvult co_0 co_3)))
 (let (($x1611 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (not (and $x1611 $x1392)))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (not (and $x1215 false))))
(assert
 (let (($x1277 (bvult co_7 co_3)))
 (let (($x1098 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (not (and $x1098 $x1277)))))
(assert
 (let (($x839 (bvult co_0 co_7)))
 (let (($x1384 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x1384 $x839)))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (not (and $x466 false))))
(assert
 (let (($x1676 (bvult co_3 co_7)))
 (let (($x1059 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (not (and $x1059 $x1676)))))
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
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1611 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x1611) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x587 (and true false)))
 (let (($x1611 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x1611 $x587) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x277 (or false false false $x1215)))
 (=> $x277 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1974 (or false false false $x1215 $x587)))
 (=> $x1974 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x277 (or false false false $x1215)))
 (=> $x277 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x636 (and false false)))
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (=> (or false false false $x1215 $x636) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x182 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x182) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x636 (and false false)))
 (let (($x182 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x182 $x636) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x277 (or false false false $x1215)))
 (=> $x277 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x636 (and false false)))
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (=> (or true false false $x1215 $x636) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x277 (or false false false $x1215)))
 (=> $x277 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1974 (or false false false $x1215 $x587)))
 (=> $x1974 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x277 (or false false false $x1215)))
 (=> $x277 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1215 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1974 (or false false false $x1215 $x587)))
 (=> $x1974 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1098 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1098) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x587 (and true false)))
 (let (($x1098 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1098 $x587) (bvult topo_T_2 topo_T_7)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (=> (or false false (bvult co_3 co_7) or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false (bvult co_3 co_7) or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1780 (or false false false $x1477 $x587)))
 (=> $x1780 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x587 (and true false)))
 (let (($x1566 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1566 $x587) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x636 (and false false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1101 (or false false false $x1477 $x636)))
 (=> $x1101 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x636 (and false false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1101 (or false false false $x1477 $x636)))
 (=> $x1101 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x636 (and false false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1101 (or false false false $x1477 $x636)))
 (=> $x1101 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1780 (or false false false $x1477 $x587)))
 (=> $x1780 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1780 (or false false false $x1477 $x587)))
 (=> $x1780 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x2033 (or false false false $x1477)))
 (=> $x2033 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x587 (and true false)))
 (let (($x1477 (or (and rf_1_4 false))))
 (let (($x1780 (or false false false $x1477 $x587)))
 (=> $x1780 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x587 (and true false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1743 (or false false false $x889 $x587)))
 (=> $x1743 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x587 (and true false)))
 (let (($x1778 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x1778 $x587) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x587 (and true false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1743 (or false false false $x889 $x587)))
 (=> $x1743 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x587 (and true false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1743 (or false false false $x889 $x587)))
 (=> $x1743 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x587 (and true false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1743 (or false false false $x889 $x587)))
 (=> $x1743 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x636 (and false false)))
 (let (($x889 (or (and rf_1_5 false))))
 (=> (or false false false $x889 $x636) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x636 (and false false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1643 (or true false false $x889 $x636)))
 (=> $x1643 (bvult topo_T_5 topo_T_6))))))
(assert
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1132 (or false false false $x889)))
 (=> $x1132 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x636 (and false false)))
 (let (($x889 (or (and rf_1_5 false))))
 (let (($x1643 (or true false false $x889 $x636)))
 (=> $x1643 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x1384 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x1384) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x587 (and true false)))
 (let (($x1384 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x1384 $x587) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1856 (or false false false $x466)))
 (=> $x1856 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x587 (and true false)))
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1820 (or false false false $x466 $x587)))
 (=> $x1820 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1856 (or false false false $x466)))
 (=> $x1856 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x587 (and true false)))
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1820 (or false false false $x466 $x587)))
 (=> $x1820 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1059 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x1059) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x587 (and true false)))
 (let (($x1059 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)) (and rf_7_6 (bvult co_7 co_3)))))
 (=> (or false false false $x1059 $x587) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1856 (or false false false $x466)))
 (=> $x1856 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x587 (and true false)))
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1820 (or false false false $x466 $x587)))
 (=> $x1820 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1856 (or false false false $x466)))
 (=> $x1856 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x636 (and false false)))
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1961 (or false false false $x466 $x636)))
 (=> $x1961 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1856 (or false false false $x466)))
 (=> $x1856 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x636 (and false false)))
 (let (($x466 (or (and rf_0_6 false) (and rf_3_6 false) (and rf_7_6 false))))
 (let (($x1961 (or false false false $x466 $x636)))
 (=> $x1961 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1949 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1949) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x636 (and false false)))
 (let (($x1949 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_3_6 (bvult co_3 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1949 $x636) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (=> (or false false (bvult co_7 co_3) or) (bvult topo_U_7 topo_U_3)))
(assert
 (=> (or false false (bvult co_7 co_3) or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x587 (and true false)))
 (let (($x1051 (or false false false or $x587)))
 (=> $x1051 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x523 (or false false false or)))
 (=> $x523 (bvult topo_U_7 topo_U_5))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x2051 (= co_0 (_ bv2 2))))
 (=> $x2051 (= (_ bv0 32) final_x))))
(assert
 (let (($x1910 (= co_3 (_ bv2 2))))
 (=> $x1910 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x2021 (= co_7 (_ bv2 2))))
 (=> $x2021 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x256 (= co_1 (_ bv0 1))))
(=> $x256 (= (_ bv0 32) final_y))))
(check-sat)
