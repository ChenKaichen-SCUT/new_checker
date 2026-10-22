; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
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
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
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
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (let (($x531 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x531)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (let (($x345 (bvult co_0 co_3)))
 (let (($x1109 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1109 $x345)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
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
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x1109 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1109) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x579 (and true false)))
 (let (($x1109 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1109 $x579) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x802 (or false false false $x704)))
 (=> $x802 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x579 (and true false)))
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x598 (or false false false $x704 $x579)))
 (=> $x598 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x802 (or false false false $x704)))
 (=> $x802 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x485 (and false false)))
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x704 $x485) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x452 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x452) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x485 (and false false)))
 (let (($x452 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x452 $x485) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x802 (or false false false $x704)))
 (=> $x802 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x579 (and true false)))
 (let (($x704 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x598 (or false false false $x704 $x579)))
 (=> $x598 (bvult topo_T_2 topo_T_4))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1010 (or false false false or)))
 (=> $x1010 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x579 (and true false)))
 (let (($x14 (or false false false or $x579)))
 (=> $x14 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x1062 (or false false false $x858)))
 (=> $x1062 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x579 (and true false)))
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x858 $x579)))
 (=> $x490 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x579 (and true false)))
 (let (($x398 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x398 $x579) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x1062 (or false false false $x858)))
 (=> $x1062 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x579 (and true false)))
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x858 $x579)))
 (=> $x490 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x1062 (or false false false $x858)))
 (=> $x1062 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x579 (and true false)))
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x490 (or false false false $x858 $x579)))
 (=> $x490 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x858 (or (and rf_1_4 false))))
 (let (($x1062 (or false false false $x858)))
 (=> $x1062 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x485 (and false false)))
 (let (($x858 (or (and rf_1_4 false))))
 (=> (or false false false $x858 $x485) (bvult topo_T_4 topo_T_4)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x721 (= co_3 (_ bv1 2))))
 (=> $x721 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x332 (= (_ bv0 32) final_y)))
 (let (($x216 (= co_1 (_ bv0 1))))
 (=> $x216 $x332))))
(assert
 (let (($x694 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x207 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x981 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x755 (and (distinct rf_1_4 true) true)))
 (let (($x55 (and (distinct rf_3_2 false) true)))
 (let (($x1098 (and (distinct rf_0_2 true) true)))
 (let (($x428 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x780 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x780 $x428 $x1098 $x55 $x755 $x981 $x207 $x694))))))))))
(assert
 (let (($x694 (and (distinct (_ bv0 1) co_1) true)))
(let (($x207 (and (distinct (_ bv1 2) co_3) true)))
(let (($x981 (and (distinct (_ bv0 2) co_0) true)))
(let (($x755 (and (distinct rf_1_4 true) true)))
(let (($x55 (and (distinct rf_3_2 false) true)))
(let (($x1098 (and (distinct rf_0_2 true) true)))
(let (($x428 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x780 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x780 $x428 $x1098 $x55 $x755 $x981 $x207 $x694))))))))))
(check-sat)
