; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_4_3 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_5 (= (_ bv1 32) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_2_5))
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
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x136 (and false false)))
 (let (($x302 (or false false false or $x136)))
 (=> $x302 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_2 topo_T_4)))))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x331 (or false false false $x330)))
 (=> $x331 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x147 (and true false)))
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x336 (or false false false $x330 $x147)))
 (=> $x336 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x344 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x344) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x147 (and true false)))
 (let (($x344 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x344 $x147) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x331 (or false false false $x330)))
 (=> $x331 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x136 (and false false)))
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x365 (or false false false $x330 $x136)))
 (=> $x365 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x331 (or false false false $x330)))
 (=> $x331 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x136 (and false false)))
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x365 (or false false false $x330 $x136)))
 (=> $x365 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x381 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x381) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x147 (and true false)))
 (let (($x381 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or false false false $x381 $x147) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x331 (or false false false $x330)))
 (=> $x331 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x147 (and true false)))
 (let (($x330 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x336 (or false false false $x330 $x147)))
 (=> $x336 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x147 (and true false)))
 (let (($x148 (or false false false or $x147)))
 (=> $x148 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x142 (or false false false or)))
 (=> $x142 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x136 (and false false)))
 (let (($x302 (or false false false or $x136)))
 (=> $x302 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x467 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x467) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x147 (and true false)))
 (let (($x467 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)))))
 (=> (or false false false $x467 $x147) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x485 (or false false false $x484)))
 (=> $x485 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x147 (and true false)))
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x490 (or false false false $x484 $x147)))
 (=> $x490 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x497 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x497) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x147 (and true false)))
 (let (($x497 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)))))
 (=> (or false false false $x497 $x147) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x485 (or false false false $x484)))
 (=> $x485 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x147 (and true false)))
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x490 (or false false false $x484 $x147)))
 (=> $x490 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x485 (or false false false $x484)))
 (=> $x485 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x136 (and false false)))
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x524 (or false false false $x484 $x136)))
 (=> $x524 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x485 (or false false false $x484)))
 (=> $x485 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x136 (and false false)))
 (let (($x484 (or (and rf_0_5 false) (and rf_2_5 false))))
 (let (($x524 (or false false false $x484 $x136)))
 (=> $x524 (bvult topo_T_5 topo_T_5))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x546 (= (_ bv1 32) final_x)))
 (let (($x545 (= co_2 (_ bv1 2))))
 (=> $x545 $x546))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x559 (= (_ bv1 32) final_y)))
 (let (($x558 (= co_4 (_ bv1 2))))
 (=> $x558 $x559))))
(assert
 (let (($x570 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x579 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x565 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x567 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x564 (and (distinct rf_2_5 false) true)))
 (let (($x566 (and (distinct rf_0_5 true) true)))
 (let (($x571 (and (distinct rf_4_3 true) true)))
 (let (($x574 (and (distinct rf_1_3 false) true)))
 (let (($x575 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x578 (and (distinct (_ bv1 32) read_t0_b) true)))
 (or $x578 $x575 $x574 $x571 $x566 $x564 $x567 $x565 $x579 $x570))))))))))))
(assert
 (let (($x570 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x579 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x565 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x567 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x564 (and (distinct rf_2_5 false) true)))
 (let (($x566 (and (distinct rf_0_5 true) true)))
 (let (($x785 (and (distinct rf_4_3 false) true)))
 (let (($x784 (and (distinct rf_1_3 true) true)))
 (let (($x575 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x781 (and (distinct (_ bv0 32) read_t0_b) true)))
 (or $x781 $x575 $x784 $x785 $x566 $x564 $x567 $x565 $x579 $x570))))))))))))
(assert
 (let (($x570 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x579 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x565 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x567 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x789 (and (distinct rf_2_5 true) true)))
 (let (($x793 (and (distinct rf_0_5 false) true)))
 (let (($x785 (and (distinct rf_4_3 false) true)))
 (let (($x784 (and (distinct rf_1_3 true) true)))
 (let (($x787 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x781 (and (distinct (_ bv0 32) read_t0_b) true)))
 (or $x781 $x787 $x784 $x785 $x793 $x789 $x567 $x565 $x579 $x570))))))))))))
(assert
 (let (($x570 (and (distinct (_ bv1 2) co_4) true)))
(let (($x579 (and (distinct (_ bv0 2) co_1) true)))
(let (($x565 (and (distinct (_ bv1 2) co_2) true)))
(let (($x567 (and (distinct (_ bv0 2) co_0) true)))
(let (($x789 (and (distinct rf_2_5 true) true)))
(let (($x793 (and (distinct rf_0_5 false) true)))
(let (($x571 (and (distinct rf_4_3 true) true)))
(let (($x574 (and (distinct rf_1_3 false) true)))
(let (($x787 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x578 (and (distinct (_ bv1 32) read_t0_b) true)))
(or $x578 $x787 $x574 $x571 $x793 $x789 $x567 $x565 $x579 $x570))))))))))))
(check-sat)
