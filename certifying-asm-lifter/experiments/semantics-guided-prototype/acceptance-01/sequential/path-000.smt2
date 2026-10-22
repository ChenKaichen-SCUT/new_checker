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
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
(declare-fun rf_4_5 () Bool)
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
 (=> rf_0_5 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_5 (= (bvadd read_a (_ bv1 32)) read_other)))
(assert
 (=> rf_4_5 (= (bvadd read_b (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_4_5))
(assert
 (let (($x399 (bvult co_0 co_2)))
 (let (($x354 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (not (and $x354 $x399)))))
(assert
 (let (($x512 (bvult co_0 co_4)))
 (let (($x1099 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (not (and $x1099 $x512)))))
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
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x354 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x354) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x983 (and true false)))
 (let (($x354 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)) (and rf_4_1 (bvult co_4 co_0)))))
 (=> (or false false false $x354 $x983) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x193 (or false false false $x1205)))
 (=> $x193 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x323 (and false false)))
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x1205 $x323) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x344 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x344) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x323 (and false false)))
 (let (($x344 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)) (and rf_4_1 (bvult co_4 co_2)))))
 (=> (or true false false $x344 $x323) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or true false false $x1205) (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x323 (and false false)))
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or true false false $x1205 $x323) (bvult topo_T_1 topo_T_3)))))
(assert
 (let (($x864 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or true false false $x864) (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x323 (and false false)))
 (let (($x864 (or (and rf_0_1 (bvult co_0 co_4)) (and rf_2_1 (bvult co_2 co_4)) (and rf_4_1 (bvult co_4 co_4)))))
 (=> (or true false false $x864 $x323) (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (let (($x193 (or false false false $x1205)))
 (=> $x193 (bvult topo_U_1 topo_U_5)))))
(assert
 (let (($x983 (and true false)))
 (let (($x1205 (or (and rf_0_1 false) (and rf_2_1 false) (and rf_4_1 false))))
 (=> (or false false false $x1205 $x983) (bvult topo_T_1 topo_T_5)))))
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
 (=> (or true rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or true false false or (and false rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (=> (or true false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or true false (bvult co_2 co_4) or (and false false)) (bvult topo_T_2 topo_T_4)))
(assert
 (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x1099 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x1099) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x983 (and true false)))
 (let (($x1099 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)) (and rf_4_3 (bvult co_4 co_0)))))
 (=> (or false false false $x1099 $x983) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x497 (or false false false $x90)))
 (=> $x497 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x323 (and false false)))
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x211 (or false false false $x90 $x323)))
 (=> $x211 (bvult topo_T_3 topo_T_1))))))
(assert
 (let (($x262 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x262) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x323 (and false false)))
 (let (($x262 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)) (and rf_4_3 (bvult co_4 co_2)))))
 (=> (or false false false $x262 $x323) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x497 (or false false false $x90)))
 (=> $x497 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x323 (and false false)))
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x211 (or false false false $x90 $x323)))
 (=> $x211 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x913 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x913) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x323 (and false false)))
 (let (($x913 (or (and rf_0_3 (bvult co_0 co_4)) (and rf_2_3 (bvult co_2 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x913 $x323) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (let (($x497 (or false false false $x90)))
 (=> $x497 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x983 (and true false)))
 (let (($x90 (or (and rf_0_3 false) (and rf_2_3 false) (and rf_4_3 false))))
 (=> (or false false false $x90 $x983) (bvult topo_T_3 topo_T_5)))))
(assert
 (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert
 (=> (or false false (bvult co_4 co_0) or (and true false)) (bvult topo_T_4 topo_T_0)))
(assert
 (=> (or false rf_4_1 false or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false false or (and false rf_4_1)) (bvult topo_T_4 topo_T_1)))
(assert
 (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert
 (=> (or false false (bvult co_4 co_2) or (and false false)) (bvult topo_T_4 topo_T_2)))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x1296 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_4_5 (bvult co_4 co_0)))))
 (=> (or false false false $x1296) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x983 (and true false)))
 (let (($x1296 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_2_5 (bvult co_2 co_0)) (and rf_4_5 (bvult co_4 co_0)))))
 (=> (or false false false $x1296 $x983) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (let (($x1268 (or false false false $x1326)))
 (=> $x1268 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x983 (and true false)))
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (let (($x965 (or false false false $x1326 $x983)))
 (=> $x965 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1210 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_4_5 (bvult co_4 co_2)))))
 (=> (or false false false $x1210) (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x983 (and true false)))
 (let (($x1210 (or (and rf_0_5 (bvult co_0 co_2)) (and rf_2_5 (bvult co_2 co_2)) (and rf_4_5 (bvult co_4 co_2)))))
 (=> (or false false false $x1210 $x983) (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (let (($x1268 (or false false false $x1326)))
 (=> $x1268 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x983 (and true false)))
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (let (($x965 (or false false false $x1326 $x983)))
 (=> $x965 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1085 (or (and rf_0_5 (bvult co_0 co_4)) (and rf_2_5 (bvult co_2 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1085) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x983 (and true false)))
 (let (($x1085 (or (and rf_0_5 (bvult co_0 co_4)) (and rf_2_5 (bvult co_2 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1085 $x983) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (let (($x1268 (or false false false $x1326)))
 (=> $x1268 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x323 (and false false)))
 (let (($x1326 (or (and rf_0_5 false) (and rf_2_5 false) (and rf_4_5 false))))
 (=> (or false false false $x1326 $x323) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1218 (= co_0 (_ bv2 2))))
 (=> $x1218 (= (_ bv0 32) final_x))))
(assert
 (let (($x1181 (= co_2 (_ bv2 2))))
 (=> $x1181 (= final_x (bvadd read_a (_ bv1 32))))))
(assert
 (let (($x1134 (= co_4 (_ bv2 2))))
(=> $x1134 (= final_x (bvadd read_b (_ bv1 32))))))
(check-sat)
