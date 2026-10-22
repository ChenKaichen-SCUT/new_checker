; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_5_3 () Bool)
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
(declare-fun rf_2_6 () Bool)
(declare-fun rf_7_6 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_7) true))
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
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_2_6 (= (_ bv1 32) read_t1_b)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_6 rf_2_6 rf_7_6))
(assert
 (let (($x1756 (bvult co_0 co_7)))
 (let (($x383 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x383 $x1756)))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (not (and $x78 false))))
(assert
 (let (($x99 (bvult co_2 co_7)))
 (let (($x1322 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (not (and $x1322 $x99)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
(assert
 (let (($x1320 (bvult co_1 co_5)))
 (let (($x33 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x33 $x1320)))))
(assert
 (not (and (or (and rf_1_4 false) (and rf_5_4 false)) false)))
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
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_1 topo_T_2)))))
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
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1709 (and false false)))
 (let (($x1348 (or false false false or $x1709)))
 (=> $x1348 (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_2 topo_U_4))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_2 topo_T_5)))))
(assert
 (=> (or false rf_2_6 false or) (bvult topo_U_2 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_2_6)) (bvult topo_T_2 topo_T_6)))
(assert
 (=> (or false false (bvult co_2 co_7) or) (bvult topo_U_2 topo_U_7)))
(assert
 (=> (or false false (bvult co_2 co_7) or (and true false)) (bvult topo_T_2 topo_T_7)))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x676 (or false false false $x323 $x1606)))
 (=> $x676 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1549 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x1549) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1549 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x1549 $x1606) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x9 (or false false false $x323 $x1709)))
 (=> $x9 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x9 (or false false false $x323 $x1709)))
 (=> $x9 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x676 (or false false false $x323 $x1606)))
 (=> $x676 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x1425 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x1425) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1425 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x1425 $x1606) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x676 (or false false false $x323 $x1606)))
 (=> $x676 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x1357 (or false false false $x323)))
 (=> $x1357 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x323 (or (and rf_1_3 false) (and rf_5_3 false))))
 (let (($x676 (or false false false $x323 $x1606)))
 (=> $x676 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x349 (or false false false $x376 $x1606)))
 (=> $x349 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x33 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x33) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1606 (and true false)))
 (let (($x33 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x33 $x1606) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x349 (or false false false $x376 $x1606)))
 (=> $x349 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x349 (or false false false $x376 $x1606)))
 (=> $x349 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (=> (or false false false $x376 $x1709) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1321 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1321) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x1709 (and false false)))
 (let (($x1321 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1321 $x1709) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x819 (or true false false $x376 $x1709)))
 (=> $x819 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x708 (or false false false $x376)))
 (=> $x708 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x376 (or (and rf_1_4 false) (and rf_5_4 false))))
 (let (($x819 (or true false false $x376 $x1709)))
 (=> $x819 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_5 topo_T_2)))))
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
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1709 (and false false)))
 (let (($x160 (or true false false or $x1709)))
 (=> $x160 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x1709 (and false false)))
 (let (($x160 (or true false false or $x1709)))
 (=> $x160 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x383 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x383) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1606 (and true false)))
 (let (($x383 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_2_6 (bvult co_2 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x383 $x1606) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1040 (or false false false $x78)))
 (=> $x1040 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x849 (or false false false $x78 $x1606)))
 (=> $x849 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1322 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (=> (or false false false $x1322) (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1322 (or (and rf_0_6 (bvult co_0 co_2)) (and rf_2_6 (bvult co_2 co_2)) (and rf_7_6 (bvult co_7 co_2)))))
 (=> (or false false false $x1322 $x1606) (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1040 (or false false false $x78)))
 (=> $x1040 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1606 (and true false)))
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x849 (or false false false $x78 $x1606)))
 (=> $x849 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1040 (or false false false $x78)))
 (=> $x1040 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1401 (or false false false $x78 $x1709)))
 (=> $x1401 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1040 (or false false false $x78)))
 (=> $x1040 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1401 (or false false false $x78 $x1709)))
 (=> $x1401 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1040 (or false false false $x78)))
 (=> $x1040 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x1709 (and false false)))
 (let (($x78 (or (and rf_0_6 false) (and rf_2_6 false) (and rf_7_6 false))))
 (let (($x1401 (or false false false $x78 $x1709)))
 (=> $x1401 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1358 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_2_6 (bvult co_2 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1358) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1709 (and false false)))
 (let (($x1358 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_2_6 (bvult co_2 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1358 $x1709) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false false (bvult co_7 co_2) or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false (bvult co_7 co_2) or (and true false)) (bvult topo_T_7 topo_T_2)))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1606 (and true false)))
 (let (($x1582 (or false false false or $x1606)))
 (=> $x1582 (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x1709 (and false false)))
 (let (($x1348 (or false false false or $x1709)))
 (=> $x1348 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x446 (or false false false or)))
 (=> $x446 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x1709 (and false false)))
 (let (($x1348 (or false false false or $x1709)))
 (=> $x1348 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x27 (= co_2 (_ bv2 2))))
 (=> $x27 (= (_ bv1 32) final_x))))
(assert
 (let (($x1397 (= co_7 (_ bv2 2))))
 (=> $x1397 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1635 (= co_5 (_ bv1 2))))
 (=> $x1635 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x932 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x1280 (and (distinct rf_2_6 true) true)))
 (let (($x1696 (and (distinct rf_0_6 false) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x1175 (and (distinct rf_5_3 true) true)))
 (let (($x1203 (and (distinct rf_1_3 false) true)))
 (let (($x1259 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1748 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1249 (and (distinct input_b false) true)))
 (or $x1249 $x1748 $x889 $x1259 $x1203 $x1175 $x1577 $x1458 $x1696 $x1280 $x1299 $x696 $x1494 $x932 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x932 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x1280 (and (distinct rf_2_6 true) true)))
 (let (($x1696 (and (distinct rf_0_6 false) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x1175 (and (distinct rf_5_3 true) true)))
 (let (($x1203 (and (distinct rf_1_3 false) true)))
 (let (($x1259 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1748 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x116 (and (distinct input_b true) true)))
 (or $x116 $x1748 $x889 $x1259 $x1203 $x1175 $x1577 $x1458 $x1696 $x1280 $x1299 $x696 $x1494 $x932 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x932 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x1280 (and (distinct rf_2_6 true) true)))
 (let (($x1696 (and (distinct rf_0_6 false) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x832 (and (distinct rf_5_3 false) true)))
 (let (($x339 (and (distinct rf_1_3 true) true)))
 (let (($x1259 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x316 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1249 (and (distinct input_b false) true)))
 (or $x1249 $x316 $x889 $x1259 $x339 $x832 $x1577 $x1458 $x1696 $x1280 $x1299 $x696 $x1494 $x932 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x932 (and (distinct (_ bv2 2) co_7) true)))
 (let (($x1494 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x1280 (and (distinct rf_2_6 true) true)))
 (let (($x1696 (and (distinct rf_0_6 false) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x832 (and (distinct rf_5_3 false) true)))
 (let (($x339 (and (distinct rf_1_3 true) true)))
 (let (($x1259 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x316 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x116 (and (distinct input_b true) true)))
 (or $x116 $x316 $x889 $x1259 $x339 $x832 $x1577 $x1458 $x1696 $x1280 $x1299 $x696 $x1494 $x932 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x473 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x854 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x90 (and (distinct rf_2_6 false) true)))
 (let (($x237 (and (distinct rf_0_6 true) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x1175 (and (distinct rf_5_3 true) true)))
 (let (($x1203 (and (distinct rf_1_3 false) true)))
 (let (($x1054 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1748 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1249 (and (distinct input_b false) true)))
 (or $x1249 $x1748 $x889 $x1054 $x1203 $x1175 $x1577 $x1458 $x237 $x90 $x1299 $x696 $x854 $x473 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x473 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x854 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x90 (and (distinct rf_2_6 false) true)))
 (let (($x237 (and (distinct rf_0_6 true) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x1175 (and (distinct rf_5_3 true) true)))
 (let (($x1203 (and (distinct rf_1_3 false) true)))
 (let (($x1054 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1748 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x116 (and (distinct input_b true) true)))
 (or $x116 $x1748 $x889 $x1054 $x1203 $x1175 $x1577 $x1458 $x237 $x90 $x1299 $x696 $x854 $x473 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x856 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x473 (and (distinct (_ bv1 2) co_7) true)))
 (let (($x854 (and (distinct (_ bv2 2) co_2) true)))
 (let (($x696 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1299 (and (distinct rf_7_6 false) true)))
 (let (($x90 (and (distinct rf_2_6 false) true)))
 (let (($x237 (and (distinct rf_0_6 true) true)))
 (let (($x1458 (and (distinct rf_5_4 false) true)))
 (let (($x1577 (and (distinct rf_1_4 true) true)))
 (let (($x832 (and (distinct rf_5_3 false) true)))
 (let (($x339 (and (distinct rf_1_3 true) true)))
 (let (($x1054 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x316 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x1249 (and (distinct input_b false) true)))
 (or $x1249 $x316 $x889 $x1054 $x339 $x832 $x1577 $x1458 $x237 $x90 $x1299 $x696 $x854 $x473 $x856 $x1506))))))))))))))))))
(assert
 (let (($x1506 (and (distinct (_ bv1 2) co_5) true)))
(let (($x856 (and (distinct (_ bv0 2) co_1) true)))
(let (($x473 (and (distinct (_ bv1 2) co_7) true)))
(let (($x854 (and (distinct (_ bv2 2) co_2) true)))
(let (($x696 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1299 (and (distinct rf_7_6 false) true)))
(let (($x90 (and (distinct rf_2_6 false) true)))
(let (($x237 (and (distinct rf_0_6 true) true)))
(let (($x1458 (and (distinct rf_5_4 false) true)))
(let (($x1577 (and (distinct rf_1_4 true) true)))
(let (($x832 (and (distinct rf_5_3 false) true)))
(let (($x339 (and (distinct rf_1_3 true) true)))
(let (($x1054 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x889 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x316 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x116 (and (distinct input_b true) true)))
(or $x116 $x316 $x889 $x1054 $x339 $x832 $x1577 $x1458 $x237 $x90 $x1299 $x696 $x854 $x473 $x856 $x1506))))))))))))))))))
(check-sat)
