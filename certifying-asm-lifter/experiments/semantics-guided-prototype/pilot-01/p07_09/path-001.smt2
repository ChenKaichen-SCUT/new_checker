; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_8_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
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
(assert
 true)
(assert
 (let (($x1939 (= (_ bv0 32) read_t1_a)))
 (= $x1939 false)))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_8 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_8) true))
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
 (=> rf_8_2 (= (bvadd read_t1_no (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_8_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (let (($x1939 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_6 $x1939)))
(assert
 (=> rf_5_6 (= (bvadd read_t0_b (_ bv2 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_6 rf_5_6))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_no)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_a (_ bv1 32)) read_t1_no)))
(assert
 (=> rf_8_7 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_7 rf_3_7 rf_8_7))
(assert
 (let (($x1162 (bvult co_0 co_3)))
 (let (($x1863 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (not (and $x1863 $x1162)))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (not (and $x360 false))))
(assert
 (let (($x855 (bvult co_8 co_3)))
 (let (($x20 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (not (and $x20 $x855)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x2017 (bvult co_1 co_5)))
 (let (($x187 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x187 $x2017)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x903 (bvult co_0 co_8)))
 (let (($x1747 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (not (and $x1747 $x903)))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (not (and $x1632 false))))
(assert
 (let (($x2356 (bvult co_3 co_8)))
 (let (($x2931 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (not (and $x2931 $x2356)))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (not (and $x1632 false))))
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
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false (bvult co_0 co_8) or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1863 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x1863) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x885 (and true false)))
 (let (($x1863 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_8_2 (bvult co_8 co_0)))))
 (=> (or false false false $x1863 $x885) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x885 (and true false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1781 (or false false false $x360 $x885)))
 (=> $x1781 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x165 (and false false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (=> (or false false false $x360 $x165) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1734 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_8_2 (bvult co_8 co_3)))))
 (=> (or true false false $x1734) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x165 (and false false)))
 (let (($x1734 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_8_2 (bvult co_8 co_3)))))
 (=> (or true false false $x1734 $x165) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x165 (and false false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x845 (or true false false $x360 $x165)))
 (=> $x845 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x165 (and false false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x845 (or true false false $x360 $x165)))
 (=> $x845 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x885 (and true false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1781 (or false false false $x360 $x885)))
 (=> $x1781 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x904 (or false false false $x360)))
 (=> $x904 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x885 (and true false)))
 (let (($x360 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_8_2 false))))
 (let (($x1781 (or false false false $x360 $x885)))
 (=> $x1781 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x20 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x20) (bvult topo_U_2 topo_U_8))))
(assert
 (let (($x885 (and true false)))
 (let (($x20 (or (and rf_0_2 (bvult co_0 co_8)) (and rf_3_2 (bvult co_3 co_8)) (and rf_8_2 (bvult co_8 co_8)))))
 (=> (or false false false $x20 $x885) (bvult topo_T_2 topo_T_8)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x165 (and false false)))
 (let (($x1061 (or true false false or $x165)))
 (=> $x1061 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x165 (and false false)))
 (let (($x1061 (or true false false or $x165)))
 (=> $x1061 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (=> (or false false (bvult co_3 co_8) or) (bvult topo_U_3 topo_U_8)))
(assert
 (=> (or false false (bvult co_3 co_8) or (and true false)) (bvult topo_T_3 topo_T_8)))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x885 (and true false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x381 (or false false false $x432 $x885)))
 (=> $x381 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x187 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x187) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x885 (and true false)))
 (let (($x187 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x187 $x885) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x165 (and false false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x752 (or false false false $x432 $x165)))
 (=> $x752 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x165 (and false false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x752 (or false false false $x432 $x165)))
 (=> $x752 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x165 (and false false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x752 (or false false false $x432 $x165)))
 (=> $x752 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x2048 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x2048) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x165 (and false false)))
 (let (($x2048 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x2048 $x165) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x885 (and true false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x381 (or false false false $x432 $x885)))
 (=> $x381 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x885 (and true false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x381 (or false false false $x432 $x885)))
 (=> $x381 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1319 (or false false false $x432)))
 (=> $x1319 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x885 (and true false)))
 (let (($x432 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x381 (or false false false $x432 $x885)))
 (=> $x381 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x165 (and false false)))
 (let (($x1901 (or false false false or $x165)))
 (=> $x1901 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x165 (and false false)))
 (let (($x1901 (or false false false or $x165)))
 (=> $x1901 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_5 topo_U_8))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_5 topo_T_8)))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x885 (and true false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2338 (or false false false $x2039 $x885)))
 (=> $x2338 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1361 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x1361) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x885 (and true false)))
 (let (($x1361 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x1361 $x885) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x885 (and true false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2338 (or false false false $x2039 $x885)))
 (=> $x2338 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x885 (and true false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2338 (or false false false $x2039 $x885)))
 (=> $x2338 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x885 (and true false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2338 (or false false false $x2039 $x885)))
 (=> $x2338 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x2393 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x2393) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x885 (and true false)))
 (let (($x2393 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x2393 $x885) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x165 (and false false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (=> (or false false false $x2039 $x165) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_7)))))
(assert
 (let (($x165 (and false false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2432 (or true false false $x2039 $x165)))
 (=> $x2432 (bvult topo_T_6 topo_T_7))))))
(assert
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x263 (or false false false $x2039)))
 (=> $x263 (bvult topo_U_6 topo_U_8)))))
(assert
 (let (($x165 (and false false)))
 (let (($x2039 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x2432 (or true false false $x2039 $x165)))
 (=> $x2432 (bvult topo_T_6 topo_T_8))))))
(assert
 (let (($x1747 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1747) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x885 (and true false)))
 (let (($x1747 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1747 $x885) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x885 (and true false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2571 (or false false false $x1632 $x885)))
 (=> $x2571 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x885 (and true false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2571 (or false false false $x1632 $x885)))
 (=> $x2571 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x2931 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (=> (or false false false $x2931) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x885 (and true false)))
 (let (($x2931 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)) (and rf_8_7 (bvult co_8 co_3)))))
 (=> (or false false false $x2931 $x885) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x885 (and true false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2571 (or false false false $x1632 $x885)))
 (=> $x2571 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x885 (and true false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2571 (or false false false $x1632 $x885)))
 (=> $x2571 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x165 (and false false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2242 (or false false false $x1632 $x165)))
 (=> $x2242 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2606 (or false false false $x1632)))
 (=> $x2606 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x165 (and false false)))
 (let (($x1632 (or (and rf_0_7 false) (and rf_3_7 false) (and rf_8_7 false))))
 (let (($x2242 (or false false false $x1632 $x165)))
 (=> $x2242 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2261 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_3_7 (bvult co_3 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x2261) (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x165 (and false false)))
 (let (($x2261 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_3_7 (bvult co_3 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x2261 $x165) (bvult topo_T_7 topo_T_8)))))
(assert
 (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert
 (=> (or false false (bvult co_8 co_0) or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_8 topo_T_1)))))
(assert
 (=> (or false rf_8_2 false or) (bvult topo_U_8 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_8_2)) (bvult topo_T_8 topo_T_2)))
(assert
 (=> (or false false (bvult co_8 co_3) or) (bvult topo_U_8 topo_U_3)))
(assert
 (=> (or false false (bvult co_8 co_3) or (and true false)) (bvult topo_T_8 topo_T_3)))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_8 topo_U_4))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_8 topo_T_4)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x885 (and true false)))
 (let (($x465 (or false false false or $x885)))
 (=> $x465 (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x1626 (or false false false or)))
 (=> $x1626 (bvult topo_U_8 topo_U_6))))
(assert
 (let (($x165 (and false false)))
 (let (($x1901 (or false false false or $x165)))
 (=> $x1901 (bvult topo_T_8 topo_T_6)))))
(assert
 (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert
 (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert
 (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert
 (=> (or false false (bvult co_8 co_8) or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert
 (let (($x2539 (= co_0 (_ bv2 2))))
 (=> $x2539 (= (_ bv0 32) final_x))))
(assert
 (let (($x2541 (= co_3 (_ bv2 2))))
 (=> $x2541 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x2445 (= co_8 (_ bv2 2))))
 (=> $x2445 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (let (($x2555 (= co_1 (_ bv1 2))))
 (=> $x2555 (= (_ bv0 32) final_y))))
(assert
 (let (($x2421 (= co_5 (_ bv1 2))))
(=> $x2421 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(check-sat)
