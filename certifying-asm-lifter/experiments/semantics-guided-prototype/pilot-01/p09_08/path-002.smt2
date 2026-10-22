; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_4_7 () Bool)
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
 (let (($x780 (= (_ bv0 32) read_t0_a)))
 (= $x780 false)))
(assert
 (= input_b true))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_0 co_6) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (let (($x780 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x780)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_6_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert
 (=> rf_1_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_4_7 (= (bvadd read_t0_no (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_7 rf_4_7))
(assert
 (let (($x876 (bvult co_0 co_6)))
 (let (($x125 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x125 $x876)))))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x1394 (bvult co_1 co_4)))
 (let (($x2922 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x2922 $x1394)))))
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
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_0 topo_T_7)))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert
 (let (($x1099 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1099) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x53 (and true false)))
 (let (($x1099 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x1099 $x53) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x53 (and true false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x722 (or false false false $x162 $x53)))
 (=> $x722 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (=> (or false false false $x162 $x2161) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x867 (or true false false $x162 $x2161)))
 (=> $x867 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x867 (or true false false $x162 $x2161)))
 (=> $x867 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x53 (and true false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x722 (or false false false $x162 $x53)))
 (=> $x722 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x855 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x855) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x53 (and true false)))
 (let (($x855 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x855 $x53) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x2235 (or false false false $x162)))
 (=> $x2235 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x53 (and true false)))
 (let (($x162 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x722 (or false false false $x162 $x53)))
 (=> $x722 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x53 (and true false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x339 (or false false false $x23 $x53)))
 (=> $x339 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x2922 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x2922) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x53 (and true false)))
 (let (($x2922 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x2922 $x53) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2392 (or false false false $x23 $x2161)))
 (=> $x2392 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2392 (or false false false $x23 $x2161)))
 (=> $x2392 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x2168 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x2168) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2161 (and false false)))
 (let (($x2168 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x2168 $x2161) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x53 (and true false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x339 (or false false false $x23 $x53)))
 (=> $x339 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x53 (and true false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x339 (or false false false $x23 $x53)))
 (=> $x339 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1029 (or false false false $x23)))
 (=> $x1029 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x53 (and true false)))
 (let (($x23 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x339 (or false false false $x23 $x53)))
 (=> $x339 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_4 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_4 topo_T_6)))))
(assert
 (=> (or false rf_4_7 false or) (bvult topo_U_4 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_4_7)) (bvult topo_T_4 topo_T_7)))
(assert
 (let (($x125 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x125) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x53 (and true false)))
 (let (($x125 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x125 $x53) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x53 (and true false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x506 (or false false false $x246 $x53)))
 (=> $x506 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x53 (and true false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x506 (or false false false $x246 $x53)))
 (=> $x506 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x53 (and true false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x506 (or false false false $x246 $x53)))
 (=> $x506 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x53 (and true false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x506 (or false false false $x246 $x53)))
 (=> $x506 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (=> (or false false false $x246 $x2161) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x800 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x800) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x2161 (and false false)))
 (let (($x800 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x800 $x2161) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x1296 (or false false false $x246)))
 (=> $x1296 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x246 (or (and rf_0_5 false) (and rf_6_5 false))))
 (=> (or true false false $x246 $x2161) (bvult topo_T_5 topo_T_7)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x53 (and true false)))
 (let (($x2251 (or false false false or $x53)))
 (=> $x2251 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x123 (or false false false or)))
 (=> $x123 (bvult topo_U_6 topo_U_7))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_0)))))
(assert
 (let (($x53 (and true false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2938 (or false false false $x525 $x53)))
 (=> $x2938 (bvult topo_T_7 topo_T_0))))))
(assert
 (let (($x1956 (or (and rf_1_7 (bvult co_1 co_1)) (and rf_4_7 (bvult co_4 co_1)))))
 (=> (or false false false $x1956) (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x53 (and true false)))
 (let (($x1956 (or (and rf_1_7 (bvult co_1 co_1)) (and rf_4_7 (bvult co_4 co_1)))))
 (=> (or false false false $x1956 $x53) (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x53 (and true false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2938 (or false false false $x525 $x53)))
 (=> $x2938 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x53 (and true false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2938 (or false false false $x525 $x53)))
 (=> $x2938 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x2102 (or (and rf_1_7 (bvult co_1 co_4)) (and rf_4_7 (bvult co_4 co_4)))))
 (=> (or false false false $x2102) (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x53 (and true false)))
 (let (($x2102 (or (and rf_1_7 (bvult co_1 co_4)) (and rf_4_7 (bvult co_4 co_4)))))
 (=> (or false false false $x2102 $x53) (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x1972 (or false false false $x525 $x2161)))
 (=> $x1972 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x1972 (or false false false $x525 $x2161)))
 (=> $x1972 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x2601 (or false false false $x525)))
 (=> $x2601 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x2161 (and false false)))
 (let (($x525 (or (and rf_1_7 false) (and rf_4_7 false))))
 (let (($x1972 (or false false false $x525 $x2161)))
 (=> $x1972 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2610 (= co_0 (_ bv1 2))))
 (=> $x2610 (= (_ bv0 32) final_x))))
(assert
 (let (($x491 (= co_6 (_ bv1 2))))
 (=> $x491 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x377 (= co_1 (_ bv1 2))))
 (=> $x377 (= (_ bv0 32) final_y))))
(assert
 (let (($x499 (= co_4 (_ bv1 2))))
(=> $x499 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(check-sat)
