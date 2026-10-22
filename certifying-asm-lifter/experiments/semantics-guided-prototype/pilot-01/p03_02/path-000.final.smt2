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
 (let (($x154 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_4 $x154)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x923 (bvult co_1 co_5)))
 (let (($x1489 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1489 $x923)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_1 topo_T_2)))))
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
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_2 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1145 (or false false false $x522)))
 (=> $x1145 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x340 (and true false)))
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1668 (or false false false $x522 $x340)))
 (=> $x1668 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x747 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x747) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x340 (and true false)))
 (let (($x747 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x747 $x340) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1145 (or false false false $x522)))
 (=> $x1145 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1586 (and false false)))
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1594 (or false false false $x522 $x1586)))
 (=> $x1594 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1145 (or false false false $x522)))
 (=> $x1145 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1586 (and false false)))
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1594 (or false false false $x522 $x1586)))
 (=> $x1594 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1145 (or false false false $x522)))
 (=> $x1145 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x340 (and true false)))
 (let (($x522 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1668 (or false false false $x522 $x340)))
 (=> $x1668 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x1716 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x1716) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x340 (and true false)))
 (let (($x1716 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x1716 $x340) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1433 (or false false false $x1549)))
 (=> $x1433 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x340 (and true false)))
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x290 (or false false false $x1549 $x340)))
 (=> $x290 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1489 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1489) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x340 (and true false)))
 (let (($x1489 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1489 $x340) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1433 (or false false false $x1549)))
 (=> $x1433 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x340 (and true false)))
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x290 (or false false false $x1549 $x340)))
 (=> $x290 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1433 (or false false false $x1549)))
 (=> $x1433 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x340 (and true false)))
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x290 (or false false false $x1549 $x340)))
 (=> $x290 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1433 (or false false false $x1549)))
 (=> $x1433 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1586 (and false false)))
 (let (($x1549 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x1549 $x1586) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1318 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1318) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1586 (and false false)))
 (let (($x1318 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1318 $x1586) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1581 (or false false false or)))
 (=> $x1581 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x340 (and true false)))
 (let (($x1749 (or false false false or $x340)))
 (=> $x1749 (bvult topo_T_5 topo_T_2)))))
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
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1306 (= co_2 (_ bv1 2))))
 (=> $x1306 (= (_ bv1 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1257 (= co_5 (_ bv1 2))))
 (=> $x1257 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x1347 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x782 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x515 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x342 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1224 (and (distinct rf_5_4 false) true)))
 (let (($x1734 (and (distinct rf_1_4 true) true)))
 (let (($x1700 (and (distinct rf_5_3 true) true)))
 (let (($x1170 (and (distinct rf_1_3 false) true)))
 (let (($x995 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1084 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1196 (and (distinct input_b false) true)))
 (or $x1196 $x1084 $x995 $x1170 $x1700 $x1734 $x1224 $x342 $x515 $x782 $x1347)))))))))))))
(assert
 (let (($x1347 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x782 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x515 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x342 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1224 (and (distinct rf_5_4 false) true)))
 (let (($x1734 (and (distinct rf_1_4 true) true)))
 (let (($x510 (and (distinct rf_5_3 false) true)))
 (let (($x327 (and (distinct rf_1_3 true) true)))
 (let (($x995 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x841 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1196 (and (distinct input_b false) true)))
 (or $x1196 $x841 $x995 $x327 $x510 $x1734 $x1224 $x342 $x515 $x782 $x1347)))))))))))))
(assert
 (let (($x1347 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x782 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x515 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x342 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1224 (and (distinct rf_5_4 false) true)))
 (let (($x1734 (and (distinct rf_1_4 true) true)))
 (let (($x510 (and (distinct rf_5_3 false) true)))
 (let (($x327 (and (distinct rf_1_3 true) true)))
 (let (($x995 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x841 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x415 (and (distinct input_b true) true)))
 (or $x415 $x841 $x995 $x327 $x510 $x1734 $x1224 $x342 $x515 $x782 $x1347)))))))))))))
(assert
 (let (($x1347 (and (distinct (_ bv1 2) co_5) true)))
(let (($x782 (and (distinct (_ bv0 2) co_1) true)))
(let (($x515 (and (distinct (_ bv1 2) co_2) true)))
(let (($x342 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1224 (and (distinct rf_5_4 false) true)))
(let (($x1734 (and (distinct rf_1_4 true) true)))
(let (($x1700 (and (distinct rf_5_3 true) true)))
(let (($x1170 (and (distinct rf_1_3 false) true)))
(let (($x995 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1084 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x415 (and (distinct input_b true) true)))
(or $x415 $x1084 $x995 $x1170 $x1700 $x1734 $x1224 $x342 $x515 $x782 $x1347)))))))))))))
(check-sat)
