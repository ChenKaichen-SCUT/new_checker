; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
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
 (bvult co_4 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_4) true))
(assert
 (let (($x99 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x99)))
(assert
 ((_ pbeq 1 1) rf_0_2))
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
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x1790 (and true false)))
 (let (($x1229 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x1229 $x1790) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x715 (or false false false $x425)))
 (=> $x715 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1790 (and true false)))
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x1225 (or false false false $x425 $x1790)))
 (=> $x1225 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x715 (or false false false $x425)))
 (=> $x715 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1658 (and false false)))
 (let (($x425 (or (and rf_0_2 false))))
 (=> (or false false false $x425 $x1658) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x715 (or false false false $x425)))
 (=> $x715 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x1658 (and false false)))
 (let (($x425 (or (and rf_0_2 false))))
 (=> (or true false false $x425 $x1658) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x715 (or false false false $x425)))
 (=> $x715 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1790 (and true false)))
 (let (($x425 (or (and rf_0_2 false))))
 (let (($x1225 (or false false false $x425 $x1790)))
 (=> $x1225 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_3 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false false (bvult co_3 co_4) or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false (bvult co_3 co_4) or (and true false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x1641 (or false false false or)))
 (=> $x1641 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x1790 (and true false)))
 (let (($x173 (or false false false or $x1790)))
 (=> $x173 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false false (bvult co_4 co_3) or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false (bvult co_4 co_3) or (and true false)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x359 (= (_ bv0 32) final_x)))
 (let (($x559 (= co_0 (_ bv0 1))))
 (=> $x559 $x359))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x202 (= (_ bv1 32) final_y)))
 (let (($x727 (= co_3 (_ bv2 2))))
 (=> $x727 $x202))))
(assert
 (let (($x202 (= (_ bv1 32) final_y)))
 (let (($x1752 (= co_4 (_ bv2 2))))
 (=> $x1752 $x202))))
(assert
 (let (($x452 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x808 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x921 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x32 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1559 (and (distinct rf_0_2 true) true)))
 (let (($x1583 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1418 (and (distinct input_b false) true)))
 (or $x1418 $x1583 $x1559 $x32 $x921 $x808 $x452)))))))))
(assert
 (let (($x205 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x1812 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x921 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x32 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1559 (and (distinct rf_0_2 true) true)))
 (let (($x1583 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1418 (and (distinct input_b false) true)))
 (or $x1418 $x1583 $x1559 $x32 $x921 $x1812 $x205)))))))))
(assert
 (let (($x205 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x1812 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x921 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x32 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1559 (and (distinct rf_0_2 true) true)))
 (let (($x1583 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x911 (and (distinct input_b true) true)))
 (or $x911 $x1583 $x1559 $x32 $x921 $x1812 $x205)))))))))
(assert
 (let (($x452 (and (distinct (_ bv1 2) co_4) true)))
(let (($x808 (and (distinct (_ bv2 2) co_3) true)))
(let (($x921 (and (distinct (_ bv0 2) co_1) true)))
(let (($x32 (and (distinct (_ bv0 1) co_0) true)))
(let (($x1559 (and (distinct rf_0_2 true) true)))
(let (($x1583 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x911 (and (distinct input_b true) true)))
(or $x911 $x1583 $x1559 $x32 $x921 $x808 $x452)))))))))
(check-sat)
