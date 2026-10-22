; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_6_4 () Bool)
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
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_5 co_6) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 (=> rf_6_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_6_4))
(assert
 (let (($x1515 (bvult co_0 co_3)))
 (let (($x605 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x605 $x1515)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (not (and $x100 false))))
(assert
 (let (($x752 (bvult co_1 co_5)))
 (let (($x35 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (not (and $x35 $x752)))))
(assert
 (let (($x595 (bvult co_6 co_5)))
 (let (($x57 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (not (and $x57 $x595)))))
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
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x605 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x605) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x2047 (and true false)))
 (let (($x605 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x605 $x2047) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1620 (or false false false $x260)))
 (=> $x1620 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x2047 (and true false)))
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1900 (or false false false $x260 $x2047)))
 (=> $x1900 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1620 (or false false false $x260)))
 (=> $x1620 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x260 $x1943) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x2245 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x2245) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1943 (and false false)))
 (let (($x2245 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x2245 $x1943) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1620 (or false false false $x260)))
 (=> $x1620 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x736 (or true false false $x260 $x1943)))
 (=> $x736 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1620 (or false false false $x260)))
 (=> $x1620 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x736 (or true false false $x260 $x1943)))
 (=> $x736 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1620 (or false false false $x260)))
 (=> $x1620 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x2047 (and true false)))
 (let (($x260 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1900 (or false false false $x260 $x2047)))
 (=> $x1900 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1943 (and false false)))
 (let (($x1477 (or true false false or $x1943)))
 (=> $x1477 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1943 (and false false)))
 (let (($x1477 (or true false false or $x1943)))
 (=> $x1477 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x2086 (or false false false $x100)))
 (=> $x2086 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x2047 (and true false)))
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (=> (or false false false $x100 $x2047) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x35 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x35) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x2047 (and true false)))
 (let (($x35 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x35 $x2047) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x2086 (or false false false $x100)))
 (=> $x2086 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x659 (or false false false $x100 $x1943)))
 (=> $x659 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x2086 (or false false false $x100)))
 (=> $x2086 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x659 (or false false false $x100 $x1943)))
 (=> $x659 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x2086 (or false false false $x100)))
 (=> $x2086 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1943 (and false false)))
 (let (($x100 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x659 (or false false false $x100 $x1943)))
 (=> $x659 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1046 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1046) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1943 (and false false)))
 (let (($x1046 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1046 $x1943) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x57 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x57) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x2047 (and true false)))
 (let (($x57 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x57 $x2047) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1943 (and false false)))
 (let (($x1880 (or false false false or $x1943)))
 (=> $x1880 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1943 (and false false)))
 (let (($x1880 (or false false false or $x1943)))
 (=> $x1880 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false false (bvult co_5 co_6) or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false (bvult co_5 co_6) or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x461 (or false false false or)))
 (=> $x461 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x2047 (and true false)))
 (let (($x1823 (or false false false or $x2047)))
 (=> $x1823 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false false (bvult co_6 co_5) or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false (bvult co_6 co_5) or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x851 (= co_0 (_ bv1 2))))
 (=> $x851 (= (_ bv0 32) final_x))))
(assert
 (let (($x1737 (= co_3 (_ bv1 2))))
 (=> $x1737 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1529 (= co_1 (_ bv2 2))))
 (=> $x1529 (= (_ bv0 32) final_y))))
(assert
 (let (($x2007 (= co_5 (_ bv2 2))))
 (=> $x2007 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x1707 (= co_6 (_ bv2 2))))
(=> $x1707 (= (_ bv1 32) final_y))))
(check-sat)
