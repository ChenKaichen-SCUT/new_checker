; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
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
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x16 (bvult co_1 co_4)))
 (let (($x17 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x17 $x16)))))
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
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x259 (and true false)))
 (let (($x61 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x61 $x259) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x144 (or false false false $x143)))
 (=> $x144 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x259 (and true false)))
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x51 (or false false false $x143 $x259)))
 (=> $x51 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x144 (or false false false $x143)))
 (=> $x144 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x197 (and false false)))
 (let (($x143 (or (and rf_0_2 false))))
 (=> (or false false false $x143 $x197) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x144 (or false false false $x143)))
 (=> $x144 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x259 (and true false)))
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x51 (or false false false $x143 $x259)))
 (=> $x51 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x144 (or false false false $x143)))
 (=> $x144 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x259 (and true false)))
 (let (($x143 (or (and rf_0_2 false))))
 (let (($x51 (or false false false $x143 $x259)))
 (=> $x51 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x228 (or false false false $x73)))
 (=> $x228 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x259 (and true false)))
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x208 (or false false false $x73 $x259)))
 (=> $x208 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x17 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x17) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x259 (and true false)))
 (let (($x17 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x17 $x259) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x228 (or false false false $x73)))
 (=> $x228 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x259 (and true false)))
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x208 (or false false false $x73 $x259)))
 (=> $x208 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x228 (or false false false $x73)))
 (=> $x228 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x197 (and false false)))
 (let (($x73 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x73 $x197) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x348 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x348) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x197 (and false false)))
 (let (($x348 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x348 $x197) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x225 (or false false false or)))
 (=> $x225 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x259 (and true false)))
 (let (($x229 (or false false false or $x259)))
 (=> $x229 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x402 (= (_ bv0 32) final_x)))
 (let (($x100 (= co_0 (_ bv0 1))))
 (=> $x100 $x402))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x410 (= co_4 (_ bv1 2))))
 (=> $x410 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x428 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x425 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x420 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x418 (and (distinct rf_4_3 false) true)))
 (let (($x419 (and (distinct rf_1_3 true) true)))
 (let (($x426 (and (distinct rf_0_2 true) true)))
 (let (($x421 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x417 (and (distinct (_ bv0 32) read_t0_a) true)))
 (or (and (distinct input_b false) true) $x417 $x421 $x426 $x419 $x418 $x420 $x425 $x428))))))))))
(assert
 (let (($x428 (and (distinct (_ bv1 2) co_4) true)))
(let (($x425 (and (distinct (_ bv0 2) co_1) true)))
(let (($x420 (and (distinct (_ bv0 1) co_0) true)))
(let (($x418 (and (distinct rf_4_3 false) true)))
(let (($x419 (and (distinct rf_1_3 true) true)))
(let (($x426 (and (distinct rf_0_2 true) true)))
(let (($x421 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x417 (and (distinct (_ bv0 32) read_t0_a) true)))
(or (and (distinct input_b true) true) $x417 $x421 $x426 $x419 $x418 $x420 $x425 $x428))))))))))
(check-sat)
