; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
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
 (=> rf_6_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_6_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (let (($x210 (bvult co_0 co_3)))
 (let (($x1063 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (not (and $x1063 $x210)))))
(assert
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x1709 false))))
(assert
 (let (($x531 (bvult co_6 co_3)))
 (let (($x590 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x590 $x531)))))
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
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1063 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1063) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x962 (and true false)))
 (let (($x1063 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1063 $x962) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1367 (or false false false $x1709)))
 (=> $x1367 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x342 (or false false false $x1709 $x962)))
 (=> $x342 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1367 (or false false false $x1709)))
 (=> $x1367 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x1709 $x1157) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x931 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x931) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1157 (and false false)))
 (let (($x931 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x931 $x1157) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1367 (or false false false $x1709)))
 (=> $x1367 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or true false false $x1709 $x1157) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1367 (or false false false $x1709)))
 (=> $x1367 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1709 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x342 (or false false false $x1709 $x962)))
 (=> $x342 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x590 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x590) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x962 (and true false)))
 (let (($x590 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x590 $x962) (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x962 (and true false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x937 (or false false false $x82 $x962)))
 (=> $x937 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x962 (and true false)))
 (let (($x918 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x918 $x962) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x184 (or false false false $x82 $x1157)))
 (=> $x184 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x184 (or false false false $x82 $x1157)))
 (=> $x184 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x184 (or false false false $x82 $x1157)))
 (=> $x184 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x962 (and true false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x937 (or false false false $x82 $x962)))
 (=> $x937 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x1610 (or false false false $x82)))
 (=> $x1610 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x962 (and true false)))
 (let (($x82 (or (and rf_1_4 false))))
 (let (($x937 (or false false false $x82 $x962)))
 (=> $x937 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x394 (or false false false $x1037 $x962)))
 (=> $x394 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x962 (and true false)))
 (let (($x418 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x418 $x962) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x394 (or false false false $x1037 $x962)))
 (=> $x394 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x394 (or false false false $x1037 $x962)))
 (=> $x394 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x962 (and true false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x394 (or false false false $x1037 $x962)))
 (=> $x394 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (=> (or false false false $x1037 $x1157) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1037 (or (and rf_1_5 false))))
 (let (($x539 (or false false false $x1037)))
 (=> $x539 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x1157 (and false false)))
 (let (($x1037 (or (and rf_1_5 false))))
 (=> (or true false false $x1037 $x1157) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false (bvult co_6 co_3) or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x962 (and true false)))
 (let (($x219 (or false false false or $x962)))
 (=> $x219 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x1307 (or false false false or)))
 (=> $x1307 (bvult topo_U_6 topo_U_5))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1176 (= co_3 (_ bv2 2))))
 (=> $x1176 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1364 (= co_6 (_ bv2 2))))
 (=> $x1364 (= (_ bv1 32) final_x))))
(assert
 (let (($x224 (= co_1 (_ bv0 1))))
 (=> $x224 (= (_ bv0 32) final_y))))
(assert
 (let (($x115 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1685 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x760 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x920 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x96 (and (distinct rf_1_5 true) true)))
 (let (($x1290 (and (distinct rf_1_4 true) true)))
 (let (($x1191 (and (distinct rf_6_2 false) true)))
 (let (($x129 (and (distinct rf_3_2 false) true)))
 (let (($x741 (and (distinct rf_0_2 true) true)))
 (let (($x1744 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x336 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x126 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x543 (and (distinct input_b false) true)))
 (or $x543 $x126 $x336 $x1744 $x741 $x129 $x1191 $x1290 $x96 $x920 $x760 $x1685 $x115)))))))))))))))
(assert
 (let (($x115 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1685 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x760 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x920 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x96 (and (distinct rf_1_5 true) true)))
 (let (($x1290 (and (distinct rf_1_4 true) true)))
 (let (($x1191 (and (distinct rf_6_2 false) true)))
 (let (($x129 (and (distinct rf_3_2 false) true)))
 (let (($x741 (and (distinct rf_0_2 true) true)))
 (let (($x1744 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x336 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x126 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x23 (and (distinct input_b true) true)))
 (or $x23 $x126 $x336 $x1744 $x741 $x129 $x1191 $x1290 $x96 $x920 $x760 $x1685 $x115)))))))))))))))
(assert
 (let (($x115 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x525 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1197 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x920 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x96 (and (distinct rf_1_5 true) true)))
 (let (($x1290 (and (distinct rf_1_4 true) true)))
 (let (($x1302 (and (distinct rf_6_2 true) true)))
 (let (($x129 (and (distinct rf_3_2 false) true)))
 (let (($x1917 (and (distinct rf_0_2 false) true)))
 (let (($x1744 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x336 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x798 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x543 (and (distinct input_b false) true)))
 (or $x543 $x798 $x336 $x1744 $x1917 $x129 $x1302 $x1290 $x96 $x920 $x1197 $x525 $x115)))))))))))))))
(assert
 (let (($x115 (and (distinct (_ bv0 1) co_1) true)))
(let (($x525 (and (distinct (_ bv1 2) co_6) true)))
(let (($x1197 (and (distinct (_ bv2 2) co_3) true)))
(let (($x920 (and (distinct (_ bv0 2) co_0) true)))
(let (($x96 (and (distinct rf_1_5 true) true)))
(let (($x1290 (and (distinct rf_1_4 true) true)))
(let (($x1302 (and (distinct rf_6_2 true) true)))
(let (($x129 (and (distinct rf_3_2 false) true)))
(let (($x1917 (and (distinct rf_0_2 false) true)))
(let (($x1744 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x336 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x798 (and (distinct (_ bv1 32) read_t0_a) true)))
(let (($x23 (and (distinct input_b true) true)))
(or $x23 $x798 $x336 $x1744 $x1917 $x129 $x1302 $x1290 $x96 $x920 $x1197 $x525 $x115)))))))))))))))
(check-sat)
