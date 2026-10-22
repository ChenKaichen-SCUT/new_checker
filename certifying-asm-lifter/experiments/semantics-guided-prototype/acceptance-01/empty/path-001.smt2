; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_no () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_other () (_ BitVec 32))
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
 false)
(assert
 (= input_b false))
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
 (=> rf_0_1 (= (_ bv0 32) read_no)))
(assert
 (=> rf_2_1 (= (bvadd read_no (_ bv2 32)) read_no)))
(assert
 (=> rf_4_1 (= (bvadd read_other (_ bv1 32)) read_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_3 (= (bvadd read_no (_ bv2 32)) read_other)))
(assert
 (=> rf_4_3 (= (bvadd read_other (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert
 (let (($x160 (bvult co_0 co_2)))
 (let (($x405 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x405 $x160)))))
(assert
 (let (($x984 (bvult co_4 co_2)))
 (let (($x1134 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (not (and $x1134 $x984)))))
(assert
 (let (($x314 (bvult co_0 co_4)))
 (let (($x2192 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x2192 $x314)))))
(assert
 (let (($x317 (bvult co_2 co_4)))
 (let (($x1051 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (not (and $x1051 $x317)))))
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
 (let (($x405 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x405) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x381 (and true false)))
 (let (($x405 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x405 $x381) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x117 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x327 (or false false false $x117)))
 (=> $x327 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x242 (and false false)))
 (let (($x117 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x117 $x242) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x729 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x729) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x242 (and false false)))
 (let (($x729 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x729 $x242) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x117 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x327 (or false false false $x117)))
 (=> $x327 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x381 (and true false)))
 (let (($x117 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x117 $x381) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x1134 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1134) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x381 (and true false)))
 (let (($x1134 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or false false false $x1134 $x381) (bvult topo_T_1 topo_T_4)))))
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
 (let (($x2192 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x2192) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x381 (and true false)))
 (let (($x2192 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x2192 $x381) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x321 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x666 (or false false false $x321)))
 (=> $x666 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x381 (and true false)))
 (let (($x321 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x321 $x381) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1051 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x1051) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x381 (and true false)))
 (let (($x1051 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x1051 $x381) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x321 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x666 (or false false false $x321)))
 (=> $x666 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x242 (and false false)))
 (let (($x321 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x321 $x242) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x778 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x778) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x242 (and false false)))
 (let (($x778 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x778 $x242) (bvult topo_T_3 topo_T_4)))))
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
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (=> (= co_2 (_ bv2 2)) (= final_x (bvadd read_no (_ bv2 32)))))
(assert
 (=> (= co_4 (_ bv2 2)) (= final_x (bvadd read_other (_ bv1 32)))))
(check-sat)
