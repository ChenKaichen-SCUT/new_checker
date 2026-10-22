; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
(declare-fun rf_3_7 () Bool)
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
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_1 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_3_7))
(assert
 (let (($x828 (bvult co_0 co_3)))
 (let (($x754 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x754 $x828)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
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
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x754 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x754) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x887 (and true false)))
 (let (($x754 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x754 $x887) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x887 (and true false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1676 (or false false false $x19 $x887)))
 (=> $x1676 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x956 (and false false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x19 $x956) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x997 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x997) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x956 (and false false)))
 (let (($x997 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x997 $x956) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x956 (and false false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or true false false $x19 $x956) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x887 (and true false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1676 (or false false false $x19 $x887)))
 (=> $x1676 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x887 (and true false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1676 (or false false false $x19 $x887)))
 (=> $x1676 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1595 (or false false false $x19)))
 (=> $x1595 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x887 (and true false)))
 (let (($x19 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1676 (or false false false $x19 $x887)))
 (=> $x1676 (bvult topo_T_2 topo_T_7))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x887 (and true false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1464 (or false false false $x675 $x887)))
 (=> $x1464 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x117 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x117) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x887 (and true false)))
 (let (($x117 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x117 $x887) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x956 (and false false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1563 (or false false false $x675 $x956)))
 (=> $x1563 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x956 (and false false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1563 (or false false false $x675 $x956)))
 (=> $x1563 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x956 (and false false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1563 (or false false false $x675 $x956)))
 (=> $x1563 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x318 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x318) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x887 (and true false)))
 (let (($x318 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or false false false $x318 $x887) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x887 (and true false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1464 (or false false false $x675 $x887)))
 (=> $x1464 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x230 (or false false false $x675)))
 (=> $x230 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x887 (and true false)))
 (let (($x675 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x1464 (or false false false $x675 $x887)))
 (=> $x1464 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x956 (and false false)))
 (let (($x608 (or false false false or $x956)))
 (=> $x608 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_5 topo_U_7))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_5 topo_T_7)))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x887 (and true false)))
 (let (($x1814 (or false false false or $x887)))
 (=> $x1814 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x956 (and false false)))
 (let (($x608 (or false false false or $x956)))
 (=> $x608 (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_6))))
(assert
 (let (($x956 (and false false)))
 (let (($x608 (or false false false or $x956)))
 (=> $x608 (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1450 (or false false false or)))
 (=> $x1450 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x956 (and false false)))
 (let (($x608 (or false false false or $x956)))
 (=> $x608 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1380 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x1380) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x887 (and true false)))
 (let (($x1380 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_3_7 (bvult co_3 co_0)))))
 (=> (or false false false $x1380 $x887) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x887 (and true false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x306 (or false false false $x161 $x887)))
 (=> $x306 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x887 (and true false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x306 (or false false false $x161 $x887)))
 (=> $x306 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1510 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x1510) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x887 (and true false)))
 (let (($x1510 (or (and rf_0_7 (bvult co_0 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x1510 $x887) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x887 (and true false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x306 (or false false false $x161 $x887)))
 (=> $x306 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x956 (and false false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1055 (or false false false $x161 $x956)))
 (=> $x1055 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x956 (and false false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1055 (or false false false $x161 $x956)))
 (=> $x1055 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1177 (or false false false $x161)))
 (=> $x1177 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x956 (and false false)))
 (let (($x161 (or (and rf_0_7 false) (and rf_3_7 false))))
 (let (($x1055 (or false false false $x161 $x956)))
 (=> $x1055 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x224 (= co_0 (_ bv1 2))))
 (=> $x224 (= (_ bv0 32) final_x))))
(assert
 (let (($x1240 (= co_3 (_ bv1 2))))
 (=> $x1240 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x627 (= co_1 (_ bv1 2))))
 (=> $x627 (= (_ bv0 32) final_y))))
(assert
 (let (($x54 (= co_5 (_ bv1 2))))
(=> $x54 (= (_ bv1 32) final_y))))
(check-sat)
