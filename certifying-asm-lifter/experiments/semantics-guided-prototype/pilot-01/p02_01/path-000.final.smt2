; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
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
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (let (($x579 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x579)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (let (($x398 (bvult co_0 co_3)))
 (let (($x363 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x363 $x398)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (bvult topo_U_0 (_ bv5 3)))
(assert
 (bvult topo_U_1 (_ bv5 3)))
(assert
 (bvult topo_U_2 (_ bv5 3)))
(assert
 (bvult topo_U_3 (_ bv5 3)))
(assert
 (bvult topo_U_4 (_ bv5 3)))
(assert
 (bvult topo_T_0 (_ bv5 3)))
(assert
 (bvult topo_T_1 (_ bv5 3)))
(assert
 (bvult topo_T_2 (_ bv5 3)))
(assert
 (bvult topo_T_3 (_ bv5 3)))
(assert
 (bvult topo_T_4 (_ bv5 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x363 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x363) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x835 (and true false)))
 (let (($x363 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x363 $x835) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x247 (or false false false $x737)))
 (=> $x247 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x835 (and true false)))
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x79 (or false false false $x737 $x835)))
 (=> $x79 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x247 (or false false false $x737)))
 (=> $x247 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x418 (and false false)))
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x737 $x418) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1140 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1140) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x418 (and false false)))
 (let (($x1140 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1140 $x418) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x247 (or false false false $x737)))
 (=> $x247 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x835 (and true false)))
 (let (($x737 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x79 (or false false false $x737 $x835)))
 (=> $x79 (bvult topo_T_2 topo_T_4))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x197 (or false false false or)))
 (=> $x197 (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x835 (and true false)))
 (let (($x375 (or false false false or $x835)))
 (=> $x375 (bvult topo_T_4 topo_T_3)))))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x786 (= co_3 (_ bv1 2))))
 (=> $x786 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x205 (= (_ bv1 32) final_y)))
 (let (($x193 (= co_4 (_ bv1 2))))
 (=> $x193 $x205))))
(assert
 (let (($x456 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x1116 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x796 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x141 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x84 (and (distinct rf_3_2 false) true)))
 (let (($x107 (and (distinct rf_0_2 true) true)))
 (let (($x1022 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x1022 $x107 $x84 $x141 $x796 $x1116 $x456)))))))))
(assert
 (let (($x456 (and (distinct (_ bv1 2) co_4) true)))
(let (($x1116 (and (distinct (_ bv0 2) co_1) true)))
(let (($x796 (and (distinct (_ bv1 2) co_3) true)))
(let (($x141 (and (distinct (_ bv0 2) co_0) true)))
(let (($x84 (and (distinct rf_3_2 false) true)))
(let (($x107 (and (distinct rf_0_2 true) true)))
(let (($x1022 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x1022 $x107 $x84 $x141 $x796 $x1116 $x456)))))))))
(check-sat)
