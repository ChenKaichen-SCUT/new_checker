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
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_6 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_3_6))
(assert
 (let (($x1043 (bvult co_0 co_3)))
 (let (($x987 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x987 $x1043)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x44 (bvult co_1 co_5)))
 (let (($x1156 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1156 $x44)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x987 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x987) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x97 (and true false)))
 (let (($x987 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x987 $x97) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x756 (or false false false $x596)))
 (=> $x756 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x97 (and true false)))
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x445 (or false false false $x596 $x97)))
 (=> $x445 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x756 (or false false false $x596)))
 (=> $x756 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x493 (and false false)))
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x596 $x493) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x777 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x777) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x493 (and false false)))
 (let (($x777 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x777 $x493) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x756 (or false false false $x596)))
 (=> $x756 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x97 (and true false)))
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x445 (or false false false $x596 $x97)))
 (=> $x445 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x756 (or false false false $x596)))
 (=> $x756 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x97 (and true false)))
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x445 (or false false false $x596 $x97)))
 (=> $x445 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x756 (or false false false $x596)))
 (=> $x756 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x97 (and true false)))
 (let (($x596 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x445 (or false false false $x596 $x97)))
 (=> $x445 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false rf_3_6 false or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_3_6)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1074 (or false false false $x244)))
 (=> $x1074 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x97 (and true false)))
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x655 (or false false false $x244 $x97)))
 (=> $x655 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1156 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1156) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x97 (and true false)))
 (let (($x1156 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1156 $x97) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1074 (or false false false $x244)))
 (=> $x1074 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x97 (and true false)))
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x655 (or false false false $x244 $x97)))
 (=> $x655 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1074 (or false false false $x244)))
 (=> $x1074 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x97 (and true false)))
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x655 (or false false false $x244 $x97)))
 (=> $x655 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1074 (or false false false $x244)))
 (=> $x1074 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x493 (and false false)))
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x244 $x493) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x103 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x103) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x493 (and false false)))
 (let (($x103 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x103 $x493) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1074 (or false false false $x244)))
 (=> $x1074 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x493 (and false false)))
 (let (($x244 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or true false false $x244 $x493) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x97 (and true false)))
 (let (($x249 (or false false false or $x97)))
 (=> $x249 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x130 (or false false false or)))
 (=> $x130 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x1013 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x1013) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x97 (and true false)))
 (let (($x1013 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_3_6 (bvult co_3 co_0)))))
 (=> (or false false false $x1013 $x97) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x746 (or false false false $x922)))
 (=> $x746 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x97 (and true false)))
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x961 (or false false false $x922 $x97)))
 (=> $x961 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x746 (or false false false $x922)))
 (=> $x746 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x97 (and true false)))
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x961 (or false false false $x922 $x97)))
 (=> $x961 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x676 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x676) (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x97 (and true false)))
 (let (($x676 (or (and rf_0_6 (bvult co_0 co_3)) (and rf_3_6 (bvult co_3 co_3)))))
 (=> (or false false false $x676 $x97) (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x746 (or false false false $x922)))
 (=> $x746 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x493 (and false false)))
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x869 (or false false false $x922 $x493)))
 (=> $x869 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x746 (or false false false $x922)))
 (=> $x746 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x493 (and false false)))
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x869 (or false false false $x922 $x493)))
 (=> $x869 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x746 (or false false false $x922)))
 (=> $x746 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x493 (and false false)))
 (let (($x922 (or (and rf_0_6 false) (and rf_3_6 false))))
 (let (($x869 (or false false false $x922 $x493)))
 (=> $x869 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x162 (= co_0 (_ bv1 2))))
 (=> $x162 (= (_ bv0 32) final_x))))
(assert
 (let (($x211 (= co_3 (_ bv1 2))))
 (=> $x211 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x658 (= co_1 (_ bv1 2))))
 (=> $x658 (= (_ bv0 32) final_y))))
(assert
 (let (($x425 (= co_5 (_ bv1 2))))
(=> $x425 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
