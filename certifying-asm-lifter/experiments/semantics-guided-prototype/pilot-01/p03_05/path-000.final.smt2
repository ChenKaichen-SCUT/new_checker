; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
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
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_5) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (bvult topo_U_0 (_ bv6 3)))
(assert
 (bvult topo_U_1 (_ bv6 3)))
(assert
 (bvult topo_U_2 (_ bv6 3)))
(assert
 (bvult topo_U_3 (_ bv6 3)))
(assert
 (bvult topo_U_4 (_ bv6 3)))
(assert
 (bvult topo_U_5 (_ bv6 3)))
(assert
 (bvult topo_T_0 (_ bv6 3)))
(assert
 (bvult topo_T_1 (_ bv6 3)))
(assert
 (bvult topo_T_2 (_ bv6 3)))
(assert
 (bvult topo_T_3 (_ bv6 3)))
(assert
 (bvult topo_T_4 (_ bv6 3)))
(assert
 (bvult topo_T_5 (_ bv6 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x804 (and false false)))
 (let (($x797 (or false false false or $x804)))
 (=> $x797 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false false (bvult co_2 co_5) or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false (bvult co_2 co_5) or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1713 (or false false false $x1016)))
 (=> $x1713 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x377 (or false false false $x1016 $x1147)))
 (=> $x377 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x1147 (and true false)))
 (let (($x1548 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x1548 $x1147) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1713 (or false false false $x1016)))
 (=> $x1713 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x804 (and false false)))
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1448 (or false false false $x1016 $x804)))
 (=> $x1448 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1713 (or false false false $x1016)))
 (=> $x1713 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x804 (and false false)))
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1448 (or false false false $x1016 $x804)))
 (=> $x1448 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1713 (or false false false $x1016)))
 (=> $x1713 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x377 (or false false false $x1016 $x1147)))
 (=> $x377 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x1713 (or false false false $x1016)))
 (=> $x1713 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1016 (or (and rf_1_3 false))))
 (let (($x377 (or false false false $x1016 $x1147)))
 (=> $x377 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1655 (or false false false $x766)))
 (=> $x1655 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1726 (or false false false $x766 $x1147)))
 (=> $x1726 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x1147 (and true false)))
 (let (($x720 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x720 $x1147) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1655 (or false false false $x766)))
 (=> $x1655 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1726 (or false false false $x766 $x1147)))
 (=> $x1726 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1655 (or false false false $x766)))
 (=> $x1655 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1147 (and true false)))
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1726 (or false false false $x766 $x1147)))
 (=> $x1726 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1655 (or false false false $x766)))
 (=> $x1655 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x804 (and false false)))
 (let (($x766 (or (and rf_1_4 false))))
 (=> (or false false false $x766 $x804) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x766 (or (and rf_1_4 false))))
 (let (($x1655 (or false false false $x766)))
 (=> $x1655 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x804 (and false false)))
 (let (($x766 (or (and rf_1_4 false))))
 (=> (or true false false $x766 $x804) (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false false (bvult co_5 co_2) or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false (bvult co_5 co_2) or (and true false)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1147 (and true false)))
 (let (($x1653 (or false false false or $x1147)))
 (=> $x1653 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x541 (or false false false or)))
 (=> $x541 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x804 (and false false)))
 (let (($x797 (or false false false or $x804)))
 (=> $x797 (bvult topo_T_5 topo_T_4)))))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x411 (= (_ bv1 32) final_x)))
 (let (($x869 (= co_2 (_ bv2 2))))
 (=> $x869 $x411))))
(assert
 (let (($x411 (= (_ bv1 32) final_x)))
 (let (($x1411 (= co_5 (_ bv2 2))))
 (=> $x1411 $x411))))
(assert
 (let (($x1055 (= co_1 (_ bv0 1))))
 (=> $x1055 (= (_ bv0 32) final_y))))
(assert
 (let (($x1500 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x147 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x928 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x1433 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1261 (and (distinct rf_1_4 true) true)))
 (let (($x1589 (and (distinct rf_1_3 true) true)))
 (let (($x921 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x129 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1332 (and (distinct input_b false) true)))
 (or $x1332 $x129 $x921 $x1589 $x1261 $x1433 $x928 $x147 $x1500)))))))))))
(assert
 (let (($x1500 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1447 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x302 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1433 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1261 (and (distinct rf_1_4 true) true)))
 (let (($x1589 (and (distinct rf_1_3 true) true)))
 (let (($x921 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x129 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1332 (and (distinct input_b false) true)))
 (or $x1332 $x129 $x921 $x1589 $x1261 $x1433 $x302 $x1447 $x1500)))))))))))
(assert
 (let (($x1500 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1447 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x302 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1433 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1261 (and (distinct rf_1_4 true) true)))
 (let (($x1589 (and (distinct rf_1_3 true) true)))
 (let (($x921 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x129 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x552 (and (distinct input_b true) true)))
 (or $x552 $x129 $x921 $x1589 $x1261 $x1433 $x302 $x1447 $x1500)))))))))))
(assert
 (let (($x1500 (and (distinct (_ bv0 1) co_1) true)))
(let (($x147 (and (distinct (_ bv1 2) co_5) true)))
(let (($x928 (and (distinct (_ bv2 2) co_2) true)))
(let (($x1433 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1261 (and (distinct rf_1_4 true) true)))
(let (($x1589 (and (distinct rf_1_3 true) true)))
(let (($x921 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x129 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x552 (and (distinct input_b true) true)))
(or $x552 $x129 $x921 $x1589 $x1261 $x1433 $x928 $x147 $x1500)))))))))))
(check-sat)
