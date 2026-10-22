; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
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
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_3_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_6))
(assert
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (not (and $x104 false))))
(assert
 (let (($x840 (bvult co_1 co_5)))
 (let (($x185 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x185 $x840)))))
(assert
 (let (($x1179 (bvult co_3 co_5)))
 (let (($x1766 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (not (and $x1766 $x1179)))))
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
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x437 (and true false)))
 (let (($x1334 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x1334 $x437) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x437 (and true false)))
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x1318 (or false false false $x543 $x437)))
 (=> $x1318 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x543 (or (and rf_0_2 false))))
 (=> (or false false false $x543 $x1257) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x543 (or (and rf_0_2 false))))
 (=> (or true false false $x543 $x1257) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x437 (and true false)))
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x1318 (or false false false $x543 $x437)))
 (=> $x1318 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x437 (and true false)))
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x1318 (or false false false $x543 $x437)))
 (=> $x1318 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x884 (or false false false $x543)))
 (=> $x884 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x437 (and true false)))
 (let (($x543 (or (and rf_0_2 false))))
 (let (($x1318 (or false false false $x543 $x437)))
 (=> $x1318 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_3 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1709 (or false false false $x104)))
 (=> $x1709 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x437 (and true false)))
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1541 (or false false false $x104 $x437)))
 (=> $x1541 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x185 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x185) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x437 (and true false)))
 (let (($x185 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x185 $x437) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1709 (or false false false $x104)))
 (=> $x1709 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x437 (and true false)))
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1541 (or false false false $x104 $x437)))
 (=> $x1541 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1766 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x1766) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x437 (and true false)))
 (let (($x1766 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x1766 $x437) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1709 (or false false false $x104)))
 (=> $x1709 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or false false false $x104 $x1257) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1386 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1386) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1257 (and false false)))
 (let (($x1386 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1386 $x1257) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1709 (or false false false $x104)))
 (=> $x1709 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x104 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or true false false $x104 $x1257) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x437 (and true false)))
 (let (($x1309 (or false false false or $x437)))
 (=> $x1309 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1730 (or false false false or)))
 (=> $x1730 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (=> (or false false false (or (and rf_0_6 (bvult co_0 co_0)))) (bvult topo_U_6 topo_U_0)))
(assert
 (let (($x437 (and true false)))
 (let (($x733 (or (and rf_0_6 (bvult co_0 co_0)))))
 (=> (or false false false $x733 $x437) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x437 (and true false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1066 (or false false false $x1000 $x437)))
 (=> $x1066 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x437 (and true false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1066 (or false false false $x1000 $x437)))
 (=> $x1066 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x437 (and true false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1066 (or false false false $x1000 $x437)))
 (=> $x1066 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1728 (or false false false $x1000 $x1257)))
 (=> $x1728 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1728 (or false false false $x1000 $x1257)))
 (=> $x1728 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x78 (or false false false $x1000)))
 (=> $x78 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1257 (and false false)))
 (let (($x1000 (or (and rf_0_6 false))))
 (let (($x1728 (or false false false $x1000 $x1257)))
 (=> $x1728 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1390 (= co_0 (_ bv0 1))))
 (=> $x1390 (= (_ bv0 32) final_x))))
(assert
 (let (($x259 (= co_1 (_ bv2 2))))
 (=> $x259 (= (_ bv0 32) final_y))))
(assert
 (let (($x1229 (= co_3 (_ bv2 2))))
 (=> $x1229 (= (_ bv1 32) final_y))))
(assert
 (let (($x1236 (= co_5 (_ bv2 2))))
(=> $x1236 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
