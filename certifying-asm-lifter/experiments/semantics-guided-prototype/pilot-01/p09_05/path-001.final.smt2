; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x814 (= (_ bv0 32) read_t0_a)))
 (= $x814 false)))
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
 (let (($x814 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x814)))
(assert
 (=> rf_6_2 (= (_ bv1 32) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_6_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_4_5))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x800 (bvult co_1 co_4)))
 (let (($x195 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x195 $x800)))))
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
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_1 topo_T_2)))))
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
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x149 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x149) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1336 (and true false)))
 (let (($x149 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x149 $x1336) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x842 (or false false false $x230)))
 (=> $x842 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x166 (or false false false $x230 $x1336)))
 (=> $x166 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x842 (or false false false $x230)))
 (=> $x842 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (=> (or false false false $x230 $x2242) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x842 (or false false false $x230)))
 (=> $x842 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x1770 (or true false false $x230 $x2242)))
 (=> $x1770 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x842 (or false false false $x230)))
 (=> $x842 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x1770 (or true false false $x230 $x2242)))
 (=> $x1770 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x842 (or false false false $x230)))
 (=> $x842 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x230 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x166 (or false false false $x230 $x1336)))
 (=> $x166 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1099 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1099) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1336 (and true false)))
 (let (($x1099 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x1099 $x1336) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2218 (or false false false $x2027)))
 (=> $x2218 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1969 (or false false false $x2027 $x1336)))
 (=> $x1969 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x195 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x195) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1336 (and true false)))
 (let (($x195 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x195 $x1336) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2218 (or false false false $x2027)))
 (=> $x2218 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2849 (or false false false $x2027 $x2242)))
 (=> $x2849 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2218 (or false false false $x2027)))
 (=> $x2218 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2849 (or false false false $x2027 $x2242)))
 (=> $x2849 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x938 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x938) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2242 (and false false)))
 (let (($x938 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x938 $x2242) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2218 (or false false false $x2027)))
 (=> $x2218 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1969 (or false false false $x2027 $x1336)))
 (=> $x1969 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2218 (or false false false $x2027)))
 (=> $x2218 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2027 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1969 (or false false false $x2027 $x1336)))
 (=> $x1969 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x2242 (and false false)))
 (let (($x295 (or false false false or $x2242)))
 (=> $x295 (bvult topo_T_4 topo_T_2)))))
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
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x87 (or false false false $x2066)))
 (=> $x87 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1127 (or false false false $x2066 $x1336)))
 (=> $x1127 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1435 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x1435) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1336 (and true false)))
 (let (($x1435 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x1435 $x1336) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x87 (or false false false $x2066)))
 (=> $x87 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1127 (or false false false $x2066 $x1336)))
 (=> $x1127 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x87 (or false false false $x2066)))
 (=> $x87 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1127 (or false false false $x2066 $x1336)))
 (=> $x1127 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1744 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1744) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x1336 (and true false)))
 (let (($x1744 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1744 $x1336) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x87 (or false false false $x2066)))
 (=> $x87 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (=> (or false false false $x2066 $x2242) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x87 (or false false false $x2066)))
 (=> $x87 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x2242 (and false false)))
 (let (($x2066 (or (and rf_1_5 false) (and rf_4_5 false))))
 (=> (or true false false $x2066 $x2242) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x1336 (and true false)))
 (let (($x2458 (or false false false or $x1336)))
 (=> $x2458 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x2364 (or false false false or)))
 (=> $x2364 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x2242 (and false false)))
 (let (($x295 (or false false false or $x2242)))
 (=> $x295 (bvult topo_T_6 topo_T_5)))))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1791 (= (_ bv1 32) final_x)))
 (let (($x859 (= co_6 (_ bv1 2))))
 (=> $x859 $x1791))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x824 (= co_4 (_ bv1 2))))
 (=> $x824 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x2194 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1114 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1769 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x718 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1547 (and (distinct rf_4_5 false) true)))
 (let (($x16 (and (distinct rf_1_5 true) true)))
 (let (($x2407 (and (distinct rf_4_3 false) true)))
 (let (($x36 (and (distinct rf_1_3 true) true)))
 (let (($x106 (and (distinct rf_6_2 true) true)))
 (let (($x2662 (and (distinct rf_0_2 false) true)))
 (let (($x2109 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x402 (and (distinct (_ bv0 32) read_t0_no) true)))
 (let (($x2198 (and (distinct (_ bv1 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x2198 $x402 $x2109 $x2662 $x106 $x36 $x2407 $x16 $x1547 $x718 $x1769 $x1114 $x2194)))))))))))))))
(assert
 (let (($x2194 (and (distinct (_ bv1 2) co_4) true)))
(let (($x1114 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1769 (and (distinct (_ bv1 2) co_6) true)))
(let (($x718 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1547 (and (distinct rf_4_5 false) true)))
(let (($x16 (and (distinct rf_1_5 true) true)))
(let (($x2407 (and (distinct rf_4_3 false) true)))
(let (($x36 (and (distinct rf_1_3 true) true)))
(let (($x106 (and (distinct rf_6_2 true) true)))
(let (($x2662 (and (distinct rf_0_2 false) true)))
(let (($x2109 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x402 (and (distinct (_ bv0 32) read_t0_no) true)))
(let (($x2198 (and (distinct (_ bv1 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x2198 $x402 $x2109 $x2662 $x106 $x36 $x2407 $x16 $x1547 $x718 $x1769 $x1114 $x2194)))))))))))))))
(check-sat)
