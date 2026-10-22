; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_4_2 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
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
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_0 co_4) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_4_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_4_2))
(assert
 (let (($x702 (= (_ bv0 32) read_t1_yes)))
 (=> rf_0_3 $x702)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_3 rf_4_3))
(assert
 (let (($x265 (= (_ bv0 32) read_t1_b)))
 (=> rf_1_5 $x265)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (let (($x64 (bvult co_0 co_4)))
 (let (($x501 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x501 $x64)))))
(assert
 (not (and (or (and rf_0_3 false) (and rf_4_3 false)) false)))
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
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x491 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_4_2 (bvult co_4 co_0)))))
 (=> (or false false false $x491) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x640 (and true false)))
 (let (($x491 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_4_2 (bvult co_4 co_0)))))
 (=> (or false false false $x491 $x640) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x329 (or false false false $x447)))
 (=> $x329 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x640 (and true false)))
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x259 (or false false false $x447 $x640)))
 (=> $x259 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x329 (or false false false $x447)))
 (=> $x329 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x677 (and false false)))
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (=> (or false false false $x447 $x677) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x329 (or false false false $x447)))
 (=> $x329 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x640 (and true false)))
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x259 (or false false false $x447 $x640)))
 (=> $x259 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x73 (or (and rf_0_2 (bvult co_0 co_4)) (and rf_4_2 (bvult co_4 co_4)))))
 (=> (or false false false $x73) (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x640 (and true false)))
 (let (($x73 (or (and rf_0_2 (bvult co_0 co_4)) (and rf_4_2 (bvult co_4 co_4)))))
 (=> (or false false false $x73 $x640) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x329 (or false false false $x447)))
 (=> $x329 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x640 (and true false)))
 (let (($x447 (or (and rf_0_2 false) (and rf_4_2 false))))
 (let (($x259 (or false false false $x447 $x640)))
 (=> $x259 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x501 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x501) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x640 (and true false)))
 (let (($x501 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x501 $x640) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x31 (or false false false $x553)))
 (=> $x31 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x640 (and true false)))
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x481 (or false false false $x553 $x640)))
 (=> $x481 (bvult topo_T_3 topo_T_1))))))
(assert
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x31 (or false false false $x553)))
 (=> $x31 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x640 (and true false)))
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x481 (or false false false $x553 $x640)))
 (=> $x481 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x31 (or false false false $x553)))
 (=> $x31 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x677 (and false false)))
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (=> (or false false false $x553 $x677) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x201 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x201) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x677 (and false false)))
 (let (($x201 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x201 $x677) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (let (($x31 (or false false false $x553)))
 (=> $x31 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x677 (and false false)))
 (let (($x553 (or (and rf_0_3 false) (and rf_4_3 false))))
 (=> (or true false false $x553 $x677) (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x640 (and true false)))
 (let (($x636 (or false false false or $x640)))
 (=> $x636 (bvult topo_T_4 topo_T_1)))))
(assert
 (=> (or false rf_4_2 false or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_4_2)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x624 (or false false false or)))
 (=> $x624 (bvult topo_U_4 topo_U_5))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x271 (or false false false $x143)))
 (=> $x271 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x640 (and true false)))
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x739 (or false false false $x143 $x640)))
 (=> $x739 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x640 (and true false)))
 (let (($x323 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x323 $x640) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x271 (or false false false $x143)))
 (=> $x271 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x640 (and true false)))
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x739 (or false false false $x143 $x640)))
 (=> $x739 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x271 (or false false false $x143)))
 (=> $x271 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x677 (and false false)))
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x379 (or false false false $x143 $x677)))
 (=> $x379 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x271 (or false false false $x143)))
 (=> $x271 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x677 (and false false)))
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x379 (or false false false $x143 $x677)))
 (=> $x379 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x271 (or false false false $x143)))
 (=> $x271 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x677 (and false false)))
 (let (($x143 (or (and rf_1_5 false))))
 (let (($x379 (or false false false $x143 $x677)))
 (=> $x379 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x311 (= co_4 (_ bv1 2))))
 (=> $x311 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x729 (= (_ bv0 32) final_y)))
 (let (($x774 (= co_1 (_ bv0 1))))
 (=> $x774 $x729))))
(assert
 (let (($x241 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x584 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x526 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x637 (and (distinct rf_1_5 true) true)))
 (let (($x733 (and (distinct rf_4_3 false) true)))
 (let (($x182 (and (distinct rf_0_3 true) true)))
 (let (($x196 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x123 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x231 (and (distinct input_b true) true)))
 (or $x231 (and (distinct (_ bv1 32) read_t0_a) true) $x123 $x196 (and (distinct rf_0_2 false) true) (and (distinct rf_4_2 true) true) $x182 $x733 $x637 $x526 $x584 $x241)))))))))))
(assert
 (let (($x241 (and (distinct (_ bv0 1) co_1) true)))
(let (($x584 (and (distinct (_ bv1 2) co_4) true)))
(let (($x526 (and (distinct (_ bv0 2) co_0) true)))
(let (($x637 (and (distinct rf_1_5 true) true)))
(let (($x733 (and (distinct rf_4_3 false) true)))
(let (($x182 (and (distinct rf_0_3 true) true)))
(let (($x196 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x123 (and (distinct (_ bv0 32) read_t1_yes) true)))
(let (($x231 (and (distinct input_b true) true)))
(or $x231 (and (distinct (_ bv0 32) read_t0_a) true) $x123 $x196 (and (distinct rf_0_2 true) true) (and (distinct rf_4_2 false) true) $x182 $x733 $x637 $x526 $x584 $x241)))))))))))
(check-sat)
