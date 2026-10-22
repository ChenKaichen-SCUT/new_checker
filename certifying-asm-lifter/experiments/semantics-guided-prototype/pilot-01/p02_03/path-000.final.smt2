; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
 (let (($x729 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x729)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_3_5))
(assert
 (let (($x517 (bvult co_0 co_3)))
 (let (($x787 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x787 $x517)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
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
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x787 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x787) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x325 (and true false)))
 (let (($x787 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x787 $x325) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1080 (or false false false $x562)))
 (=> $x1080 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x325 (and true false)))
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x992 (or false false false $x562 $x325)))
 (=> $x992 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1080 (or false false false $x562)))
 (=> $x1080 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x83 (and false false)))
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x562 $x83) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x786 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x786) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x83 (and false false)))
 (let (($x786 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x786 $x83) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1080 (or false false false $x562)))
 (=> $x1080 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x325 (and true false)))
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x992 (or false false false $x562 $x325)))
 (=> $x992 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1080 (or false false false $x562)))
 (=> $x1080 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x325 (and true false)))
 (let (($x562 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x992 (or false false false $x562 $x325)))
 (=> $x992 (bvult topo_T_2 topo_T_5))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x325 (and true false)))
 (let (($x963 (or false false false or $x325)))
 (=> $x963 (bvult topo_T_4 topo_T_3)))))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x705 (or false false false or)))
 (=> $x705 (bvult topo_U_4 topo_U_5))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x935 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)))))
 (=> (or false false false $x935) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x325 (and true false)))
 (let (($x935 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_3_5 (bvult co_3 co_0)))))
 (=> (or false false false $x935 $x325) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x529 (or false false false $x282)))
 (=> $x529 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x325 (and true false)))
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x378 (or false false false $x282 $x325)))
 (=> $x378 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x529 (or false false false $x282)))
 (=> $x529 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x325 (and true false)))
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x378 (or false false false $x282 $x325)))
 (=> $x378 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x578 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x578) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x325 (and true false)))
 (let (($x578 (or (and rf_0_5 (bvult co_0 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x578 $x325) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x529 (or false false false $x282)))
 (=> $x529 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x83 (and false false)))
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x1025 (or false false false $x282 $x83)))
 (=> $x1025 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x529 (or false false false $x282)))
 (=> $x529 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x83 (and false false)))
 (let (($x282 (or (and rf_0_5 false) (and rf_3_5 false))))
 (let (($x1025 (or false false false $x282 $x83)))
 (=> $x1025 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x704 (= co_3 (_ bv1 2))))
 (=> $x704 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x30 (= co_4 (_ bv1 2))))
 (=> $x30 (= (_ bv1 32) final_y))))
(assert
 (let (($x104 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x539 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1117 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x212 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x706 (and (distinct rf_3_5 false) true)))
 (let (($x621 (and (distinct rf_0_5 true) true)))
 (let (($x952 (and (distinct rf_3_2 false) true)))
 (let (($x1031 (and (distinct rf_0_2 true) true)))
 (let (($x534 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x567 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x428 (and (distinct input_b false) true)))
 (or $x428 $x567 $x534 $x1031 $x952 $x621 $x706 $x212 $x1117 $x539 $x104)))))))))))))
(assert
 (let (($x104 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x539 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1117 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x212 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x217 (and (distinct rf_3_5 true) true)))
 (let (($x5 (and (distinct rf_0_5 false) true)))
 (let (($x952 (and (distinct rf_3_2 false) true)))
 (let (($x1031 (and (distinct rf_0_2 true) true)))
 (let (($x948 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x567 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x428 (and (distinct input_b false) true)))
 (or $x428 $x567 $x948 $x1031 $x952 $x5 $x217 $x212 $x1117 $x539 $x104)))))))))))))
(assert
 (let (($x104 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x539 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1117 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x212 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x217 (and (distinct rf_3_5 true) true)))
 (let (($x5 (and (distinct rf_0_5 false) true)))
 (let (($x952 (and (distinct rf_3_2 false) true)))
 (let (($x1031 (and (distinct rf_0_2 true) true)))
 (let (($x948 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x567 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x70 (and (distinct input_b true) true)))
 (or $x70 $x567 $x948 $x1031 $x952 $x5 $x217 $x212 $x1117 $x539 $x104)))))))))))))
(assert
 (let (($x104 (and (distinct (_ bv1 2) co_4) true)))
(let (($x539 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1117 (and (distinct (_ bv1 2) co_3) true)))
(let (($x212 (and (distinct (_ bv0 2) co_0) true)))
(let (($x706 (and (distinct rf_3_5 false) true)))
(let (($x621 (and (distinct rf_0_5 true) true)))
(let (($x952 (and (distinct rf_3_2 false) true)))
(let (($x1031 (and (distinct rf_0_2 true) true)))
(let (($x534 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x567 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x70 (and (distinct input_b true) true)))
(or $x70 $x567 $x534 $x1031 $x952 $x621 $x706 $x212 $x1117 $x539 $x104)))))))))))))
(check-sat)
