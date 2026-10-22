; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
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
 (= input_b false))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_4) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_t1_no)))
(assert
 (=> rf_2_3 (= (_ bv1 32) read_t1_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x1042 (= (_ bv0 32) read_t1_b)))
 (=> rf_1_5 $x1042)))
(assert
 ((_ pbeq 1 1) rf_1_5))
(assert
 (let (($x78 (bvult co_0 co_4)))
 (let (($x841 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x841 $x78)))))
(assert
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (not (and $x489 false))))
(assert
 (let (($x499 (bvult co_2 co_4)))
 (let (($x11 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x11 $x499)))))
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
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (=> (or false false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false (bvult co_2 co_4) or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x841 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x841) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x799 (and true false)))
 (let (($x841 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x841 $x799) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x849 (or false false false $x489)))
 (=> $x849 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x799 (and true false)))
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x489 $x799) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x11 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x11) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x799 (and true false)))
 (let (($x11 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x11 $x799) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x849 (or false false false $x489)))
 (=> $x849 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x458 (and false false)))
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x489 $x458) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1298 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1298) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x458 (and false false)))
 (let (($x1298 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1298 $x458) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x849 (or false false false $x489)))
 (=> $x849 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x458 (and false false)))
 (let (($x489 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or true false false $x489 $x458) (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x799 (and true false)))
 (let (($x1052 (or false false false or $x799)))
 (=> $x1052 (bvult topo_T_4 topo_T_1)))))
(assert
 (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false (bvult co_4 co_2) or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x460 (or false false false or)))
 (=> $x460 (bvult topo_U_4 topo_U_5))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x882 (or false false false $x203)))
 (=> $x882 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x799 (and true false)))
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x221 (or false false false $x203 $x799)))
 (=> $x221 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x799 (and true false)))
 (let (($x1240 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x1240 $x799) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x882 (or false false false $x203)))
 (=> $x882 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x799 (and true false)))
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x221 (or false false false $x203 $x799)))
 (=> $x221 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x882 (or false false false $x203)))
 (=> $x882 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x458 (and false false)))
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x642 (or false false false $x203 $x458)))
 (=> $x642 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x882 (or false false false $x203)))
 (=> $x882 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x458 (and false false)))
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x642 (or false false false $x203 $x458)))
 (=> $x642 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x882 (or false false false $x203)))
 (=> $x882 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x458 (and false false)))
 (let (($x203 (or (and rf_1_5 false))))
 (let (($x642 (or false false false $x203 $x458)))
 (=> $x642 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x278 (= co_2 (_ bv2 2))))
 (=> $x278 (= (_ bv1 32) final_x))))
(assert
 (let (($x803 (= co_4 (_ bv2 2))))
 (=> $x803 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (let (($x685 (= co_1 (_ bv0 1))))
 (=> $x685 (= (_ bv0 32) final_y))))
(assert
 (let (($x234 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x361 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x969 (and (distinct rf_1_5 true) true)))
 (let (($x674 (and (distinct rf_4_3 false) true)))
 (let (($x567 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x705 (and (distinct input_b false) true)))
 (or $x705 (and (distinct (_ bv1 32) read_t1_no) true) $x567 (and (distinct rf_0_3 false) true) (and (distinct rf_2_3 true) true) $x674 $x969 $x361 (and (distinct (_ bv1 2) co_2) true) (and (distinct (_ bv2 2) co_4) true) $x234))))))))
(assert
 (let (($x234 (and (distinct (_ bv0 1) co_1) true)))
(let (($x361 (and (distinct (_ bv0 2) co_0) true)))
(let (($x969 (and (distinct rf_1_5 true) true)))
(let (($x674 (and (distinct rf_4_3 false) true)))
(let (($x567 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x705 (and (distinct input_b false) true)))
(or $x705 (and (distinct (_ bv0 32) read_t1_no) true) $x567 (and (distinct rf_0_3 true) true) (and (distinct rf_2_3 false) true) $x674 $x969 $x361 (and (distinct (_ bv2 2) co_2) true) (and (distinct (_ bv1 2) co_4) true) $x234))))))))
(check-sat)
