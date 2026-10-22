; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
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
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_7 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_2_7))
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
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x304 (and false false)))
 (let (($x408 (or false true false or $x304)))
 (=> $x408 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false rf_2_7 false or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_2_7)) (bvult topo_T_2 topo_T_7)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x468 (and true false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1600 (or false false false $x722 $x468)))
 (=> $x1600 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1402 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1402) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x468 (and true false)))
 (let (($x1402 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1402 $x468) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x304 (and false false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1266 (or false false false $x722 $x304)))
 (=> $x1266 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x304 (and false false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1266 (or false false false $x722 $x304)))
 (=> $x1266 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x304 (and false false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1266 (or false false false $x722 $x304)))
 (=> $x1266 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1608 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1608) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x468 (and true false)))
 (let (($x1608 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1608 $x468) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x468 (and true false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1600 (or false false false $x722 $x468)))
 (=> $x1600 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x999 (or false false false $x722)))
 (=> $x999 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x468 (and true false)))
 (let (($x722 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1600 (or false false false $x722 $x468)))
 (=> $x1600 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x304 (and false false)))
 (let (($x408 (or false true false or $x304)))
 (=> $x408 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x468 (and true false)))
 (let (($x1045 (or false false false or $x468)))
 (=> $x1045 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_6))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x570 (or false false false or)))
 (=> $x570 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x304 (and false false)))
 (let (($x1391 (or false false false or $x304)))
 (=> $x1391 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x322 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x322) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x468 (and true false)))
 (let (($x322 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x322 $x468) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x468 (and true false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x112 (or false false false $x289 $x468)))
 (=> $x112 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1267 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x1267) (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x468 (and true false)))
 (let (($x1267 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x1267 $x468) (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x468 (and true false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x112 (or false false false $x289 $x468)))
 (=> $x112 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x468 (and true false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x112 (or false false false $x289 $x468)))
 (=> $x112 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x304 (and false false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x753 (or false false false $x289 $x304)))
 (=> $x753 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x304 (and false false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x753 (or false false false $x289 $x304)))
 (=> $x753 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x727 (or false false false $x289)))
 (=> $x727 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x304 (and false false)))
 (let (($x289 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x753 (or false false false $x289 $x304)))
 (=> $x753 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x932 (= co_0 (_ bv1 2))))
 (=> $x932 (= (_ bv0 32) final_x))))
(assert
 (let (($x99 (= co_2 (_ bv1 2))))
 (=> $x99 (= (_ bv1 32) final_x))))
(assert
 (let (($x1249 (= co_1 (_ bv1 2))))
 (=> $x1249 (= (_ bv0 32) final_y))))
(assert
 (let (($x1647 (= co_5 (_ bv1 2))))
(=> $x1647 (= (_ bv1 32) final_y))))
(check-sat)
