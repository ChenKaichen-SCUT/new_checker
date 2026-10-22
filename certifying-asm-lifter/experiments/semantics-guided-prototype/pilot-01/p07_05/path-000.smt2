; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_7_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_7) true))
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
 (=> rf_7_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_7_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_1_6 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_6 (= (bvadd read_t0_b (_ bv2 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_6 rf_5_6))
(assert
 (let (($x711 (bvult co_0 co_3)))
 (let (($x2059 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (not (and $x2059 $x711)))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (not (and $x1527 false))))
(assert
 (let (($x1520 (bvult co_7 co_3)))
 (let (($x404 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (not (and $x404 $x1520)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x785 (bvult co_1 co_5)))
 (let (($x1722 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1722 $x785)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_1 topo_T_3)))))
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
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x2059 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x2059) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1783 (and true false)))
 (let (($x2059 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x2059 $x1783) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x77 (or false false false $x1527)))
 (=> $x77 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1687 (or false false false $x1527 $x1783)))
 (=> $x1687 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x77 (or false false false $x1527)))
 (=> $x77 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (=> (or false false false $x1527 $x2019) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1226 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x1226) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1226 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_7_2 (bvult co_7 co_3)))))
 (=> (or true false false $x1226 $x2019) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x77 (or false false false $x1527)))
 (=> $x77 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1915 (or true false false $x1527 $x2019)))
 (=> $x1915 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x77 (or false false false $x1527)))
 (=> $x77 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1915 (or true false false $x1527 $x2019)))
 (=> $x1915 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x77 (or false false false $x1527)))
 (=> $x77 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1527 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_7_2 false))))
 (let (($x1687 (or false false false $x1527 $x1783)))
 (=> $x1687 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x404 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x404) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x1783 (and true false)))
 (let (($x404 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_3_2 (bvult co_3 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x404 $x1783) (bvult topo_T_2 topo_T_7)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1881 (or true false false or $x2019)))
 (=> $x1881 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1881 (or true false false or $x2019)))
 (=> $x1881 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false false (bvult co_3 co_7) or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false (bvult co_3 co_7) or (and true false)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1576 (or false false false $x386 $x1783)))
 (=> $x1576 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1722 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1722) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1722 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1722 $x1783) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1039 (or false false false $x386 $x2019)))
 (=> $x1039 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1039 (or false false false $x386 $x2019)))
 (=> $x1039 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1039 (or false false false $x386 $x2019)))
 (=> $x1039 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1271 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1271) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1271 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1271 $x2019) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1576 (or false false false $x386 $x1783)))
 (=> $x1576 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x312 (or false false false $x386)))
 (=> $x312 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x386 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1576 (or false false false $x386 $x1783)))
 (=> $x1576 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x2019 (and false false)))
 (let (($x708 (or false false false or $x2019)))
 (=> $x708 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x2019 (and false false)))
 (let (($x708 (or false false false or $x2019)))
 (=> $x708 (bvult topo_T_5 topo_T_3)))))
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
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x1887 (or false false false $x1306 $x1783)))
 (=> $x1887 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1098 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x1098) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1098 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x1098 $x1783) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x1887 (or false false false $x1306 $x1783)))
 (=> $x1887 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x1887 (or false false false $x1306 $x1783)))
 (=> $x1887 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x1887 (or false false false $x1306 $x1783)))
 (=> $x1887 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1199 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x1199) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x1783 (and true false)))
 (let (($x1199 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x1199 $x1783) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (=> (or false false false $x1306 $x2019) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x334 (or false false false $x1306)))
 (=> $x334 (bvult topo_U_6 topo_U_7)))))
(assert
 (let (($x2019 (and false false)))
 (let (($x1306 (or (and rf_1_6 false) (and rf_5_6 false))))
 (=> (or true false false $x1306 $x2019) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (=> (or false false (bvult co_7 co_3) or) (bvult topo_U_7 topo_U_3)))
(assert
 (=> (or false false (bvult co_7 co_3) or (and true false)) (bvult topo_T_7 topo_T_3)))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x1783 (and true false)))
 (let (($x422 (or false false false or $x1783)))
 (=> $x422 (bvult topo_T_7 topo_T_5)))))
(assert
 (let (($x2365 (or false false false or)))
 (=> $x2365 (bvult topo_U_7 topo_U_6))))
(assert
 (let (($x2019 (and false false)))
 (let (($x708 (or false false false or $x2019)))
 (=> $x708 (bvult topo_T_7 topo_T_6)))))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x1132 (= co_0 (_ bv2 2))))
 (=> $x1132 (= (_ bv0 32) final_x))))
(assert
 (let (($x789 (= co_3 (_ bv2 2))))
 (=> $x789 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1100 (= co_7 (_ bv2 2))))
 (=> $x1100 (= (_ bv1 32) final_x))))
(assert
 (let (($x1451 (= co_1 (_ bv1 2))))
 (=> $x1451 (= (_ bv0 32) final_y))))
(assert
 (let (($x1537 (= co_5 (_ bv1 2))))
(=> $x1537 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(check-sat)
