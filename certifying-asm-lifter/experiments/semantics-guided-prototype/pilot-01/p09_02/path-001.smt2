; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_6_3 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_4_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (let (($x784 (= (_ bv0 32) read_t0_a)))
 (= $x784 false)))
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
 (let (($x784 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x784)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 (=> rf_6_3 (= (bvadd read_t1_a (_ bv1 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_6_3))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_4_5 rf_6_5))
(assert
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (not (and $x2137 false))))
(assert
 (let (($x416 (bvult co_1 co_6)))
 (let (($x2069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x2069 $x416)))))
(assert
 (let (($x1883 (bvult co_4 co_6)))
 (let (($x2452 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (not (and $x2452 $x1883)))))
(assert
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (not (and $x2303 false))))
(assert
 (let (($x1393 (bvult co_1 co_4)))
 (let (($x1744 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (not (and $x1744 $x1393)))))
(assert
 (let (($x1139 (bvult co_6 co_4)))
 (let (($x668 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (not (and $x668 $x1139)))))
(assert
 (bvult topo_U_0 (_ bv7 3)))
(assert
 (bvult topo_U_1 (_ bv7 3)))
(assert
 (bvult topo_U_2 (_ bv7 3)))
(assert
 (bvult topo_U_3 (_ bv7 3)))
(assert
 (bvult topo_U_4 (_ bv7 3)))
(assert
 (bvult topo_U_5 (_ bv7 3)))
(assert
 (bvult topo_U_6 (_ bv7 3)))
(assert
 (bvult topo_T_0 (_ bv7 3)))
(assert
 (bvult topo_T_1 (_ bv7 3)))
(assert
 (bvult topo_T_2 (_ bv7 3)))
(assert
 (bvult topo_T_3 (_ bv7 3)))
(assert
 (bvult topo_T_4 (_ bv7 3)))
(assert
 (bvult topo_T_5 (_ bv7 3)))
(assert
 (bvult topo_T_6 (_ bv7 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_1 topo_T_2)))))
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
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x876 (and true false)))
 (let (($x356 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x356 $x876) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x2422 (or false false false $x2071 $x876)))
 (=> $x2422 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (=> (or false false false $x2071 $x765) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x2650 (or true false false $x2071 $x765)))
 (=> $x2650 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x2650 (or true false false $x2071 $x765)))
 (=> $x2650 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x2422 (or false false false $x2071 $x876)))
 (=> $x2422 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x23 (or false false false $x2071)))
 (=> $x23 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2071 (or (and rf_0_2 false))))
 (let (($x2422 (or false false false $x2071 $x876)))
 (=> $x2422 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2511 (or false false false $x2303)))
 (=> $x2511 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2359 (or false false false $x2303 $x876)))
 (=> $x2359 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x1744 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x1744) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x876 (and true false)))
 (let (($x1744 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_6_3 (bvult co_6 co_1)))))
 (=> (or false false false $x1744 $x876) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2511 (or false false false $x2303)))
 (=> $x2511 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x1196 (or false false false $x2303 $x765)))
 (=> $x1196 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2511 (or false false false $x2303)))
 (=> $x2511 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x1196 (or false false false $x2303 $x765)))
 (=> $x1196 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x217 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x217) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x765 (and false false)))
 (let (($x217 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_6_3 (bvult co_6 co_4)))))
 (=> (or true false false $x217 $x765) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2511 (or false false false $x2303)))
 (=> $x2511 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2303 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_6_3 false))))
 (let (($x2359 (or false false false $x2303 $x876)))
 (=> $x2359 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x668 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x668) (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x876 (and true false)))
 (let (($x668 (or (and rf_1_3 (bvult co_1 co_6)) (and rf_4_3 (bvult co_4 co_6)) (and rf_6_3 (bvult co_6 co_6)))))
 (=> (or false false false $x668 $x876) (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_4 topo_U_2))))
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
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2273 (or false false false $x2137)))
 (=> $x2273 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x696 (or false false false $x2137 $x876)))
 (=> $x696 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x2069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x2069) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x876 (and true false)))
 (let (($x2069 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x2069 $x876) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2273 (or false false false $x2137)))
 (=> $x2273 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x696 (or false false false $x2137 $x876)))
 (=> $x696 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2273 (or false false false $x2137)))
 (=> $x2273 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x876 (and true false)))
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x696 (or false false false $x2137 $x876)))
 (=> $x696 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x2452 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x2452) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x876 (and true false)))
 (let (($x2452 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)) (and rf_6_5 (bvult co_6 co_4)))))
 (=> (or false false false $x2452 $x876) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (let (($x2273 (or false false false $x2137)))
 (=> $x2273 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x765 (and false false)))
 (let (($x2137 (or (and rf_1_5 false) (and rf_4_5 false) (and rf_6_5 false))))
 (=> (or false false false $x2137 $x765) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1627 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1627) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x765 (and false false)))
 (let (($x1627 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_4_5 (bvult co_4 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1627 $x765) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x865 (or false false false or)))
 (=> $x865 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x876 (and true false)))
 (let (($x1998 (or false false false or $x876)))
 (=> $x1998 (bvult topo_T_6 topo_T_2)))))
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
 (let (($x667 (= (_ bv0 32) final_x)))
 (let (($x832 (= co_0 (_ bv0 1))))
 (=> $x832 $x667))))
(assert
 (let (($x311 (= co_1 (_ bv2 2))))
 (=> $x311 (= (_ bv0 32) final_y))))
(assert
 (let (($x2271 (= co_4 (_ bv2 2))))
 (=> $x2271 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x802 (= co_6 (_ bv2 2))))
(=> $x802 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
