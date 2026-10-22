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
(declare-fun input_b () Bool)
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
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x789 (= co_3 (_ bv2 2))))
 (=> $x789 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1100 (= co_7 (_ bv2 2))))
 (=> $x1100 (= (_ bv1 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1537 (= co_5 (_ bv1 2))))
 (=> $x1537 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x994 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x648 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x195 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x424 (and (distinct rf_5_6 false) true)))
 (let (($x1820 (and (distinct rf_1_6 true) true)))
 (let (($x699 (and (distinct rf_5_4 false) true)))
 (let (($x430 (and (distinct rf_1_4 true) true)))
 (let (($x331 (and (distinct rf_7_2 false) true)))
 (let (($x1612 (and (distinct rf_3_2 false) true)))
 (let (($x662 (and (distinct rf_0_2 true) true)))
 (let (($x655 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2007 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1781 (and (distinct input_b false) true)))
 (or $x1781 $x2007 $x1110 $x655 $x662 $x1612 $x331 $x430 $x699 $x1820 $x424 $x2073 $x195 $x648 $x994 $x1258))))))))))))))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x994 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x743 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x937 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x424 (and (distinct rf_5_6 false) true)))
 (let (($x1820 (and (distinct rf_1_6 true) true)))
 (let (($x699 (and (distinct rf_5_4 false) true)))
 (let (($x430 (and (distinct rf_1_4 true) true)))
 (let (($x1131 (and (distinct rf_7_2 true) true)))
 (let (($x1612 (and (distinct rf_3_2 false) true)))
 (let (($x1650 (and (distinct rf_0_2 false) true)))
 (let (($x655 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1037 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x1781 (and (distinct input_b false) true)))
 (or $x1781 $x1037 $x1110 $x655 $x1650 $x1612 $x1131 $x430 $x699 $x1820 $x424 $x2073 $x937 $x743 $x994 $x1258))))))))))))))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x994 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x743 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x937 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x424 (and (distinct rf_5_6 false) true)))
 (let (($x1820 (and (distinct rf_1_6 true) true)))
 (let (($x699 (and (distinct rf_5_4 false) true)))
 (let (($x430 (and (distinct rf_1_4 true) true)))
 (let (($x1131 (and (distinct rf_7_2 true) true)))
 (let (($x1612 (and (distinct rf_3_2 false) true)))
 (let (($x1650 (and (distinct rf_0_2 false) true)))
 (let (($x655 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1037 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x1850 (and (distinct input_b true) true)))
 (or $x1850 $x1037 $x1110 $x655 $x1650 $x1612 $x1131 $x430 $x699 $x1820 $x424 $x2073 $x937 $x743 $x994 $x1258))))))))))))))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x994 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x648 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x195 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x424 (and (distinct rf_5_6 false) true)))
 (let (($x1820 (and (distinct rf_1_6 true) true)))
 (let (($x699 (and (distinct rf_5_4 false) true)))
 (let (($x430 (and (distinct rf_1_4 true) true)))
 (let (($x331 (and (distinct rf_7_2 false) true)))
 (let (($x1612 (and (distinct rf_3_2 false) true)))
 (let (($x662 (and (distinct rf_0_2 true) true)))
 (let (($x655 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2007 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1850 (and (distinct input_b true) true)))
 (or $x1850 $x2007 $x1110 $x655 $x662 $x1612 $x331 $x430 $x699 $x1820 $x424 $x2073 $x195 $x648 $x994 $x1258))))))))))))))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x994 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x648 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x195 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x644 (and (distinct rf_5_6 true) true)))
 (let (($x165 (and (distinct rf_1_6 false) true)))
 (let (($x699 (and (distinct rf_5_4 false) true)))
 (let (($x430 (and (distinct rf_1_4 true) true)))
 (let (($x331 (and (distinct rf_7_2 false) true)))
 (let (($x1612 (and (distinct rf_3_2 false) true)))
 (let (($x662 (and (distinct rf_0_2 true) true)))
 (let (($x22 (and (distinct (_ bv2 32) read_t1_a) true)))
 (let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2007 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1781 (and (distinct input_b false) true)))
 (or $x1781 $x2007 $x1110 $x22 $x662 $x1612 $x331 $x430 $x699 $x165 $x644 $x2073 $x195 $x648 $x994 $x1258))))))))))))))))))
(assert
 (let (($x1258 (and (distinct (_ bv1 2) co_5) true)))
(let (($x994 (and (distinct (_ bv0 2) co_1) true)))
(let (($x648 (and (distinct (_ bv2 2) co_7) true)))
(let (($x195 (and (distinct (_ bv1 2) co_3) true)))
(let (($x2073 (and (distinct (_ bv0 2) co_0) true)))
(let (($x644 (and (distinct rf_5_6 true) true)))
(let (($x165 (and (distinct rf_1_6 false) true)))
(let (($x699 (and (distinct rf_5_4 false) true)))
(let (($x430 (and (distinct rf_1_4 true) true)))
(let (($x331 (and (distinct rf_7_2 false) true)))
(let (($x1612 (and (distinct rf_3_2 false) true)))
(let (($x662 (and (distinct rf_0_2 true) true)))
(let (($x22 (and (distinct (_ bv2 32) read_t1_a) true)))
(let (($x1110 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x2007 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x1850 (and (distinct input_b true) true)))
(or $x1850 $x2007 $x1110 $x22 $x662 $x1612 $x331 $x430 $x699 $x165 $x644 $x2073 $x195 $x648 $x994 $x1258))))))))))))))))))
(check-sat)
