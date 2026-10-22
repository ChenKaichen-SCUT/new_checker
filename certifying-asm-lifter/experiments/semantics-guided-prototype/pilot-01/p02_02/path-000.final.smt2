; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
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
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (let (($x407 (bvult co_0 co_3)))
 (let (($x634 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x634 $x407)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x562 (bvult co_1 co_5)))
 (let (($x977 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x977 $x562)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x634 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x634) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1128 (and true false)))
 (let (($x634 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x634 $x1128) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x777 (or false false false $x700)))
 (=> $x777 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x780 (or false false false $x700 $x1128)))
 (=> $x780 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x777 (or false false false $x700)))
 (=> $x777 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x300 (and false false)))
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x700 $x300) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x740 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x740) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x300 (and false false)))
 (let (($x740 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x740 $x300) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x777 (or false false false $x700)))
 (=> $x777 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x780 (or false false false $x700 $x1128)))
 (=> $x780 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x777 (or false false false $x700)))
 (=> $x777 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x700 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x780 (or false false false $x700 $x1128)))
 (=> $x780 (bvult topo_T_2 topo_T_5))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x287 (or false false false $x440)))
 (=> $x287 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x186 (or false false false $x440 $x1128)))
 (=> $x186 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x977 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x977) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1128 (and true false)))
 (let (($x977 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x977 $x1128) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x287 (or false false false $x440)))
 (=> $x287 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x186 (or false false false $x440 $x1128)))
 (=> $x186 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x287 (or false false false $x440)))
 (=> $x287 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1128 (and true false)))
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x186 (or false false false $x440 $x1128)))
 (=> $x186 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x287 (or false false false $x440)))
 (=> $x287 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x300 (and false false)))
 (let (($x440 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x440 $x300) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x655 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x655) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x300 (and false false)))
 (let (($x655 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x655 $x300) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x879 (or false false false or)))
 (=> $x879 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1128 (and true false)))
 (let (($x475 (or false false false or $x1128)))
 (=> $x475 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x69 (= co_3 (_ bv1 2))))
 (=> $x69 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x366 (= co_5 (_ bv1 2))))
 (=> $x366 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x130 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x969 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x361 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x674 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x370 (and (distinct rf_5_4 false) true)))
 (let (($x500 (and (distinct rf_1_4 true) true)))
 (let (($x129 (and (distinct rf_3_2 false) true)))
 (let (($x779 (and (distinct rf_0_2 true) true)))
 (let (($x438 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1069 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x1069 $x438 $x779 $x129 $x500 $x370 $x674 $x361 $x969 $x130))))))))))))
(assert
 (let (($x130 (and (distinct (_ bv1 2) co_5) true)))
(let (($x969 (and (distinct (_ bv0 2) co_1) true)))
(let (($x361 (and (distinct (_ bv1 2) co_3) true)))
(let (($x674 (and (distinct (_ bv0 2) co_0) true)))
(let (($x370 (and (distinct rf_5_4 false) true)))
(let (($x500 (and (distinct rf_1_4 true) true)))
(let (($x129 (and (distinct rf_3_2 false) true)))
(let (($x779 (and (distinct rf_0_2 true) true)))
(let (($x438 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1069 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x1069 $x438 $x779 $x129 $x500 $x370 $x674 $x361 $x969 $x130))))))))))))
(check-sat)
