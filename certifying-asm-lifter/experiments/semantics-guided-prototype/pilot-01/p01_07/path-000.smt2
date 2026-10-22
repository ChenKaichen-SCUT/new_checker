; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_6_5 () Bool)
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
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_6) true))
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
 (=> rf_6_5 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_6_5))
(assert
 (let (($x499 (bvult co_0 co_6)))
 (let (($x922 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x922 $x499)))))
(assert
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (not (and $x296 false))))
(assert
 (let (($x940 (bvult co_2 co_6)))
 (let (($x336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (not (and $x336 $x940)))))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x1116 (bvult co_1 co_4)))
 (let (($x437 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x437 $x1116)))))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
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
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_6) or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false (bvult co_2 co_6) or (and true false)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x921 (or false false false $x64)))
 (=> $x921 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x241 (and true false)))
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1156 (or false false false $x64 $x241)))
 (=> $x1156 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x437 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x437) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x241 (and true false)))
 (let (($x437 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x437 $x241) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x921 (or false false false $x64)))
 (=> $x921 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x241 (and true false)))
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1156 (or false false false $x64 $x241)))
 (=> $x1156 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x921 (or false false false $x64)))
 (=> $x921 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x636 (and false false)))
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x64 $x636) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x378 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x378) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x636 (and false false)))
 (let (($x378 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x378 $x636) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x921 (or false false false $x64)))
 (=> $x921 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x636 (and false false)))
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x30 (or true false false $x64 $x636)))
 (=> $x30 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x921 (or false false false $x64)))
 (=> $x921 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x636 (and false false)))
 (let (($x64 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x30 (or true false false $x64 $x636)))
 (=> $x30 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x636 (and false false)))
 (let (($x686 (or true false false or $x636)))
 (=> $x686 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x636 (and false false)))
 (let (($x686 (or true false false or $x636)))
 (=> $x686 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x922 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x922) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x241 (and true false)))
 (let (($x922 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x922 $x241) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1015 (or false false false $x296)))
 (=> $x1015 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x241 (and true false)))
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (=> (or false false false $x296 $x241) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x336) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x241 (and true false)))
 (let (($x336 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_6_5 (bvult co_6 co_2)))))
 (=> (or false false false $x336 $x241) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1015 (or false false false $x296)))
 (=> $x1015 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x636 (and false false)))
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1125 (or false false false $x296 $x636)))
 (=> $x1125 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1015 (or false false false $x296)))
 (=> $x1015 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x636 (and false false)))
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1125 (or false false false $x296 $x636)))
 (=> $x1125 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1015 (or false false false $x296)))
 (=> $x1015 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x636 (and false false)))
 (let (($x296 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_6_5 false))))
 (let (($x1125 (or false false false $x296 $x636)))
 (=> $x1125 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x538 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x538) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x636 (and false false)))
 (let (($x538 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_2_5 (bvult co_2 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x538 $x636) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x241 (and true false)))
 (let (($x187 (or false false false or $x241)))
 (=> $x187 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false false (bvult co_6 co_2) or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false (bvult co_6 co_2) or (and true false)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x636 (and false false)))
 (let (($x1153 (or false false false or $x636)))
 (=> $x1153 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x958 (or false false false or)))
 (=> $x958 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x636 (and false false)))
 (let (($x1153 (or false false false or $x636)))
 (=> $x1153 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x944 (= co_0 (_ bv2 2))))
 (=> $x944 (= (_ bv0 32) final_x))))
(assert
 (let (($x833 (= co_2 (_ bv2 2))))
 (=> $x833 (= (_ bv1 32) final_x))))
(assert
 (let (($x902 (= co_6 (_ bv2 2))))
 (=> $x902 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (let (($x71 (= co_1 (_ bv1 2))))
 (=> $x71 (= (_ bv0 32) final_y))))
(assert
 (let (($x1095 (= co_4 (_ bv1 2))))
(=> $x1095 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
