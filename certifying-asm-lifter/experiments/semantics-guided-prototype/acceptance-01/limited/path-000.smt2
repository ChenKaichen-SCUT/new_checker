; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_a () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_b () (_ BitVec 32))
(declare-fun rf_4_1 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
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
 (=> rf_0_1 (= (_ bv0 32) read_a)))
(assert
 (=> rf_2_1 (= (bvadd read_a (_ bv1 32)) read_a)))
(assert
 (=> rf_4_1 (= (bvadd read_b (_ bv1 32)) read_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_b)))
(assert
 (=> rf_2_3 (= (bvadd read_a (_ bv1 32)) read_b)))
(assert
 (=> rf_4_3 (= (bvadd read_b (_ bv1 32)) read_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x873 (bvult co_0 co_2)))
 (let (($x878 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x878 $x873)))))
(assert
 (let (($x1320 (bvult co_4 co_2)))
 (let (($x1693 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x1693 $x1320)))))
(assert
 (let (($x1300 (bvult co_0 co_4)))
 (let (($x655 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x655 $x1300)))))
(assert
 (let (($x1232 (bvult co_2 co_4)))
 (let (($x900 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x900 $x1232)))))
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
 (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert
 (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false (bvult co_0 co_4) or (and true false)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x878 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x878) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x317 (and true false)))
 (let (($x878 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x878 $x317) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x345 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x87 (or false false false $x345)))
 (=> $x87 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x420 (and false false)))
 (let (($x345 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x345 $x420) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x34 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x34) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x420 (and false false)))
 (let (($x34 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x34 $x420) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x345 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x87 (or false false false $x345)))
 (=> $x87 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x317 (and true false)))
 (let (($x345 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x345 $x317) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x1693 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1693) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x317 (and true false)))
 (let (($x1693 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1693 $x317) (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert
 (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (=> (or false false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false (bvult co_2 co_4) or (and true false)) (bvult topo_T_2 topo_T_4)))
(assert
 (let (($x655 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x655) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x317 (and true false)))
 (let (($x655 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x655 $x317) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x270 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x242 (or false false false $x270)))
 (=> $x242 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x317 (and true false)))
 (let (($x270 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x270 $x317) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x900 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x900) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x317 (and true false)))
 (let (($x900 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x900 $x317) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x270 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x242 (or false false false $x270)))
 (=> $x242 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x420 (and false false)))
 (let (($x270 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x270 $x420) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x1328 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1328) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x420 (and false false)))
 (let (($x1328 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x1328 $x420) (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (=> (or false rf_4_1 false or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false false or (and true rf_4_1)) (bvult topo_T_4 topo_T_1)))
(assert
 (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false (bvult co_4 co_2) or (and true false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x1132 (= co_0 (_ bv2 2))))
 (=> $x1132 (= (_ bv0 32) final_x))))
(assert
 (let (($x105 (= co_2 (_ bv2 2))))
 (=> $x105 (= final_x (bvadd read_a (_ bv1 32))))))
(assert
 (let (($x764 (= co_4 (_ bv2 2))))
(=> $x764 (= final_x (bvadd read_b (_ bv1 32))))))
(check-sat)
