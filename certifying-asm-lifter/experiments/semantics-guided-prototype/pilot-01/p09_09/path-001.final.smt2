; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_no () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x329 (= (_ bv0 32) read_t0_a)))
 (= $x329 true)))
(assert
 (let (($x1723 (= (_ bv0 32) read_t1_a)))
 (= $x1723 false)))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_7 (_ bv2 2)))
(assert
 (and (distinct co_0 co_7) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (let (($x329 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x329)))
(assert
 (=> rf_7_2 (= (bvadd read_t1_no (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_7_2))
(assert
 (let (($x1134 (= (_ bv0 32) read_t0_yes)))
 (=> rf_1_3 $x1134)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (let (($x1723 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x1723)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_4_5))
(assert
 (let (($x544 (= (_ bv0 32) read_t1_no)))
 (=> rf_0_6 $x544)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_no (_ bv2 32)) read_t1_no)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_7_6))
(assert
 (let (($x1956 (bvult co_0 co_7)))
 (let (($x1396 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x1396 $x1956)))))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x2191 (bvult co_1 co_4)))
 (let (($x1163 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x1163 $x2191)))))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (bvult topo_U_0 (_ bv8 4)))
(assert
 (bvult topo_U_1 (_ bv8 4)))
(assert
 (bvult topo_U_2 (_ bv8 4)))
(assert
 (bvult topo_U_3 (_ bv8 4)))
(assert
 (bvult topo_U_4 (_ bv8 4)))
(assert
 (bvult topo_U_5 (_ bv8 4)))
(assert
 (bvult topo_U_6 (_ bv8 4)))
(assert
 (bvult topo_U_7 (_ bv8 4)))
(assert
 (bvult topo_T_0 (_ bv8 4)))
(assert
 (bvult topo_T_1 (_ bv8 4)))
(assert
 (bvult topo_T_2 (_ bv8 4)))
(assert
 (bvult topo_T_3 (_ bv8 4)))
(assert
 (bvult topo_T_4 (_ bv8 4)))
(assert
 (bvult topo_T_5 (_ bv8 4)))
(assert
 (bvult topo_T_6 (_ bv8 4)))
(assert
 (bvult topo_T_7 (_ bv8 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x2412 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x2412) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x2829 (and true false)))
 (let (($x2412 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x2412 $x2829) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x655 (or false false false $x676 $x2829)))
 (=> $x655 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (=> (or false false false $x676 $x1114) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x198 (or true false false $x676 $x1114)))
 (=> $x198 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x198 (or true false false $x676 $x1114)))
 (=> $x198 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x655 (or false false false $x676 $x2829)))
 (=> $x655 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x408 (or false false false $x676)))
 (=> $x408 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x676 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x655 (or false false false $x676 $x2829)))
 (=> $x655 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x660 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x660) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x2829 (and true false)))
 (let (($x660 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x660 $x2829) (bvult topo_T_2 topo_T_7)))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1199 (or false false false $x1516 $x2829)))
 (=> $x1199 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1163 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1163) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1163 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x1163 $x2829) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x283 (or false false false $x1516 $x1114)))
 (=> $x283 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x283 (or false false false $x1516 $x1114)))
 (=> $x283 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1003 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1003) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1003 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1003 $x1114) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1199 (or false false false $x1516 $x2829)))
 (=> $x1199 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1199 (or false false false $x1516 $x2829)))
 (=> $x1199 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1520 (or false false false $x1516)))
 (=> $x1520 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1516 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1199 (or false false false $x1516 $x2829)))
 (=> $x1199 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1431 (or false false false or $x1114)))
 (=> $x1431 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x2333 (or false false false $x653 $x2829)))
 (=> $x2333 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x207 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x207) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x2829 (and true false)))
 (let (($x207 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x207 $x2829) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x2333 (or false false false $x653 $x2829)))
 (=> $x2333 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x2333 (or false false false $x653 $x2829)))
 (=> $x2333 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x170 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x170) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x2829 (and true false)))
 (let (($x170 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x170 $x2829) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (=> (or false false false $x653 $x1114) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x2480 (or true false false $x653 $x1114)))
 (=> $x2480 (bvult topo_T_5 topo_T_6))))))
(assert
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1298 (or false false false $x653)))
 (=> $x1298 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x653 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x2480 (or true false false $x653 $x1114)))
 (=> $x2480 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x1396 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x1396) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x2829 (and true false)))
 (let (($x1396 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x1396 $x2829) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1010 (or false false false $x2316 $x2829)))
 (=> $x1010 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1010 (or false false false $x2316 $x2829)))
 (=> $x1010 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1010 (or false false false $x2316 $x2829)))
 (=> $x1010 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x2829 (and true false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1010 (or false false false $x2316 $x2829)))
 (=> $x1010 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1277 (or false false false $x2316 $x1114)))
 (=> $x1277 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x943 (or false false false $x2316)))
 (=> $x943 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1114 (and false false)))
 (let (($x2316 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1277 (or false false false $x2316 $x1114)))
 (=> $x1277 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1025 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1025) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1025 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1025 $x1114) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x2829 (and true false)))
 (let (($x730 (or false false false or $x2829)))
 (=> $x730 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x86 (or false false false or)))
 (=> $x86 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x1114 (and false false)))
 (let (($x1431 (or false false false or $x1114)))
 (=> $x1431 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x349 (= co_7 (_ bv1 2))))
 (=> $x349 (= final_x (bvadd read_t1_no (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x837 (= co_4 (_ bv1 2))))
 (=> $x837 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x220 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1849 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1372 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x142 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x650 (and (distinct rf_7_6 false) true)))
 (let (($x2923 (and (distinct rf_0_6 true) true)))
 (let (($x1903 (and (distinct rf_4_5 true) true)))
 (let (($x133 (and (distinct rf_1_5 false) true)))
 (let (($x500 (and (distinct rf_4_3 false) true)))
 (let (($x201 (and (distinct rf_1_3 true) true)))
 (let (($x2113 (and (distinct rf_7_2 false) true)))
 (let (($x93 (and (distinct rf_0_2 true) true)))
 (let (($x1769 (and (distinct (_ bv0 32) read_t1_no) true)))
 (let (($x1040 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1527 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x857 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x857 $x1527 $x1040 $x1769 $x93 $x2113 $x201 $x500 $x133 $x1903 $x2923 $x650 $x142 $x1372 $x1849 $x220))))))))))))))))))
(assert
 (let (($x220 (and (distinct (_ bv1 2) co_4) true)))
(let (($x1849 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1372 (and (distinct (_ bv1 2) co_7) true)))
(let (($x142 (and (distinct (_ bv0 2) co_0) true)))
(let (($x650 (and (distinct rf_7_6 false) true)))
(let (($x2923 (and (distinct rf_0_6 true) true)))
(let (($x1903 (and (distinct rf_4_5 true) true)))
(let (($x133 (and (distinct rf_1_5 false) true)))
(let (($x500 (and (distinct rf_4_3 false) true)))
(let (($x201 (and (distinct rf_1_3 true) true)))
(let (($x2113 (and (distinct rf_7_2 false) true)))
(let (($x93 (and (distinct rf_0_2 true) true)))
(let (($x1769 (and (distinct (_ bv0 32) read_t1_no) true)))
(let (($x1040 (and (distinct (_ bv1 32) read_t1_a) true)))
(let (($x1527 (and (distinct (_ bv0 32) read_t0_yes) true)))
(let (($x857 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x857 $x1527 $x1040 $x1769 $x93 $x2113 $x201 $x500 $x133 $x1903 $x2923 $x650 $x142 $x1372 $x1849 $x220))))))))))))))))))
(check-sat)
