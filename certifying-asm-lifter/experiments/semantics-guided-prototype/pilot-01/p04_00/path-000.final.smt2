; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
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
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (let (($x1085 (= (_ bv0 32) read_t0_b)))
 (=> rf_1_4 $x1085)))
(assert
 ((_ pbeq 1 1) rf_1_4))
(assert
 (let (($x1327 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x1327)))
(assert
 ((_ pbeq 1 1) rf_1_5))
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
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x471 (and false false)))
 (let (($x819 (or false false false or $x471)))
 (=> $x819 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_2 topo_U_4))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x471 (and false false)))
 (let (($x819 (or false false false or $x471)))
 (=> $x819 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x471 (and false false)))
 (let (($x819 (or false false false or $x471)))
 (=> $x819 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x471 (and false false)))
 (let (($x819 (or false false false or $x471)))
 (=> $x819 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1336 (or false false false or)))
 (=> $x1336 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x474 (and true false)))
 (let (($x257 (or false false false or $x474)))
 (=> $x257 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x1182 (or false false false $x1571)))
 (=> $x1182 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x852 (or false false false $x1571 $x474)))
 (=> $x852 (bvult topo_T_4 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_4 (bvult co_1 co_1)))) (bvult topo_U_4 topo_U_1)))
(assert
 (let (($x474 (and true false)))
 (let (($x1392 (or (and rf_1_4 (bvult co_1 co_1)))))
 (=> (or false false false $x1392 $x474) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x1182 (or false false false $x1571)))
 (=> $x1182 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x471 (and false false)))
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x116 (or false false false $x1571 $x471)))
 (=> $x116 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x1182 (or false false false $x1571)))
 (=> $x1182 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x471 (and false false)))
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x116 (or false false false $x1571 $x471)))
 (=> $x116 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x1182 (or false false false $x1571)))
 (=> $x1182 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x471 (and false false)))
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x116 (or false false false $x1571 $x471)))
 (=> $x116 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x1182 (or false false false $x1571)))
 (=> $x1182 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1571 (or (and rf_1_4 false))))
 (let (($x852 (or false false false $x1571 $x474)))
 (=> $x852 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1236 (or false false false $x1618)))
 (=> $x1236 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1452 (or false false false $x1618 $x474)))
 (=> $x1452 (bvult topo_T_5 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_5 (bvult co_1 co_1)))) (bvult topo_U_5 topo_U_1)))
(assert
 (let (($x474 (and true false)))
 (let (($x291 (or (and rf_1_5 (bvult co_1 co_1)))))
 (=> (or false false false $x291 $x474) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1236 (or false false false $x1618)))
 (=> $x1236 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1452 (or false false false $x1618 $x474)))
 (=> $x1452 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1236 (or false false false $x1618)))
 (=> $x1236 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1452 (or false false false $x1618 $x474)))
 (=> $x1452 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1236 (or false false false $x1618)))
 (=> $x1236 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x474 (and true false)))
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1452 (or false false false $x1618 $x474)))
 (=> $x1452 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1618 (or (and rf_1_5 false))))
 (let (($x1236 (or false false false $x1618)))
 (=> $x1236 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x471 (and false false)))
 (let (($x1618 (or (and rf_1_5 false))))
 (=> (or false false false $x1618 $x471) (bvult topo_T_5 topo_T_5)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x458 (= co_2 (_ bv1 2))))
 (=> $x458 (= (_ bv1 32) final_x))))
(assert
 (let (($x1347 (= (_ bv0 32) final_y)))
 (let (($x525 (= co_1 (_ bv0 1))))
 (=> $x525 $x1347))))
(assert
 (let (($x1189 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x561 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x1276 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x755 (and (distinct rf_1_5 true) true)))
 (let (($x1267 (and (distinct rf_1_4 true) true)))
 (let (($x48 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1527 (and (distinct (_ bv0 32) read_t0_b) true)))
 (or (and (distinct input_b false) true) $x1527 $x48 $x1267 $x755 $x1276 $x561 $x1189)))))))))
(assert
 (let (($x1189 (and (distinct (_ bv0 1) co_1) true)))
(let (($x561 (and (distinct (_ bv1 2) co_2) true)))
(let (($x1276 (and (distinct (_ bv0 2) co_0) true)))
(let (($x755 (and (distinct rf_1_5 true) true)))
(let (($x1267 (and (distinct rf_1_4 true) true)))
(let (($x48 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1527 (and (distinct (_ bv0 32) read_t0_b) true)))
(or (and (distinct input_b true) true) $x1527 $x48 $x1267 $x755 $x1276 $x561 $x1189)))))))))
(check-sat)
