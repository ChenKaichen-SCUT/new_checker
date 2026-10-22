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
(declare-fun rf_0_6 () Bool)
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
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_6))
(assert
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (not (and $x2114 false))))
(assert
 (let (($x2611 (bvult co_1 co_3)))
 (let (($x197 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (not (and $x197 $x2611)))))
(assert
 (let (($x2387 (bvult co_5 co_3)))
 (let (($x2273 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (not (and $x2273 $x2387)))))
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
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x879 (or false false false $x2114)))
 (=> $x879 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x1747 (or false false false $x2114 $x274)))
 (=> $x1747 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x197 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x197) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x274 (and true false)))
 (let (($x197 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_5_2 (bvult co_5 co_1)))))
 (=> (or false false false $x197 $x274) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x879 (or false false false $x2114)))
 (=> $x879 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or false false false $x2114 $x1573) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1195 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x1195) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1573 (and false false)))
 (let (($x1195 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_5_2 (bvult co_5 co_3)))))
 (=> (or true false false $x1195 $x1573) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x879 (or false false false $x2114)))
 (=> $x879 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (=> (or true false false $x2114 $x1573) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x2273 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x2273) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x274 (and true false)))
 (let (($x2273 (or (and rf_1_2 (bvult co_1 co_5)) (and rf_3_2 (bvult co_3 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x2273 $x274) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x879 (or false false false $x2114)))
 (=> $x879 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2114 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_5_2 false))))
 (let (($x1747 (or false false false $x2114 $x274)))
 (=> $x1747 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x274 (and true false)))
 (let (($x351 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x351 $x274) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2040 (or false false false $x2394 $x274)))
 (=> $x2040 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x143 (or false false false $x2394 $x1573)))
 (=> $x143 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x143 (or false false false $x2394 $x1573)))
 (=> $x143 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x143 (or false false false $x2394 $x1573)))
 (=> $x143 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2040 (or false false false $x2394 $x274)))
 (=> $x2040 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2141 (or false false false $x2394)))
 (=> $x2141 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2394 (or (and rf_0_4 false))))
 (let (($x2040 (or false false false $x2394 $x274)))
 (=> $x2040 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_5 topo_T_0)))))
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
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x274 (and true false)))
 (let (($x2575 (or false false false or $x274)))
 (=> $x2575 (bvult topo_T_5 topo_T_4)))))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x629 (or false false false or)))
 (=> $x629 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (=> (or false false false (or (and rf_0_6 (bvult co_0 co_0)))) (bvult topo_U_6 topo_U_0)))
(assert
 (let (($x274 (and true false)))
 (let (($x1200 (or (and rf_0_6 (bvult co_0 co_0)))))
 (=> (or false false false $x1200 $x274) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2467 (or false false false $x2664 $x274)))
 (=> $x2467 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2467 (or false false false $x2664 $x274)))
 (=> $x2467 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2467 (or false false false $x2664 $x274)))
 (=> $x2467 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x274 (and true false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2467 (or false false false $x2664 $x274)))
 (=> $x2467 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x1019 (or false false false $x2664 $x1573)))
 (=> $x1019 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x2334 (or false false false $x2664)))
 (=> $x2334 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1573 (and false false)))
 (let (($x2664 (or (and rf_0_6 false))))
 (let (($x1019 (or false false false $x2664 $x1573)))
 (=> $x1019 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x815 (= co_0 (_ bv0 1))))
 (=> $x815 (= (_ bv0 32) final_x))))
(assert
 (let (($x2396 (= co_1 (_ bv2 2))))
 (=> $x2396 (= (_ bv0 32) final_y))))
(assert
 (let (($x1561 (= co_3 (_ bv2 2))))
 (=> $x1561 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x2379 (= co_5 (_ bv2 2))))
(=> $x2379 (= (_ bv1 32) final_y))))
(check-sat)
