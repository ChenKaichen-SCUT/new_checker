; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun rf_5_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
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
 (= input_b true))
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
 (=> rf_1_2 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 (=> rf_5_2 (= (_ bv1 32) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_2 rf_3_2 rf_5_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_7))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (not (and $x2493 false))))
(assert
 (let (($x2266 (bvult co_1 co_3)))
 (let (($x1383 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (not (and $x1383 $x2266)))))
(assert
 (let (($x728 (bvult co_5 co_3)))
 (let (($x2387 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (not (and $x2387 $x728)))))
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
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (=> (or false rf_1_2 false or) (bvult topo_U_1 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_1_2)) (bvult topo_T_1 topo_T_2)))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x717 (or false false false $x2493)))
 (=> $x717 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x337 (and true false)))
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x2493 $x337)))
 (=> $x2614 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x1383 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x1383) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x337 (and true false)))
 (let (($x1383 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x1383 $x337) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x717 (or false false false $x2493)))
 (=> $x717 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x474 (and false false)))
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x2493 $x474) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1829 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x1829) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x474 (and false false)))
 (let (($x1829 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x1829 $x474) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x717 (or false false false $x2493)))
 (=> $x717 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x474 (and false false)))
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or true false false $x2493 $x474) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x2387 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x2387) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x337 (and true false)))
 (let (($x2387 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x2387 $x337) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x717 (or false false false $x2493)))
 (=> $x717 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x337 (and true false)))
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x2493 $x337)))
 (=> $x2614 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x717 (or false false false $x2493)))
 (=> $x717 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x337 (and true false)))
 (let (($x2493 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x2614 (or false false false $x2493 $x337)))
 (=> $x2614 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_3 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x337 (and true false)))
 (let (($x2502 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x2502 $x337) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x337 (and true false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2377 (or false false false $x1330 $x337)))
 (=> $x2377 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x474 (and false false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2679 (or false false false $x1330 $x474)))
 (=> $x2679 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x474 (and false false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2679 (or false false false $x1330 $x474)))
 (=> $x2679 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x474 (and false false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2679 (or false false false $x1330 $x474)))
 (=> $x2679 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x337 (and true false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2377 (or false false false $x1330 $x337)))
 (=> $x2377 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x337 (and true false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2377 (or false false false $x1330 $x337)))
 (=> $x2377 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x1591 (or false false false $x1330)))
 (=> $x1591 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x337 (and true false)))
 (let (($x1330 (or (and rf_0_4 false))))
 (let (($x2377 (or false false false $x1330 $x337)))
 (=> $x2377 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_5 topo_T_4)))))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x474 (and false false)))
 (let (($x91 (or false false false or $x474)))
 (=> $x91 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_5 topo_U_7))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_5 topo_T_7)))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x337 (and true false)))
 (let (($x2395 (or false false false or $x337)))
 (=> $x2395 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x474 (and false false)))
 (let (($x91 (or false false false or $x474)))
 (=> $x91 (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_6))))
(assert
 (let (($x474 (and false false)))
 (let (($x91 (or false false false or $x474)))
 (=> $x91 (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1570 (or false false false or)))
 (=> $x1570 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x474 (and false false)))
 (let (($x91 (or false false false or $x474)))
 (=> $x91 (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_7 (bvult co_0 co_0)))) (bvult topo_U_7 topo_U_0)))
(assert
 (let (($x337 (and true false)))
 (let (($x209 (or (and rf_0_7 (bvult co_0 co_0)))))
 (=> (or false false false $x209 $x337) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x337 (and true false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2380 (or false false false $x858 $x337)))
 (=> $x2380 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x337 (and true false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2380 (or false false false $x858 $x337)))
 (=> $x2380 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x337 (and true false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2380 (or false false false $x858 $x337)))
 (=> $x2380 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x337 (and true false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2380 (or false false false $x858 $x337)))
 (=> $x2380 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x474 (and false false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2284 (or false false false $x858 $x474)))
 (=> $x2284 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x474 (and false false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2284 (or false false false $x858 $x474)))
 (=> $x2284 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2633 (or false false false $x858)))
 (=> $x2633 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x474 (and false false)))
 (let (($x858 (or (and rf_0_7 false))))
 (let (($x2284 (or false false false $x858 $x474)))
 (=> $x2284 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x878 (= co_0 (_ bv0 1))))
 (=> $x878 (= (_ bv0 32) final_x))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x383 (= co_3 (_ bv2 2))))
 (=> $x383 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x508 (= co_5 (_ bv2 2))))
 (=> $x508 (= (_ bv1 32) final_y))))
(assert
 (let (($x2914 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x580 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1103 (and (distinct rf_0_7 true) true)))
 (let (($x1769 (and (distinct rf_0_4 true) true)))
 (let (($x2928 (and (distinct rf_3_2 false) true)))
 (let (($x2398 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x2376 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1531 (and (distinct input_b true) true)))
 (or $x1531 (and (distinct (_ bv1 32) read_t0_yes) true) $x2376 $x2398 (and (distinct rf_1_2 false) true) $x2928 (and (distinct rf_5_2 true) true) $x1769 $x1103 $x580 $x2914 (and (distinct (_ bv2 2) co_3) true) (and (distinct (_ bv1 2) co_5) true)))))))))))
(assert
 (let (($x2914 (and (distinct (_ bv0 2) co_1) true)))
(let (($x580 (and (distinct (_ bv0 1) co_0) true)))
(let (($x1103 (and (distinct rf_0_7 true) true)))
(let (($x1769 (and (distinct rf_0_4 true) true)))
(let (($x2928 (and (distinct rf_3_2 false) true)))
(let (($x2398 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x2376 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x1531 (and (distinct input_b true) true)))
(or $x1531 (and (distinct (_ bv0 32) read_t0_yes) true) $x2376 $x2398 (and (distinct rf_1_2 true) true) $x2928 (and (distinct rf_5_2 false) true) $x1769 $x1103 $x580 $x2914 (and (distinct (_ bv1 2) co_3) true) (and (distinct (_ bv2 2) co_5) true)))))))))))
(check-sat)
