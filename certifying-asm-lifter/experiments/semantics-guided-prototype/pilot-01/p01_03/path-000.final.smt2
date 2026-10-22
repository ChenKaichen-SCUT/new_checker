; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_2_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
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
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_4 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_2_4))
(assert
 (bvult topo_U_0 (_ bv5 3)))
(assert
 (bvult topo_U_1 (_ bv5 3)))
(assert
 (bvult topo_U_2 (_ bv5 3)))
(assert
 (bvult topo_U_3 (_ bv5 3)))
(assert
 (bvult topo_U_4 (_ bv5 3)))
(assert
 (bvult topo_T_0 (_ bv5 3)))
(assert
 (bvult topo_T_1 (_ bv5 3)))
(assert
 (bvult topo_T_2 (_ bv5 3)))
(assert
 (bvult topo_T_3 (_ bv5 3)))
(assert
 (bvult topo_T_4 (_ bv5 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_2 topo_T_3)))))
(assert
 (=> (or false rf_2_4 false or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_2_4)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x604 (and true false)))
 (let (($x809 (or false false false or $x604)))
 (=> $x809 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1113 (or false false false or)))
 (=> $x1113 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x15 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)))))
 (=> (or false false false $x15) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x604 (and true false)))
 (let (($x15 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)))))
 (=> (or false false false $x15 $x604) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (let (($x512 (or false false false $x43)))
 (=> $x512 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x604 (and true false)))
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (=> (or false false false $x43 $x604) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x643 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)))))
 (=> (or false false false $x643) (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x604 (and true false)))
 (let (($x643 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)))))
 (=> (or false false false $x643 $x604) (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (let (($x512 (or false false false $x43)))
 (=> $x512 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x617 (and false false)))
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (let (($x661 (or false false false $x43 $x617)))
 (=> $x661 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (let (($x512 (or false false false $x43)))
 (=> $x512 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x617 (and false false)))
 (let (($x43 (or (and rf_0_4 false) (and rf_2_4 false))))
 (let (($x661 (or false false false $x43 $x617)))
 (=> $x661 (bvult topo_T_4 topo_T_4))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x219 (= (_ bv1 32) final_x)))
 (let (($x586 (= co_2 (_ bv1 2))))
 (=> $x586 $x219))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1049 (= (_ bv1 32) final_y)))
 (let (($x626 (= co_3 (_ bv1 2))))
 (=> $x626 $x1049))))
(assert
 (let (($x362 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x848 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x311 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x488 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x248 (and (distinct rf_2_4 false) true)))
 (let (($x270 (and (distinct rf_0_4 true) true)))
 (let (($x1056 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1109 (and (distinct input_b false) true)))
 (or $x1109 $x1056 $x270 $x248 $x488 $x311 $x848 $x362))))))))))
(assert
 (let (($x362 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x848 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x311 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x488 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x792 (and (distinct rf_2_4 true) true)))
 (let (($x522 (and (distinct rf_0_4 false) true)))
 (let (($x762 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1109 (and (distinct input_b false) true)))
 (or $x1109 $x762 $x522 $x792 $x488 $x311 $x848 $x362))))))))))
(assert
 (let (($x362 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x848 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x311 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x488 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x792 (and (distinct rf_2_4 true) true)))
 (let (($x522 (and (distinct rf_0_4 false) true)))
 (let (($x762 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x647 (and (distinct input_b true) true)))
 (or $x647 $x762 $x522 $x792 $x488 $x311 $x848 $x362))))))))))
(assert
 (let (($x362 (and (distinct (_ bv1 2) co_3) true)))
(let (($x848 (and (distinct (_ bv0 2) co_1) true)))
(let (($x311 (and (distinct (_ bv1 2) co_2) true)))
(let (($x488 (and (distinct (_ bv0 2) co_0) true)))
(let (($x248 (and (distinct rf_2_4 false) true)))
(let (($x270 (and (distinct rf_0_4 true) true)))
(let (($x1056 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x647 (and (distinct input_b true) true)))
(or $x647 $x1056 $x270 $x248 $x488 $x311 $x848 $x362))))))))))
(check-sat)
