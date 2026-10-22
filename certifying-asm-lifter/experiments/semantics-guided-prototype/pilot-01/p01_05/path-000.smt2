; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_4) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 ((_ pbeq 1 1) rf_1_3))
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
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_2 topo_T_3)))))
(assert
 (=> (or false false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false (bvult co_2 co_4) or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x851 (or false false false $x918)))
 (=> $x851 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x247 (and true false)))
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x1070 (or false false false $x918 $x247)))
 (=> $x1070 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x247 (and true false)))
 (let (($x513 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x513 $x247) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x851 (or false false false $x918)))
 (=> $x851 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x247 (and true false)))
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x1070 (or false false false $x918 $x247)))
 (=> $x1070 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x851 (or false false false $x918)))
 (=> $x851 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x169 (and false false)))
 (let (($x918 (or (and rf_1_3 false))))
 (=> (or false false false $x918 $x169) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x918 (or (and rf_1_3 false))))
 (let (($x851 (or false false false $x918)))
 (=> $x851 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x169 (and false false)))
 (let (($x918 (or (and rf_1_3 false))))
 (=> (or true false false $x918 $x169) (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x247 (and true false)))
 (let (($x823 (or false false false or $x247)))
 (=> $x823 (bvult topo_T_4 topo_T_1)))))
(assert
 (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false (bvult co_4 co_2) or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert
 (let (($x634 (or false false false or)))
 (=> $x634 (bvult topo_U_4 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x1026 (= co_0 (_ bv2 2))))
 (=> $x1026 (= (_ bv0 32) final_x))))
(assert
 (let (($x219 (= (_ bv1 32) final_x)))
 (let (($x1109 (= co_2 (_ bv2 2))))
 (=> $x1109 $x219))))
(assert
 (let (($x219 (= (_ bv1 32) final_x)))
 (let (($x988 (= co_4 (_ bv2 2))))
 (=> $x988 $x219))))
(assert
 (let (($x822 (= co_1 (_ bv0 1))))
(=> $x822 (= (_ bv0 32) final_y))))
(check-sat)
