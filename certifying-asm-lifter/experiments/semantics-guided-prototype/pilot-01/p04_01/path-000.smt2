; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
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
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
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
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1218 (or false false false or $x1574)))
 (=> $x1218 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1218 (or false false false or $x1574)))
 (=> $x1218 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1218 (or false false false or $x1574)))
 (=> $x1218 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1218 (or false false false or $x1574)))
 (=> $x1218 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1421 (or false false false $x1696)))
 (=> $x1421 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x873 (and true false)))
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x1696 $x873) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x286 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x286) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x873 (and true false)))
 (let (($x286 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x286 $x873) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1421 (or false false false $x1696)))
 (=> $x1421 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x875 (or false false false $x1696 $x1574)))
 (=> $x875 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1421 (or false false false $x1696)))
 (=> $x1421 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x875 (or false false false $x1696 $x1574)))
 (=> $x875 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1421 (or false false false $x1696)))
 (=> $x1421 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1574 (and false false)))
 (let (($x1696 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x875 (or false false false $x1696 $x1574)))
 (=> $x875 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1514 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1514) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x873 (and true false)))
 (let (($x1514 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x1514 $x873) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x575 (or false false false or)))
 (=> $x575 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x873 (and true false)))
 (let (($x198 (or false false false or $x873)))
 (=> $x198 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x796 (= co_0 (_ bv1 2))))
 (=> $x796 (= (_ bv0 32) final_x))))
(assert
 (let (($x1493 (= co_2 (_ bv1 2))))
 (=> $x1493 (= (_ bv1 32) final_x))))
(assert
 (let (($x971 (= co_1 (_ bv1 2))))
 (=> $x971 (= (_ bv0 32) final_y))))
(assert
 (let (($x1179 (= co_5 (_ bv1 2))))
(=> $x1179 (= (_ bv1 32) final_y))))
(check-sat)
