; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_2_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
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
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_7 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_2_7))
(assert
 (bvult topo_U_0 (_ bv8 4)))
(assert
 (bvult topo_U_1 (_ bv8 4)))
(assert
 (bvult topo_U_2 (_ bv8 4)))
(assert
 (bvult topo_U_3 (_ bv8 4)))
(assert
 (bvult topo_U_4 (_ bv8 4)))
(assert
 (bvult topo_U_5 (_ bv8 4)))
(assert
 (bvult topo_U_6 (_ bv8 4)))
(assert
 (bvult topo_U_7 (_ bv8 4)))
(assert
 (bvult topo_T_0 (_ bv8 4)))
(assert
 (bvult topo_T_1 (_ bv8 4)))
(assert
 (bvult topo_T_2 (_ bv8 4)))
(assert
 (bvult topo_T_3 (_ bv8 4)))
(assert
 (bvult topo_T_4 (_ bv8 4)))
(assert
 (bvult topo_T_5 (_ bv8 4)))
(assert
 (bvult topo_T_6 (_ bv8 4)))
(assert
 (bvult topo_T_7 (_ bv8 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x331 (and false false)))
 (let (($x795 (or false true false or $x331)))
 (=> $x795 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_2 topo_T_6)))))
(assert
 (=> (or false rf_2_7 false or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_2_7)) (bvult topo_T_2 topo_T_7)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_3))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x383 (and true false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x542 (or false false false $x585 $x383)))
 (=> $x542 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x423 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x423) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x383 (and true false)))
 (let (($x423 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x423 $x383) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x331 (and false false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x161 (or false false false $x585 $x331)))
 (=> $x161 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x331 (and false false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x161 (or false false false $x585 $x331)))
 (=> $x161 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x331 (and false false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x161 (or false false false $x585 $x331)))
 (=> $x161 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x400 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x400) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x383 (and true false)))
 (let (($x400 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x400 $x383) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x383 (and true false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x542 (or false false false $x585 $x383)))
 (=> $x542 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x590 (or false false false $x585)))
 (=> $x590 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x383 (and true false)))
 (let (($x585 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x542 (or false false false $x585 $x383)))
 (=> $x542 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x331 (and false false)))
 (let (($x795 (or false true false or $x331)))
 (=> $x795 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x383 (and true false)))
 (let (($x384 (or false false false or $x383)))
 (=> $x384 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_6))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x381 (or false false false or)))
 (=> $x381 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x331 (and false false)))
 (let (($x580 (or false false false or $x331)))
 (=> $x580 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x677 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x677) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x383 (and true false)))
 (let (($x677 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_2_7 (bvult co_2 co_0)))))
 (=> (or false false false $x677 $x383) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x383 (and true false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x696 (or false false false $x693 $x383)))
 (=> $x696 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x708 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x708) (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x383 (and true false)))
 (let (($x708 (or (and rf_0_7 (bvult co_0 co_2)) (and rf_2_7 (bvult co_2 co_2)))))
 (=> (or false false false $x708 $x383) (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x383 (and true false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x696 (or false false false $x693 $x383)))
 (=> $x696 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x383 (and true false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x696 (or false false false $x693 $x383)))
 (=> $x696 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x331 (and false false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x742 (or false false false $x693 $x331)))
 (=> $x742 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x331 (and false false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x742 (or false false false $x693 $x331)))
 (=> $x742 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x695 (or false false false $x693)))
 (=> $x695 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x331 (and false false)))
 (let (($x693 (or (and rf_0_7 false) (and rf_2_7 false))))
 (let (($x742 (or false false false $x693 $x331)))
 (=> $x742 (bvult topo_T_7 topo_T_7))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x768 (= (_ bv1 32) final_x)))
 (let (($x771 (= co_2 (_ bv1 2))))
 (=> $x771 $x768))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x800 (= (_ bv1 32) final_y)))
 (let (($x794 (= co_5 (_ bv1 2))))
 (=> $x794 $x800))))
(assert
 (let (($x830 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x835 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x807 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x809 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x808 (and (distinct rf_5_4 true) true)))
 (let (($x816 (and (distinct rf_1_4 false) true)))
 (let (($x820 (and (distinct (_ bv1 32) read_t0_b) true)))
 (or $x820 (and (distinct (_ bv0 32) read_t1_b) true) $x816 $x808 (and (distinct rf_0_7 true) true) (and (distinct rf_2_7 false) true) $x809 $x807 $x835 $x830)))))))))
(assert
 (let (($x830 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x835 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x807 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x809 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1053 (and (distinct rf_2_7 true) true)))
 (let (($x1050 (and (distinct rf_0_7 false) true)))
 (let (($x808 (and (distinct rf_5_4 true) true)))
 (let (($x816 (and (distinct rf_1_4 false) true)))
 (let (($x812 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x820 (and (distinct (_ bv1 32) read_t0_b) true)))
 (or $x820 $x812 $x816 $x808 $x1050 $x1053 $x809 $x807 $x835 $x830))))))))))))
(assert
 (let (($x830 (and (distinct (_ bv1 2) co_5) true)))
(let (($x835 (and (distinct (_ bv0 2) co_1) true)))
(let (($x807 (and (distinct (_ bv1 2) co_2) true)))
(let (($x809 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1053 (and (distinct rf_2_7 true) true)))
(let (($x1050 (and (distinct rf_0_7 false) true)))
(let (($x812 (and (distinct (_ bv1 32) read_t1_b) true)))
(or (and (distinct (_ bv0 32) read_t0_b) true) $x812 (and (distinct rf_1_4 true) true) (and (distinct rf_5_4 false) true) $x1050 $x1053 $x809 $x807 $x835 $x830)))))))))
(check-sat)
