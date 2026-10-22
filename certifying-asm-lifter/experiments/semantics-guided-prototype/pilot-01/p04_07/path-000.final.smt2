; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_2_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_8 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_8) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_1 co_6) true))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_6_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_7 (= (_ bv1 32) read_t1_b)))
(assert
 (=> rf_8_7 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_7 rf_2_7 rf_8_7))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x245 (bvult co_1 co_6)))
 (let (($x1069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x1069 $x245)))))
(assert
 (not (and (or (and rf_1_5 false) (and rf_6_5 false)) false)))
(assert
 (let (($x1511 (bvult co_0 co_8)))
 (let (($x1356 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (not (and $x1356 $x1511)))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (not (and $x812 false))))
(assert
 (let (($x1248 (bvult co_2 co_8)))
 (let (($x67 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)) (and rf_8_7 (bvult co_8 co_2)))))
 (not (and $x67 $x1248)))))
(assert
 (bvult topo_U_0 (_ bv9 4)))
(assert
 (bvult topo_U_1 (_ bv9 4)))
(assert
 (bvult topo_U_2 (_ bv9 4)))
(assert
 (bvult topo_U_3 (_ bv9 4)))
(assert
 (bvult topo_U_4 (_ bv9 4)))
(assert
 (bvult topo_U_5 (_ bv9 4)))
(assert
 (bvult topo_U_6 (_ bv9 4)))
(assert
 (bvult topo_U_7 (_ bv9 4)))
(assert
 (bvult topo_U_8 (_ bv9 4)))
(assert
 (bvult topo_T_0 (_ bv9 4)))
(assert
 (bvult topo_T_1 (_ bv9 4)))
(assert
 (bvult topo_T_2 (_ bv9 4)))
(assert
 (bvult topo_T_3 (_ bv9 4)))
(assert
 (bvult topo_T_4 (_ bv9 4)))
(assert
 (bvult topo_T_5 (_ bv9 4)))
(assert
 (bvult topo_T_6 (_ bv9 4)))
(assert
 (bvult topo_T_7 (_ bv9 4)))
(assert
 (bvult topo_T_8 (_ bv9 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false (bvult co_0 co_8) or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_1 topo_T_8)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false rf_2_7 false or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_2_7)) (bvult topo_T_2 topo_T_7)))
(assert
 (=> (or false false (bvult co_2 co_8) or) (bvult topo_U_2 topo_U_8)))
(assert
 (=> (or false false (bvult co_2 co_8) or (and true false)) (bvult topo_T_2 topo_T_8)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_3 topo_U_8))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_3 topo_T_8)))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x953 (or false false false $x659 $x1168)))
 (=> $x953 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x842 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x842) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x842 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x842 $x1168) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x624 (and false false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x669 (or false false false $x659 $x624)))
 (=> $x669 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x624 (and false false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x669 (or false false false $x659 $x624)))
 (=> $x669 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x624 (and false false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x669 (or false false false $x659 $x624)))
 (=> $x669 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x953 (or false false false $x659 $x1168)))
 (=> $x953 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x847 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x847) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1168 (and true false)))
 (let (($x847 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x847 $x1168) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x953 (or false false false $x659 $x1168)))
 (=> $x953 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x869 (or false false false $x659)))
 (=> $x869 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x659 (or (and rf_1_4 false) (and rf_6_4 false))))
 (let (($x953 (or false false false $x659 $x1168)))
 (=> $x953 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x951 (or false false false $x916 $x1168)))
 (=> $x951 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1069) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x1069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1069 $x1168) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x951 (or false false false $x916 $x1168)))
 (=> $x951 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x951 (or false false false $x916 $x1168)))
 (=> $x951 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x951 (or false false false $x916 $x1168)))
 (=> $x951 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x624 (and false false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (=> (or false false false $x916 $x624) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x280 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x280) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x624 (and false false)))
 (let (($x280 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x280 $x624) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x624 (and false false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1729 (or true false false $x916 $x624)))
 (=> $x1729 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x917 (or false false false $x916)))
 (=> $x917 (bvult topo_U_5 topo_U_8)))))
(assert
 (let (($x624 (and false false)))
 (let (($x916 (or (and rf_1_5 false) (and rf_6_5 false))))
 (let (($x1729 (or true false false $x916 $x624)))
 (=> $x1729 (bvult topo_T_5 topo_T_8))))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x624 (and false false)))
 (let (($x7 (or true false false or $x624)))
 (=> $x7 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_6 topo_U_8))))
(assert
 (let (($x624 (and false false)))
 (let (($x7 (or true false false or $x624)))
 (=> $x7 (bvult topo_T_6 topo_T_8)))))
(assert
 (let (($x1356 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1356) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x1168 (and true false)))
 (let (($x1356 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1356 $x1168) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x355 (or false false false $x812 $x1168)))
 (=> $x355 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x67 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)) (and rf_8_7 (bvult co_8 co_2)))))
 (=> (or false false false $x67) (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x1168 (and true false)))
 (let (($x67 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)) (and rf_8_7 (bvult co_8 co_2)))))
 (=> (or false false false $x67 $x1168) (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x355 (or false false false $x812 $x1168)))
 (=> $x355 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x1168 (and true false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x355 (or false false false $x812 $x1168)))
 (=> $x355 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x624 (and false false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x461 (or false false false $x812 $x624)))
 (=> $x461 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x624 (and false false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x461 (or false false false $x812 $x624)))
 (=> $x461 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x101 (or false false false $x812)))
 (=> $x101 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x624 (and false false)))
 (let (($x812 (or (and rf_0_7 false) (and rf_2_7 false) (and rf_8_7 false))))
 (let (($x461 (or false false false $x812 $x624)))
 (=> $x461 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x1685 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_2_7 (bvult co_2 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x1685) (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x624 (and false false)))
 (let (($x1685 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_2_7 (bvult co_2 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x1685 $x624) (bvult topo_T_7 topo_T_8)))))
(assert
 (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert
 (=> (or false false (bvult co_8 co_0) or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_8 topo_T_1)))))
(assert
 (=> (or false false (bvult co_8 co_2) or) (bvult topo_U_8 topo_U_2)))
(assert
 (=> (or false false (bvult co_8 co_2) or (and true false)) (bvult topo_T_8 topo_T_2)))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_8 topo_T_3)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_8 topo_U_4))))
(assert
 (let (($x1168 (and true false)))
 (let (($x538 (or false false false or $x1168)))
 (=> $x538 (bvult topo_T_8 topo_T_4)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x1592 (or false false false or)))
 (=> $x1592 (bvult topo_U_8 topo_U_6))))
(assert
 (let (($x624 (and false false)))
 (let (($x782 (or false false false or $x624)))
 (=> $x782 (bvult topo_T_8 topo_T_6)))))
(assert
 (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert
 (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert
 (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert
 (=> (or false false (bvult co_8 co_8) or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x448 (= co_2 (_ bv2 2))))
 (=> $x448 (= (_ bv1 32) final_x))))
(assert
 (let (($x58 (= co_8 (_ bv2 2))))
 (=> $x58 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x750 (= co_6 (_ bv1 2))))
 (=> $x750 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x772 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1384 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1068 (and (distinct rf_8_7 false) true)))
 (let (($x1486 (and (distinct rf_2_7 true) true)))
 (let (($x590 (and (distinct rf_0_7 false) true)))
 (let (($x840 (and (distinct rf_6_5 false) true)))
 (let (($x906 (and (distinct rf_1_5 true) true)))
 (let (($x1333 (and (distinct rf_6_4 false) true)))
 (let (($x1539 (and (distinct rf_1_4 true) true)))
 (let (($x1002 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x785 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x343 (and (distinct input_b false) true)))
 (or $x343 $x785 $x1640 $x1002 $x1539 $x1333 $x906 $x840 $x590 $x1486 $x1068 $x1655 $x1384 $x772 $x1974 $x1759))))))))))))))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x772 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1384 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1068 (and (distinct rf_8_7 false) true)))
 (let (($x1486 (and (distinct rf_2_7 true) true)))
 (let (($x590 (and (distinct rf_0_7 false) true)))
 (let (($x840 (and (distinct rf_6_5 false) true)))
 (let (($x906 (and (distinct rf_1_5 true) true)))
 (let (($x1754 (and (distinct rf_6_4 true) true)))
 (let (($x1750 (and (distinct rf_1_4 false) true)))
 (let (($x1002 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1679 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x343 (and (distinct input_b false) true)))
 (or $x343 $x1679 $x1640 $x1002 $x1750 $x1754 $x906 $x840 $x590 $x1486 $x1068 $x1655 $x1384 $x772 $x1974 $x1759))))))))))))))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x772 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1384 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1068 (and (distinct rf_8_7 false) true)))
 (let (($x1486 (and (distinct rf_2_7 true) true)))
 (let (($x590 (and (distinct rf_0_7 false) true)))
 (let (($x840 (and (distinct rf_6_5 false) true)))
 (let (($x906 (and (distinct rf_1_5 true) true)))
 (let (($x1754 (and (distinct rf_6_4 true) true)))
 (let (($x1750 (and (distinct rf_1_4 false) true)))
 (let (($x1002 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1679 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1795 (and (distinct input_b true) true)))
 (or $x1795 $x1679 $x1640 $x1002 $x1750 $x1754 $x906 $x840 $x590 $x1486 $x1068 $x1655 $x1384 $x772 $x1974 $x1759))))))))))))))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x772 (and (distinct (_ bv2 2) co_8) true)))
 (let (($x1384 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1068 (and (distinct rf_8_7 false) true)))
 (let (($x1486 (and (distinct rf_2_7 true) true)))
 (let (($x590 (and (distinct rf_0_7 false) true)))
 (let (($x840 (and (distinct rf_6_5 false) true)))
 (let (($x906 (and (distinct rf_1_5 true) true)))
 (let (($x1333 (and (distinct rf_6_4 false) true)))
 (let (($x1539 (and (distinct rf_1_4 true) true)))
 (let (($x1002 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x785 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1795 (and (distinct input_b true) true)))
 (or $x1795 $x785 $x1640 $x1002 $x1539 $x1333 $x906 $x840 $x590 $x1486 $x1068 $x1655 $x1384 $x772 $x1974 $x1759))))))))))))))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1799 (and (distinct (_ bv1 2) co_8) true)))
 (let (($x551 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1068 (and (distinct rf_8_7 false) true)))
 (let (($x566 (and (distinct rf_2_7 false) true)))
 (let (($x1780 (and (distinct rf_0_7 true) true)))
 (let (($x840 (and (distinct rf_6_5 false) true)))
 (let (($x906 (and (distinct rf_1_5 true) true)))
 (let (($x1754 (and (distinct rf_6_4 true) true)))
 (let (($x1750 (and (distinct rf_1_4 false) true)))
 (let (($x1767 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1679 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x343 (and (distinct input_b false) true)))
 (or $x343 $x1679 $x1640 $x1767 $x1750 $x1754 $x906 $x840 $x1780 $x566 $x1068 $x1655 $x551 $x1799 $x1974 $x1759))))))))))))))))))
(assert
 (let (($x1759 (and (distinct (_ bv1 2) co_6) true)))
(let (($x1974 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1799 (and (distinct (_ bv1 2) co_8) true)))
(let (($x551 (and (distinct (_ bv2 2) co_2) true)))
(let (($x1655 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1068 (and (distinct rf_8_7 false) true)))
(let (($x566 (and (distinct rf_2_7 false) true)))
(let (($x1780 (and (distinct rf_0_7 true) true)))
(let (($x840 (and (distinct rf_6_5 false) true)))
(let (($x906 (and (distinct rf_1_5 true) true)))
(let (($x1754 (and (distinct rf_6_4 true) true)))
(let (($x1750 (and (distinct rf_1_4 false) true)))
(let (($x1767 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1640 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1679 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x1795 (and (distinct input_b true) true)))
(or $x1795 $x1679 $x1640 $x1767 $x1750 $x1754 $x906 $x840 $x1780 $x566 $x1068 $x1655 $x551 $x1799 $x1974 $x1759))))))))))))))))))
(check-sat)
