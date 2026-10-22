; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_7_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_0_6 () Bool)
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
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_7 (_ bv2 2)))
(assert
 (and (distinct co_0 co_7) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_7_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_7_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_3_4 rf_5_4))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_7_6))
(assert
 (let (($x1145 (bvult co_0 co_7)))
 (let (($x582 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x582 $x1145)))))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (not (and $x199 false))))
(assert
 (let (($x201 (bvult co_1 co_5)))
 (let (($x1373 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x1373 $x201)))))
(assert
 (let (($x1672 (bvult co_3 co_5)))
 (let (($x840 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (not (and $x840 $x1672)))))
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
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x875 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x875) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x1003 (and true false)))
 (let (($x875 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_7_2 (bvult co_7 co_0)))))
 (=> (or false false false $x875 $x1003) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1341 (or false false false $x730 $x1003)))
 (=> $x1341 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x115 (and false false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (=> (or false false false $x730 $x115) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x115 (and false false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (=> (or true false false $x730 $x115) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1341 (or false false false $x730 $x1003)))
 (=> $x1341 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1341 (or false false false $x730 $x1003)))
 (=> $x1341 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1188 (or false false false $x730)))
 (=> $x1188 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x730 (or (and rf_0_2 false) (and rf_7_2 false))))
 (let (($x1341 (or false false false $x730 $x1003)))
 (=> $x1341 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1754 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1754) (bvult topo_U_2 topo_U_7))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1754 (or (and rf_0_2 (bvult co_0 co_7)) (and rf_7_2 (bvult co_7 co_7)))))
 (=> (or false false false $x1754 $x1003) (bvult topo_T_2 topo_T_7)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x115 (and false false)))
 (let (($x165 (or false false false or $x115)))
 (=> $x165 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1258 (or false false false $x199)))
 (=> $x1258 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x424 (or false false false $x199 $x1003)))
 (=> $x424 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1373 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1373) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1373 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x1373 $x1003) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1258 (or false false false $x199)))
 (=> $x1258 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x424 (or false false false $x199 $x1003)))
 (=> $x424 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x840 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x840) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x1003 (and true false)))
 (let (($x840 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x840 $x1003) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1258 (or false false false $x199)))
 (=> $x1258 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x115 (and false false)))
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or false false false $x199 $x115) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x293 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x293) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x115 (and false false)))
 (let (($x293 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x293 $x115) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1258 (or false false false $x199)))
 (=> $x1258 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x115 (and false false)))
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1433 (or true false false $x199 $x115)))
 (=> $x1433 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1258 (or false false false $x199)))
 (=> $x1258 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x115 (and false false)))
 (let (($x199 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1433 (or true false false $x199 $x115)))
 (=> $x1433 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x115 (and false false)))
 (let (($x1181 (or true false false or $x115)))
 (=> $x1181 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x115 (and false false)))
 (let (($x1181 (or true false false or $x115)))
 (=> $x1181 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x582 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x582) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1003 (and true false)))
 (let (($x582 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x582 $x1003) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x670 (or false false false $x1062 $x1003)))
 (=> $x670 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x670 (or false false false $x1062 $x1003)))
 (=> $x670 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x670 (or false false false $x1062 $x1003)))
 (=> $x670 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x115 (and false false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1369 (or false false false $x1062 $x115)))
 (=> $x1369 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x115 (and false false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1369 (or false false false $x1062 $x115)))
 (=> $x1369 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1356 (or false false false $x1062)))
 (=> $x1356 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x115 (and false false)))
 (let (($x1062 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x1369 (or false false false $x1062 $x115)))
 (=> $x1369 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1333 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1333) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x115 (and false false)))
 (let (($x1333 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1333 $x115) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_7 topo_T_1)))))
(assert
 (=> (or false rf_7_2 false or) (bvult topo_U_7 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_7_2)) (bvult topo_T_7 topo_T_2)))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1003 (and true false)))
 (let (($x1266 (or false false false or $x1003)))
 (=> $x1266 (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x115 (and false false)))
 (let (($x165 (or false false false or $x115)))
 (=> $x165 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x793 (or false false false or)))
 (=> $x793 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x115 (and false false)))
 (let (($x165 (or false false false or $x115)))
 (=> $x165 (bvult topo_T_7 topo_T_5)))))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x1227 (= co_0 (_ bv1 2))))
 (=> $x1227 (= (_ bv0 32) final_x))))
(assert
 (let (($x1193 (= co_7 (_ bv1 2))))
 (=> $x1193 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (let (($x721 (= co_1 (_ bv2 2))))
 (=> $x721 (= (_ bv0 32) final_y))))
(assert
 (let (($x84 (= co_3 (_ bv2 2))))
 (=> $x84 (= (_ bv1 32) final_y))))
(assert
 (let (($x288 (= co_5 (_ bv2 2))))
(=> $x288 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
