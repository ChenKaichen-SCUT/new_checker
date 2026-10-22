; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_5_3 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_2_6 () Bool)
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
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_3 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_5_3))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_6 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_2_6))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x1198 (bvult co_1 co_5)))
 (let (($x1365 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1365 $x1198)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_2 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x657 (or false false false $x1502)))
 (=> $x657 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x415 (and true false)))
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x747 (or false false false $x1502 $x415)))
 (=> $x747 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x859 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x859) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x415 (and true false)))
 (let (($x859 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x859 $x415) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x657 (or false false false $x1502)))
 (=> $x657 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x452 (and false false)))
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x986 (or false false false $x1502 $x452)))
 (=> $x986 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x657 (or false false false $x1502)))
 (=> $x657 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x452 (and false false)))
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x986 (or false false false $x1502 $x452)))
 (=> $x986 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x657 (or false false false $x1502)))
 (=> $x657 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x415 (and true false)))
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x747 (or false false false $x1502 $x415)))
 (=> $x747 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x6 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x6) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x415 (and true false)))
 (let (($x6 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x6 $x415) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x657 (or false false false $x1502)))
 (=> $x657 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x415 (and true false)))
 (let (($x1502 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x747 (or false false false $x1502 $x415)))
 (=> $x747 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1617 (or false false false $x33)))
 (=> $x1617 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x415 (and true false)))
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x156 (or false false false $x33 $x415)))
 (=> $x156 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1365 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1365) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x415 (and true false)))
 (let (($x1365 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1365 $x415) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1617 (or false false false $x33)))
 (=> $x1617 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x415 (and true false)))
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x156 (or false false false $x33 $x415)))
 (=> $x156 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1617 (or false false false $x33)))
 (=> $x1617 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x415 (and true false)))
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x156 (or false false false $x33 $x415)))
 (=> $x156 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1617 (or false false false $x33)))
 (=> $x1617 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x452 (and false false)))
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x33 $x452) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x143 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x143) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x452 (and false false)))
 (let (($x143 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x143 $x452) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1617 (or false false false $x33)))
 (=> $x1617 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x452 (and false false)))
 (let (($x33 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or true false false $x33 $x452) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x415 (and true false)))
 (let (($x690 (or false false false or $x415)))
 (=> $x690 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x149 (or false false false or)))
 (=> $x149 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x383 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x383) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x415 (and true false)))
 (let (($x383 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)))))
 (=> (or false false false $x383 $x415) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1711 (or false false false $x1465)))
 (=> $x1711 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x415 (and true false)))
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1541 (or false false false $x1465 $x415)))
 (=> $x1541 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1009 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1009) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x415 (and true false)))
 (let (($x1009 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)))))
 (=> (or false false false $x1009 $x415) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1711 (or false false false $x1465)))
 (=> $x1711 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x415 (and true false)))
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1541 (or false false false $x1465 $x415)))
 (=> $x1541 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1711 (or false false false $x1465)))
 (=> $x1711 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x452 (and false false)))
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x558 (or false false false $x1465 $x452)))
 (=> $x558 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1711 (or false false false $x1465)))
 (=> $x1711 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x452 (and false false)))
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x558 (or false false false $x1465 $x452)))
 (=> $x558 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x1711 (or false false false $x1465)))
 (=> $x1711 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x452 (and false false)))
 (let (($x1465 (or (and rf_0_6 false) (and rf_2_6 false))))
 (let (($x558 (or false false false $x1465 $x452)))
 (=> $x558 (bvult topo_T_6 topo_T_6))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x146 (= (_ bv1 32) final_x)))
 (let (($x1305 (= co_2 (_ bv1 2))))
 (=> $x1305 $x146))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1174 (= co_5 (_ bv1 2))))
 (=> $x1174 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x417 (and (distinct rf_2_6 false) true)))
 (let (($x357 (and (distinct rf_0_6 true) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1070 (and (distinct rf_5_3 true) true)))
 (let (($x1294 (and (distinct rf_1_3 false) true)))
 (let (($x1532 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1728 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x318 (and (distinct input_b false) true)))
 (or $x318 $x1728 $x1176 $x1532 $x1294 $x1070 $x1492 $x401 $x357 $x417 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x417 (and (distinct rf_2_6 false) true)))
 (let (($x357 (and (distinct rf_0_6 true) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1680 (and (distinct rf_5_3 false) true)))
 (let (($x562 (and (distinct rf_1_3 true) true)))
 (let (($x1532 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1648 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x318 (and (distinct input_b false) true)))
 (or $x318 $x1648 $x1176 $x1532 $x562 $x1680 $x1492 $x401 $x357 $x417 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x417 (and (distinct rf_2_6 false) true)))
 (let (($x357 (and (distinct rf_0_6 true) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1680 (and (distinct rf_5_3 false) true)))
 (let (($x562 (and (distinct rf_1_3 true) true)))
 (let (($x1532 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1648 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1664 (and (distinct input_b true) true)))
 (or $x1664 $x1648 $x1176 $x1532 $x562 $x1680 $x1492 $x401 $x357 $x417 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1719 (and (distinct rf_2_6 true) true)))
 (let (($x1060 (and (distinct rf_0_6 false) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1680 (and (distinct rf_5_3 false) true)))
 (let (($x562 (and (distinct rf_1_3 true) true)))
 (let (($x1822 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1648 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x318 (and (distinct input_b false) true)))
 (or $x318 $x1648 $x1176 $x1822 $x562 $x1680 $x1492 $x401 $x1060 $x1719 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1719 (and (distinct rf_2_6 true) true)))
 (let (($x1060 (and (distinct rf_0_6 false) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1070 (and (distinct rf_5_3 true) true)))
 (let (($x1294 (and (distinct rf_1_3 false) true)))
 (let (($x1822 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1728 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x318 (and (distinct input_b false) true)))
 (or $x318 $x1728 $x1176 $x1822 $x1294 $x1070 $x1492 $x401 $x1060 $x1719 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1719 (and (distinct rf_2_6 true) true)))
 (let (($x1060 (and (distinct rf_0_6 false) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1070 (and (distinct rf_5_3 true) true)))
 (let (($x1294 (and (distinct rf_1_3 false) true)))
 (let (($x1822 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1728 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1664 (and (distinct input_b true) true)))
 (or $x1664 $x1728 $x1176 $x1822 $x1294 $x1070 $x1492 $x401 $x1060 $x1719 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x365 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x741 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1719 (and (distinct rf_2_6 true) true)))
 (let (($x1060 (and (distinct rf_0_6 false) true)))
 (let (($x401 (and (distinct rf_5_4 false) true)))
 (let (($x1492 (and (distinct rf_1_4 true) true)))
 (let (($x1680 (and (distinct rf_5_3 false) true)))
 (let (($x562 (and (distinct rf_1_3 true) true)))
 (let (($x1822 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1648 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1664 (and (distinct input_b true) true)))
 (or $x1664 $x1648 $x1176 $x1822 $x562 $x1680 $x1492 $x401 $x1060 $x1719 $x741 $x1375 $x365 $x159))))))))))))))))
(assert
 (let (($x159 (and (distinct (_ bv1 2) co_5) true)))
(let (($x365 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1375 (and (distinct (_ bv1 2) co_2) true)))
(let (($x741 (and (distinct (_ bv0 2) co_0) true)))
(let (($x417 (and (distinct rf_2_6 false) true)))
(let (($x357 (and (distinct rf_0_6 true) true)))
(let (($x401 (and (distinct rf_5_4 false) true)))
(let (($x1492 (and (distinct rf_1_4 true) true)))
(let (($x1070 (and (distinct rf_5_3 true) true)))
(let (($x1294 (and (distinct rf_1_3 false) true)))
(let (($x1532 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1176 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1728 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x1664 (and (distinct input_b true) true)))
(or $x1664 $x1728 $x1176 $x1532 $x1294 $x1070 $x1492 $x401 $x357 $x417 $x741 $x1375 $x365 $x159))))))))))))))))
(check-sat)
