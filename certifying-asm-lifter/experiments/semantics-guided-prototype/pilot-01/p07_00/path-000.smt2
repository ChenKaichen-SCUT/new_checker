; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
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
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
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
 (let (($x1591 (bvult co_0 co_3)))
 (let (($x2018 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x2018 $x1591)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x1775 (bvult co_1 co_5)))
 (let (($x1783 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1783 $x1775)))))
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
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_1 topo_T_3)))))
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
 (let (($x2018 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x2018) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1425 (and true false)))
 (let (($x2018 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x2018 $x1425) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1258 (or false false false $x1937)))
 (=> $x1258 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x470 (or false false false $x1937 $x1425)))
 (=> $x470 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1258 (or false false false $x1937)))
 (=> $x1258 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1937 $x1338) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x533 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x533) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1338 (and false false)))
 (let (($x533 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x533 $x1338) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1258 (or false false false $x1937)))
 (=> $x1258 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1442 (or true false false $x1937 $x1338)))
 (=> $x1442 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1258 (or false false false $x1937)))
 (=> $x1258 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1442 (or true false false $x1937 $x1338)))
 (=> $x1442 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1258 (or false false false $x1937)))
 (=> $x1258 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1937 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x470 (or false false false $x1937 $x1425)))
 (=> $x470 (bvult topo_T_2 topo_T_6))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1338 (and false false)))
 (let (($x331 (or true false false or $x1338)))
 (=> $x331 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1338 (and false false)))
 (let (($x331 (or true false false or $x1338)))
 (=> $x331 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1213 (or false false false $x1961)))
 (=> $x1213 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1895 (or false false false $x1961 $x1425)))
 (=> $x1895 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1783 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1783) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1783 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1783 $x1425) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1213 (or false false false $x1961)))
 (=> $x1213 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x37 (or false false false $x1961 $x1338)))
 (=> $x37 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1213 (or false false false $x1961)))
 (=> $x1213 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x37 (or false false false $x1961 $x1338)))
 (=> $x37 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1213 (or false false false $x1961)))
 (=> $x1213 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x37 (or false false false $x1961 $x1338)))
 (=> $x37 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1663 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1663) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1338 (and false false)))
 (let (($x1663 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1663 $x1338) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1213 (or false false false $x1961)))
 (=> $x1213 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1961 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1895 (or false false false $x1961 $x1425)))
 (=> $x1895 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1425 (and true false)))
 (let (($x1312 (or false false false or $x1425)))
 (=> $x1312 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1338 (and false false)))
 (let (($x64 (or false false false or $x1338)))
 (=> $x64 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x2368 (or false false false or)))
 (=> $x2368 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1338 (and false false)))
 (let (($x64 (or false false false or $x1338)))
 (=> $x64 (bvult topo_T_5 topo_T_3)))))
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
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x184 (or false false false $x2356)))
 (=> $x184 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x627 (or false false false $x2356 $x1425)))
 (=> $x627 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x727 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x727) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x1425 (and true false)))
 (let (($x727 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)))))
 (=> (or false false false $x727 $x1425) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x184 (or false false false $x2356)))
 (=> $x184 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x627 (or false false false $x2356 $x1425)))
 (=> $x627 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x184 (or false false false $x2356)))
 (=> $x184 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x627 (or false false false $x2356 $x1425)))
 (=> $x627 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x184 (or false false false $x2356)))
 (=> $x184 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1425 (and true false)))
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x627 (or false false false $x2356 $x1425)))
 (=> $x627 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x443 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x443) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x1425 (and true false)))
 (let (($x443 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)))))
 (=> (or false false false $x443 $x1425) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (let (($x184 (or false false false $x2356)))
 (=> $x184 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1338 (and false false)))
 (let (($x2356 (or (and rf_1_6 false) (and rf_5_6 false))))
 (=> (or false false false $x2356 $x1338) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x229 (= co_0 (_ bv1 2))))
 (=> $x229 (= (_ bv0 32) final_x))))
(assert
 (let (($x161 (= co_3 (_ bv1 2))))
 (=> $x161 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1272 (= co_1 (_ bv1 2))))
 (=> $x1272 (= (_ bv0 32) final_y))))
(assert
 (let (($x631 (= co_5 (_ bv1 2))))
(=> $x631 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(check-sat)
