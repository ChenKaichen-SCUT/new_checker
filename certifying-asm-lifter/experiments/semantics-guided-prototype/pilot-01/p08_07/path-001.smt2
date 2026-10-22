; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_8 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_8_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun rf_0_7 () Bool)
(declare-fun rf_8_7 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (= input_b false))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_8 (_ bv2 2)))
(assert
 (and (distinct co_0 co_8) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_6) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_a (_ bv1 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_2 rf_3_2 rf_6_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_8_4 (= (bvadd read_t1_b (_ bv2 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_8_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_3_5 rf_6_5))
(assert
 (let (($x378 (= (_ bv0 32) read_t1_b)))
 (=> rf_0_7 $x378)))
(assert
 (=> rf_8_7 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_7 rf_8_7))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x1465 false))))
(assert
 (let (($x1547 (bvult co_1 co_3)))
 (let (($x1066 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (not (and $x1066 $x1547)))))
(assert
 (let (($x21 (bvult co_6 co_3)))
 (let (($x2220 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x2220 $x21)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x1465 false))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (not (and $x800 false))))
(assert
 (let (($x972 (bvult co_1 co_6)))
 (let (($x1844 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x1844 $x972)))))
(assert
 (let (($x602 (bvult co_3 co_6)))
 (let (($x2600 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (not (and $x2600 $x602)))))
(assert
 (let (($x703 (bvult co_0 co_8)))
 (let (($x1868 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (not (and $x1868 $x703)))))
(assert
 (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert
 (not (and (or (and rf_0_7 false) (and rf_8_7 false)) false)))
(assert
 (bvult topo_U_0 (_ bv9 4)))
(assert
 (bvult topo_U_1 (_ bv9 4)))
(assert
 (bvult topo_U_2 (_ bv9 4)))
(assert
 (bvult topo_U_3 (_ bv9 4)))
(assert
 (bvult topo_U_4 (_ bv9 4)))
(assert
 (bvult topo_U_5 (_ bv9 4)))
(assert
 (bvult topo_U_6 (_ bv9 4)))
(assert
 (bvult topo_U_7 (_ bv9 4)))
(assert
 (bvult topo_U_8 (_ bv9 4)))
(assert
 (bvult topo_T_0 (_ bv9 4)))
(assert
 (bvult topo_T_1 (_ bv9 4)))
(assert
 (bvult topo_T_2 (_ bv9 4)))
(assert
 (bvult topo_T_3 (_ bv9 4)))
(assert
 (bvult topo_T_4 (_ bv9 4)))
(assert
 (bvult topo_T_5 (_ bv9 4)))
(assert
 (bvult topo_T_6 (_ bv9 4)))
(assert
 (bvult topo_T_7 (_ bv9 4)))
(assert
 (bvult topo_T_8 (_ bv9 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (=> (or false false (bvult co_0 co_8) or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false (bvult co_0 co_8) or (and true false)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x287 (or false false false $x1465 $x46)))
 (=> $x287 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x1066 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x1066) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x46 (and true false)))
 (let (($x1066 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x1066 $x46) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x1465 $x1744) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x11 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x11) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1744 (and false false)))
 (let (($x11 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x11 $x1744) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or true false false $x1465 $x1744) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x287 (or false false false $x1465 $x46)))
 (=> $x287 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x2220 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x2220) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x46 (and true false)))
 (let (($x2220 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x2220 $x46) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x287 (or false false false $x1465 $x46)))
 (=> $x287 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x1653 (or false false false $x1465)))
 (=> $x1653 (bvult topo_U_2 topo_U_8)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1465 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x287 (or false false false $x1465 $x46)))
 (=> $x287 (bvult topo_T_2 topo_T_8))))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1355 (or true false false or $x1744)))
 (=> $x1355 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_3 topo_U_8))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_3 topo_T_8)))))
(assert
 (let (($x2143 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_8_4 (bvult co_8 co_0)))))
 (=> (or false false false $x2143) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x46 (and true false)))
 (let (($x2143 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_8_4 (bvult co_8 co_0)))))
 (=> (or false false false $x2143 $x46) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1779 (or false false false $x1372 $x46)))
 (=> $x1779 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1593 (or false false false $x1372 $x1744)))
 (=> $x1593 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1593 (or false false false $x1372 $x1744)))
 (=> $x1593 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1593 (or false false false $x1372 $x1744)))
 (=> $x1593 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1779 (or false false false $x1372 $x46)))
 (=> $x1779 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1779 (or false false false $x1372 $x46)))
 (=> $x1779 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x396 (or false false false $x1372)))
 (=> $x396 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1372 (or (and rf_0_4 false) (and rf_8_4 false))))
 (let (($x1779 (or false false false $x1372 $x46)))
 (=> $x1779 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1742 (or (and rf_0_4 (bvult co_0 co_8)) (and rf_8_4 (bvult co_8 co_8)))))
 (=> (or false false false $x1742) (bvult topo_U_4 topo_U_8))))
(assert
 (let (($x46 (and true false)))
 (let (($x1742 (or (and rf_0_4 (bvult co_0 co_8)) (and rf_8_4 (bvult co_8 co_8)))))
 (=> (or false false false $x1742 $x46) (bvult topo_T_4 topo_T_8)))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x46 (and true false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x430 (or false false false $x800 $x46)))
 (=> $x430 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1844 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1844) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x46 (and true false)))
 (let (($x1844 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1844 $x46) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x46 (and true false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x430 (or false false false $x800 $x46)))
 (=> $x430 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2600 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x2600) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x46 (and true false)))
 (let (($x2600 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x2600 $x46) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x46 (and true false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x430 (or false false false $x800 $x46)))
 (=> $x430 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or false false false $x800 $x1744) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x192 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x192) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1744 (and false false)))
 (let (($x192 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x192 $x1744) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1035 (or true false false $x800 $x1744)))
 (=> $x1035 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x646 (or false false false $x800)))
 (=> $x646 (bvult topo_U_5 topo_U_8)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x800 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1035 (or true false false $x800 $x1744)))
 (=> $x1035 (bvult topo_T_5 topo_T_8))))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (=> (or false false (bvult co_6 co_3) or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false (bvult co_6 co_3) or (and true false)) (bvult topo_T_6 topo_T_3)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1355 (or true false false or $x1744)))
 (=> $x1355 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_6 topo_U_8))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1355 (or true false false or $x1744)))
 (=> $x1355 (bvult topo_T_6 topo_T_8)))))
(assert
 (let (($x1868 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1868) (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x46 (and true false)))
 (let (($x1868 (or (and rf_0_7 (bvult co_0 co_0)) (and rf_8_7 (bvult co_8 co_0)))))
 (=> (or false false false $x1868 $x46) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1680 (or false false false $x1865 $x46)))
 (=> $x1680 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1680 (or false false false $x1865 $x46)))
 (=> $x1680 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1680 (or false false false $x1865 $x46)))
 (=> $x1680 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x46 (and true false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1680 (or false false false $x1865 $x46)))
 (=> $x1680 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1502 (or false false false $x1865 $x1744)))
 (=> $x1502 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1502 (or false false false $x1865 $x1744)))
 (=> $x1502 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1542 (or false false false $x1865)))
 (=> $x1542 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1865 (or (and rf_0_7 false) (and rf_8_7 false))))
 (let (($x1502 (or false false false $x1865 $x1744)))
 (=> $x1502 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x1674 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x1674) (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x1744 (and false false)))
 (let (($x1674 (or (and rf_0_7 (bvult co_0 co_8)) (and rf_8_7 (bvult co_8 co_8)))))
 (=> (or true false false $x1674 $x1744) (bvult topo_T_7 topo_T_8)))))
(assert
 (=> (or false false (bvult co_8 co_0) or) (bvult topo_U_8 topo_U_0)))
(assert
 (=> (or false false (bvult co_8 co_0) or (and true false)) (bvult topo_T_8 topo_T_0)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_8 topo_U_1))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_8 topo_T_1)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_8 topo_U_2))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_8 topo_T_2)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x46 (and true false)))
 (let (($x1632 (or false false false or $x46)))
 (=> $x1632 (bvult topo_T_8 topo_T_3)))))
(assert
 (=> (or false rf_8_4 false or) (bvult topo_U_8 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_8_4)) (bvult topo_T_8 topo_T_4)))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_8 topo_U_5))))
(assert
 (let (($x1744 (and false false)))
 (let (($x447 (or false false false or $x1744)))
 (=> $x447 (bvult topo_T_8 topo_T_5)))))
(assert
 (let (($x1365 (or false false false or)))
 (=> $x1365 (bvult topo_U_8 topo_U_6))))
(assert
 (let (($x1744 (and false false)))
 (let (($x447 (or false false false or $x1744)))
 (=> $x447 (bvult topo_T_8 topo_T_6)))))
(assert
 (=> (or false rf_8_7 false or) (bvult topo_U_8 topo_U_7)))
(assert
 (=> (or false false false or (and false rf_8_7)) (bvult topo_T_8 topo_T_7)))
(assert
 (=> (or false false (bvult co_8 co_8) or) (bvult topo_U_8 topo_U_8)))
(assert
 (=> (or false false (bvult co_8 co_8) or (and false false)) (bvult topo_T_8 topo_T_8)))
(assert
 (let (($x1793 (= co_0 (_ bv1 2))))
 (=> $x1793 (= (_ bv0 32) final_x))))
(assert
 (let (($x2390 (= co_8 (_ bv1 2))))
 (=> $x2390 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (let (($x2610 (= co_1 (_ bv2 2))))
 (=> $x2610 (= (_ bv0 32) final_y))))
(assert
 (let (($x896 (= co_3 (_ bv2 2))))
 (=> $x896 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x2034 (= co_6 (_ bv2 2))))
(=> $x2034 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
