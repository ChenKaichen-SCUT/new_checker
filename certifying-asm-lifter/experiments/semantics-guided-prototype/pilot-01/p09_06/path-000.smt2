; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
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
 (let (($x2175 (= (_ bv0 32) read_t0_a)))
 (= $x2175 true)))
(assert
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_4 co_6) true))
(assert
 (let (($x2175 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x2175)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 (=> rf_6_3 (= (bvadd read_t1_a (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_6_3))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_4_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_7))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (not (and $x697 false))))
(assert
 (let (($x706 (bvult co_1 co_6)))
 (let (($x2913 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x2913 $x706)))))
(assert
 (let (($x1573 (bvult co_4 co_6)))
 (let (($x1097 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (not (and $x1097 $x1573)))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (not (and $x1067 false))))
(assert
 (let (($x1435 (bvult co_1 co_4)))
 (let (($x2338 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (not (and $x2338 $x1435)))))
(assert
 (let (($x1912 (bvult co_6 co_4)))
 (let (($x1991 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (not (and $x1991 $x1912)))))
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
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x1618 (and true false)))
 (let (($x992 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x992 $x1618) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x175 (or false false false $x826 $x1618)))
 (=> $x175 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x951 (and false false)))
 (let (($x826 (or (and rf_0_2 false))))
 (=> (or false false false $x826 $x951) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x951 (and false false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2822 (or true false false $x826 $x951)))
 (=> $x2822 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x951 (and false false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2822 (or true false false $x826 $x951)))
 (=> $x2822 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x175 (or false false false $x826 $x1618)))
 (=> $x175 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x175 (or false false false $x826 $x1618)))
 (=> $x175 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x2159 (or false false false $x826)))
 (=> $x2159 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x826 (or (and rf_0_2 false))))
 (let (($x175 (or false false false $x826 $x1618)))
 (=> $x175 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2255 (or false false false $x1067)))
 (=> $x2255 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2117 (or false false false $x1067 $x1618)))
 (=> $x2117 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x2338 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x2338) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x1618 (and true false)))
 (let (($x2338 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x2338 $x1618) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2255 (or false false false $x1067)))
 (=> $x2255 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x951 (and false false)))
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2201 (or false false false $x1067 $x951)))
 (=> $x2201 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2255 (or false false false $x1067)))
 (=> $x2255 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x951 (and false false)))
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2201 (or false false false $x1067 $x951)))
 (=> $x2201 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x2212 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x2212) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x951 (and false false)))
 (let (($x2212 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x2212 $x951) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2255 (or false false false $x1067)))
 (=> $x2255 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2117 (or false false false $x1067 $x1618)))
 (=> $x2117 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x1991 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x1991) (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1991 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x1991 $x1618) (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2255 (or false false false $x1067)))
 (=> $x2255 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1067 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2117 (or false false false $x1067 $x1618)))
 (=> $x2117 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_4 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_4 topo_T_2)))
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
 (=> (or false false (bvult co_4 co_6) or) (bvult topo_U_4 topo_U_6)))
(assert
 (=> (or false false (bvult co_4 co_6) or (and true false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2359 (or false false false $x697)))
 (=> $x2359 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1691 (or false false false $x697 $x1618)))
 (=> $x1691 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x2913 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x2913) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1618 (and true false)))
 (let (($x2913 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x2913 $x1618) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2359 (or false false false $x697)))
 (=> $x2359 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1691 (or false false false $x697 $x1618)))
 (=> $x1691 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2359 (or false false false $x697)))
 (=> $x2359 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x1691 (or false false false $x697 $x1618)))
 (=> $x1691 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1097 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x1097) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1097 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x1097 $x1618) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2359 (or false false false $x697)))
 (=> $x2359 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x951 (and false false)))
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (=> (or false false false $x697 $x951) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1457 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1457) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x951 (and false false)))
 (let (($x1457 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1457 $x951) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2359 (or false false false $x697)))
 (=> $x2359 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x951 (and false false)))
 (let (($x697 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (=> (or true false false $x697 $x951) (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1229 (or false false false or $x1618)))
 (=> $x1229 (bvult topo_T_6 topo_T_2)))))
(assert
 (=> (or false rf_6_3 false or) (bvult topo_U_6 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_6_3)) (bvult topo_T_6 topo_T_3)))
(assert
 (=> (or false false (bvult co_6 co_4) or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false (bvult co_6 co_4) or (and true false)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x238 (or false false false or)))
 (=> $x238 (bvult topo_U_6 topo_U_7))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_6 topo_T_7)))
(assert
 (=> (or false false false (or (and rf_0_7 (bvult co_0 co_0)))) (bvult topo_U_7 topo_U_0)))
(assert
 (let (($x1618 (and true false)))
 (let (($x1373 (or (and rf_0_7 (bvult co_0 co_0)))))
 (=> (or false false false $x1373 $x1618) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x586 (or false false false $x1651 $x1618)))
 (=> $x586 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x586 (or false false false $x1651 $x1618)))
 (=> $x586 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x586 (or false false false $x1651 $x1618)))
 (=> $x586 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x1618 (and true false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x586 (or false false false $x1651 $x1618)))
 (=> $x586 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x951 (and false false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1363 (or false false false $x1651 $x951)))
 (=> $x1363 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x951 (and false false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1363 (or false false false $x1651 $x951)))
 (=> $x1363 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1372 (or false false false $x1651)))
 (=> $x1372 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x951 (and false false)))
 (let (($x1651 (or (and rf_0_7 false))))
 (let (($x1363 (or false false false $x1651 $x951)))
 (=> $x1363 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2696 (= co_0 (_ bv0 1))))
 (=> $x2696 (= (_ bv0 32) final_x))))
(assert
 (let (($x1751 (= co_1 (_ bv2 2))))
 (=> $x1751 (= (_ bv0 32) final_y))))
(assert
 (let (($x2020 (= co_4 (_ bv2 2))))
 (=> $x2020 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x565 (= co_6 (_ bv2 2))))
(=> $x565 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
