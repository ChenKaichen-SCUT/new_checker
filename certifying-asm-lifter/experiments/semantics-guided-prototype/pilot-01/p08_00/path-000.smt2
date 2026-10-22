; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
(assert
 true)
(assert
 (= input_b true))
(assert
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_3_5))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x462 (bvult co_1 co_3)))
 (let (($x1626 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (not (and $x1626 $x462)))))
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
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2344 (or false false false $x1151)))
 (=> $x2344 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x315 (or false false false $x1151 $x2309)))
 (=> $x315 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x1626 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x1626) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1626 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x1626 $x2309) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2344 (or false false false $x1151)))
 (=> $x2344 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1151 $x2606) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x381 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x381) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x2606 (and false false)))
 (let (($x381 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x381 $x2606) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2344 (or false false false $x1151)))
 (=> $x2344 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or true false false $x1151 $x2606) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2344 (or false false false $x1151)))
 (=> $x2344 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1151 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x315 (or false false false $x1151 $x2309)))
 (=> $x315 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x2309 (and true false)))
 (let (($x2440 (or false false false or $x2309)))
 (=> $x2440 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x2415 (or false false false or)))
 (=> $x2415 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x2309 (and true false)))
 (let (($x1041 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x1041 $x2309) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1965 (or false false false $x1340)))
 (=> $x1965 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1529 (or false false false $x1340 $x2309)))
 (=> $x1529 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1965 (or false false false $x1340)))
 (=> $x1965 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x2082 (or false false false $x1340 $x2606)))
 (=> $x2082 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1965 (or false false false $x1340)))
 (=> $x1965 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x2082 (or false false false $x1340 $x2606)))
 (=> $x2082 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1965 (or false false false $x1340)))
 (=> $x1965 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x2082 (or false false false $x1340 $x2606)))
 (=> $x2082 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1965 (or false false false $x1340)))
 (=> $x1965 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1340 (or (and rf_0_4 false))))
 (let (($x1529 (or false false false $x1340 $x2309)))
 (=> $x1529 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x914 (or false false false $x1360)))
 (=> $x914 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x103 (or false false false $x1360 $x2309)))
 (=> $x103 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x787 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x787) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x2309 (and true false)))
 (let (($x787 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x787 $x2309) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x914 (or false false false $x1360)))
 (=> $x914 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x103 (or false false false $x1360 $x2309)))
 (=> $x103 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x789 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x789) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x2309 (and true false)))
 (let (($x789 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x789 $x2309) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x914 (or false false false $x1360)))
 (=> $x914 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x2309 (and true false)))
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x103 (or false false false $x1360 $x2309)))
 (=> $x103 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x914 (or false false false $x1360)))
 (=> $x914 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x2606 (and false false)))
 (let (($x1360 (or (and rf_1_5 false) (and rf_3_5 false))))
 (=> (or false false false $x1360 $x2606) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x86 (= co_0 (_ bv0 1))))
 (=> $x86 (= (_ bv0 32) final_x))))
(assert
 (let (($x1331 (= co_1 (_ bv1 2))))
 (=> $x1331 (= (_ bv0 32) final_y))))
(assert
 (let (($x619 (= co_3 (_ bv1 2))))
(=> $x619 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(check-sat)
