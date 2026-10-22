; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_2_5))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x792 (bvult co_1 co_4)))
 (let (($x134 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x134 $x792)))))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
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
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1115 (or false false false $x809)))
 (=> $x1115 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1039 (and true false)))
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x317 (or false false false $x809 $x1039)))
 (=> $x317 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x134 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x134) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1039 (and true false)))
 (let (($x134 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x134 $x1039) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1115 (or false false false $x809)))
 (=> $x1115 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1039 (and true false)))
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x317 (or false false false $x809 $x1039)))
 (=> $x317 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1115 (or false false false $x809)))
 (=> $x1115 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x592 (and false false)))
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x809 $x592) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1116 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1116) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x592 (and false false)))
 (let (($x1116 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1116 $x592) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1115 (or false false false $x809)))
 (=> $x1115 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x592 (and false false)))
 (let (($x809 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or true false false $x809 $x592) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x1039 (and true false)))
 (let (($x1086 (or false false false or $x1039)))
 (=> $x1086 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x567 (or false false false or)))
 (=> $x567 (bvult topo_U_4 topo_U_5))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x887 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x887) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1039 (and true false)))
 (let (($x887 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x887 $x1039) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x368 (or false false false $x62)))
 (=> $x368 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x1039 (and true false)))
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (=> (or false false false $x62 $x1039) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x837 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x837) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1039 (and true false)))
 (let (($x837 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x837 $x1039) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x368 (or false false false $x62)))
 (=> $x368 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x592 (and false false)))
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x210 (or false false false $x62 $x592)))
 (=> $x210 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x368 (or false false false $x62)))
 (=> $x368 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x592 (and false false)))
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x210 (or false false false $x62 $x592)))
 (=> $x210 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x368 (or false false false $x62)))
 (=> $x368 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x592 (and false false)))
 (let (($x62 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x210 (or false false false $x62 $x592)))
 (=> $x210 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x728 (= (_ bv1 32) final_x)))
 (let (($x629 (= co_2 (_ bv1 2))))
 (=> $x629 $x728))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1057 (= co_4 (_ bv1 2))))
 (=> $x1057 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x412 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x285 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x387 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x41 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x331 (and (distinct rf_2_5 false) true)))
 (let (($x442 (and (distinct rf_0_5 true) true)))
 (let (($x521 (and (distinct rf_4_3 false) true)))
 (let (($x383 (and (distinct rf_1_3 true) true)))
 (let (($x724 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x135 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x962 (and (distinct input_b false) true)))
 (or $x962 $x135 $x724 $x383 $x521 $x442 $x331 $x41 $x387 $x285 $x412)))))))))))))
(assert
 (let (($x412 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x285 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x387 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x41 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x276 (and (distinct rf_2_5 true) true)))
 (let (($x993 (and (distinct rf_0_5 false) true)))
 (let (($x521 (and (distinct rf_4_3 false) true)))
 (let (($x383 (and (distinct rf_1_3 true) true)))
 (let (($x269 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x135 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x962 (and (distinct input_b false) true)))
 (or $x962 $x135 $x269 $x383 $x521 $x993 $x276 $x41 $x387 $x285 $x412)))))))))))))
(assert
 (let (($x412 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x285 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x387 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x41 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x276 (and (distinct rf_2_5 true) true)))
 (let (($x993 (and (distinct rf_0_5 false) true)))
 (let (($x521 (and (distinct rf_4_3 false) true)))
 (let (($x383 (and (distinct rf_1_3 true) true)))
 (let (($x269 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x135 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x642 (and (distinct input_b true) true)))
 (or $x642 $x135 $x269 $x383 $x521 $x993 $x276 $x41 $x387 $x285 $x412)))))))))))))
(assert
 (let (($x412 (and (distinct (_ bv1 2) co_4) true)))
(let (($x285 (and (distinct (_ bv0 2) co_1) true)))
(let (($x387 (and (distinct (_ bv1 2) co_2) true)))
(let (($x41 (and (distinct (_ bv0 2) co_0) true)))
(let (($x331 (and (distinct rf_2_5 false) true)))
(let (($x442 (and (distinct rf_0_5 true) true)))
(let (($x521 (and (distinct rf_4_3 false) true)))
(let (($x383 (and (distinct rf_1_3 true) true)))
(let (($x724 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x135 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x642 (and (distinct input_b true) true)))
(or $x642 $x135 $x724 $x383 $x521 $x442 $x331 $x41 $x387 $x285 $x412)))))))))))))
(check-sat)
