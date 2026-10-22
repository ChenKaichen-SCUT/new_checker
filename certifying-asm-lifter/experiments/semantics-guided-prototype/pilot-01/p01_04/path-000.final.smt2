; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
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
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_2_5))
(assert
 (bvult topo_U_0 (_ bv6 3)))
(assert
 (bvult topo_U_1 (_ bv6 3)))
(assert
 (bvult topo_U_2 (_ bv6 3)))
(assert
 (bvult topo_U_3 (_ bv6 3)))
(assert
 (bvult topo_U_4 (_ bv6 3)))
(assert
 (bvult topo_U_5 (_ bv6 3)))
(assert
 (bvult topo_T_0 (_ bv6 3)))
(assert
 (bvult topo_T_1 (_ bv6 3)))
(assert
 (bvult topo_T_2 (_ bv6 3)))
(assert
 (bvult topo_T_3 (_ bv6 3)))
(assert
 (bvult topo_T_4 (_ bv6 3)))
(assert
 (bvult topo_T_5 (_ bv6 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1146 (and false false)))
 (let (($x942 (or false false false or $x1146)))
 (=> $x942 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_3 topo_U_5))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x786 (and true false)))
 (let (($x133 (or false false false or $x786)))
 (=> $x133 (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x1146 (and false false)))
 (let (($x942 (or false false false or $x1146)))
 (=> $x942 (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_4))))
(assert
 (let (($x1146 (and false false)))
 (let (($x942 (or false false false or $x1146)))
 (=> $x942 (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x288 (or false false false or)))
 (=> $x288 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1146 (and false false)))
 (let (($x942 (or false false false or $x1146)))
 (=> $x942 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x650 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x650) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x786 (and true false)))
 (let (($x650 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x650 $x786) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x986 (or false false false $x710)))
 (=> $x986 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x786 (and true false)))
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (=> (or false false false $x710 $x786) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x200 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x200) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x786 (and true false)))
 (let (($x200 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x200 $x786) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x986 (or false false false $x710)))
 (=> $x986 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1146 (and false false)))
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x176 (or false false false $x710 $x1146)))
 (=> $x176 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x986 (or false false false $x710)))
 (=> $x986 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1146 (and false false)))
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x176 (or false false false $x710 $x1146)))
 (=> $x176 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x986 (or false false false $x710)))
 (=> $x986 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1146 (and false false)))
 (let (($x710 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x176 (or false false false $x710 $x1146)))
 (=> $x176 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x946 (= (_ bv1 32) final_x)))
 (let (($x852 (= co_2 (_ bv1 2))))
 (=> $x852 $x946))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x876 (= (_ bv1 32) final_y)))
 (let (($x877 (= co_3 (_ bv1 2))))
 (=> $x877 $x876))))
(assert
 (let (($x937 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x961 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x729 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x231 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x854 (and (distinct rf_2_5 false) true)))
 (let (($x585 (and (distinct rf_0_5 true) true)))
 (let (($x879 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1103 (and (distinct input_b false) true)))
 (or $x1103 $x879 $x585 $x854 $x231 $x729 $x961 $x937))))))))))
(assert
 (let (($x937 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x961 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x729 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x231 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1010 (and (distinct rf_2_5 true) true)))
 (let (($x30 (and (distinct rf_0_5 false) true)))
 (let (($x1011 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1103 (and (distinct input_b false) true)))
 (or $x1103 $x1011 $x30 $x1010 $x231 $x729 $x961 $x937))))))))))
(assert
 (let (($x937 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x961 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x729 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x231 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1010 (and (distinct rf_2_5 true) true)))
 (let (($x30 (and (distinct rf_0_5 false) true)))
 (let (($x1011 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1027 (and (distinct input_b true) true)))
 (or $x1027 $x1011 $x30 $x1010 $x231 $x729 $x961 $x937))))))))))
(assert
 (let (($x937 (and (distinct (_ bv1 2) co_3) true)))
(let (($x961 (and (distinct (_ bv0 2) co_1) true)))
(let (($x729 (and (distinct (_ bv1 2) co_2) true)))
(let (($x231 (and (distinct (_ bv0 2) co_0) true)))
(let (($x854 (and (distinct rf_2_5 false) true)))
(let (($x585 (and (distinct rf_0_5 true) true)))
(let (($x879 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1027 (and (distinct input_b true) true)))
(or $x1027 $x879 $x585 $x854 $x231 $x729 $x961 $x937))))))))))
(check-sat)
