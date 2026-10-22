; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_3_6 () Bool)
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_3_6))
(assert
 (let (($x378 (bvult co_0 co_3)))
 (let (($x695 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x695 $x378)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
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
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x695 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x695) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x227 (and true false)))
 (let (($x695 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x695 $x227) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x45 (or false false false $x1140)))
 (=> $x45 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x227 (and true false)))
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x687 (or false false false $x1140 $x227)))
 (=> $x687 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x45 (or false false false $x1140)))
 (=> $x45 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x543 (and false false)))
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1140 $x543) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x957 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x957) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x543 (and false false)))
 (let (($x957 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x957 $x543) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x45 (or false false false $x1140)))
 (=> $x45 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x227 (and true false)))
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x687 (or false false false $x1140 $x227)))
 (=> $x687 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x45 (or false false false $x1140)))
 (=> $x45 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x227 (and true false)))
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x687 (or false false false $x1140 $x227)))
 (=> $x687 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x45 (or false false false $x1140)))
 (=> $x45 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x227 (and true false)))
 (let (($x1140 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x687 (or false false false $x1140 $x227)))
 (=> $x687 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_4 topo_T_3)))))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x543 (and false false)))
 (let (($x721 (or false false false or $x543)))
 (=> $x721 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_4 topo_U_6))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x227 (and true false)))
 (let (($x581 (or false false false or $x227)))
 (=> $x581 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x543 (and false false)))
 (let (($x721 (or false false false or $x543)))
 (=> $x721 (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_5))))
(assert
 (let (($x543 (and false false)))
 (let (($x721 (or false false false or $x543)))
 (=> $x721 (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x787 (or false false false or)))
 (=> $x787 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x543 (and false false)))
 (let (($x721 (or false false false or $x543)))
 (=> $x721 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x894 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x894) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x227 (and true false)))
 (let (($x894 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x894 $x227) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x646 (or false false false $x391)))
 (=> $x646 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x227 (and true false)))
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x663 (or false false false $x391 $x227)))
 (=> $x663 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x646 (or false false false $x391)))
 (=> $x646 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x227 (and true false)))
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x663 (or false false false $x391 $x227)))
 (=> $x663 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x76 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x76) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x227 (and true false)))
 (let (($x76 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x76 $x227) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x646 (or false false false $x391)))
 (=> $x646 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x543 (and false false)))
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x63 (or false false false $x391 $x543)))
 (=> $x63 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x646 (or false false false $x391)))
 (=> $x646 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x543 (and false false)))
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x63 (or false false false $x391 $x543)))
 (=> $x63 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x646 (or false false false $x391)))
 (=> $x646 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x543 (and false false)))
 (let (($x391 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x63 (or false false false $x391 $x543)))
 (=> $x63 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1150 (= co_0 (_ bv1 2))))
 (=> $x1150 (= (_ bv0 32) final_x))))
(assert
 (let (($x725 (= co_3 (_ bv1 2))))
 (=> $x725 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x112 (= co_1 (_ bv1 2))))
 (=> $x112 (= (_ bv0 32) final_y))))
(assert
 (let (($x640 (= co_4 (_ bv1 2))))
(=> $x640 (= (_ bv1 32) final_y))))
(check-sat)
