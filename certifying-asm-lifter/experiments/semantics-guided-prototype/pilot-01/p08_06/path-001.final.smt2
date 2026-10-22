; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 1))
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
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
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
 (= input_b false))
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
 (let (($x582 (= (_ bv0 32) read_t0_b)))
 (=> rf_0_4 $x582)))
(assert
 ((_ pbeq 1 1) rf_0_4))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_5 rf_3_5 rf_6_5))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_7))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (not (and $x2667 false))))
(assert
 (let (($x2600 (bvult co_1 co_3)))
 (let (($x2353 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (not (and $x2353 $x2600)))))
(assert
 (let (($x2439 (bvult co_6 co_3)))
 (let (($x2344 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (not (and $x2344 $x2439)))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (not (and $x2794 false))))
(assert
 (let (($x2240 (bvult co_1 co_6)))
 (let (($x1984 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (not (and $x1984 $x2240)))))
(assert
 (let (($x2795 (bvult co_3 co_6)))
 (let (($x1882 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (not (and $x1882 $x2795)))))
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
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x407 (or false false false $x2667)))
 (=> $x407 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x46 (or false false false $x2667 $x1475)))
 (=> $x46 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x2353 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x2353) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2353 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)) (and rf_6_2 (bvult co_6 co_1)))))
 (=> (or false false false $x2353 $x1475) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x407 (or false false false $x2667)))
 (=> $x407 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or false false false $x2667 $x555) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1756 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x1756) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x555 (and false false)))
 (let (($x1756 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_6_2 (bvult co_6 co_3)))))
 (=> (or true false false $x1756 $x555) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x407 (or false false false $x2667)))
 (=> $x407 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (=> (or true false false $x2667 $x555) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x407 (or false false false $x2667)))
 (=> $x407 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x46 (or false false false $x2667 $x1475)))
 (=> $x46 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x2344 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x2344) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2344 (or (and rf_1_2 (bvult co_1 co_6)) (and rf_3_2 (bvult co_3 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x2344 $x1475) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x407 (or false false false $x2667)))
 (=> $x407 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2667 (or (and rf_1_2 false) (and rf_3_2 false) (and rf_6_2 false))))
 (let (($x46 (or false false false $x2667 $x1475)))
 (=> $x46 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x555 (and false false)))
 (let (($x2556 (or true false false or $x555)))
 (=> $x2556 (bvult topo_T_3 topo_T_4)))))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (=> (or false false (bvult co_3 co_6) or) (bvult topo_U_3 topo_U_6)))
(assert
 (=> (or false false (bvult co_3 co_6) or (and true false)) (bvult topo_T_3 topo_T_6)))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_3 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_4 (bvult co_0 co_0)))) (bvult topo_U_4 topo_U_0)))
(assert
 (let (($x1475 (and true false)))
 (let (($x1183 (or (and rf_0_4 (bvult co_0 co_0)))))
 (=> (or false false false $x1183 $x1475) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x307 (or false false false $x254 $x1475)))
 (=> $x307 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x555 (and false false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1771 (or false false false $x254 $x555)))
 (=> $x1771 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x555 (and false false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1771 (or false false false $x254 $x555)))
 (=> $x1771 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x555 (and false false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1771 (or false false false $x254 $x555)))
 (=> $x1771 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x307 (or false false false $x254 $x1475)))
 (=> $x307 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x307 (or false false false $x254 $x1475)))
 (=> $x307 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x1971 (or false false false $x254)))
 (=> $x1971 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x254 (or (and rf_0_4 false))))
 (let (($x307 (or false false false $x254 $x1475)))
 (=> $x307 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x735 (or false false false $x2794)))
 (=> $x735 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1313 (or false false false $x2794 $x1475)))
 (=> $x1313 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1984 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1984) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1475 (and true false)))
 (let (($x1984 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)) (and rf_6_5 (bvult co_6 co_1)))))
 (=> (or false false false $x1984 $x1475) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x735 (or false false false $x2794)))
 (=> $x735 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1313 (or false false false $x2794 $x1475)))
 (=> $x1313 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1882 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x1882) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1475 (and true false)))
 (let (($x1882 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)) (and rf_6_5 (bvult co_6 co_3)))))
 (=> (or false false false $x1882 $x1475) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x735 (or false false false $x2794)))
 (=> $x735 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x1313 (or false false false $x2794 $x1475)))
 (=> $x1313 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x735 (or false false false $x2794)))
 (=> $x735 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or false false false $x2794 $x555) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1233 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1233) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x555 (and false false)))
 (let (($x1233 (or (and rf_1_5 (bvult co_1 co_6)) (and rf_3_5 (bvult co_3 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x1233 $x555) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (let (($x735 (or false false false $x2794)))
 (=> $x735 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2794 (or (and rf_1_5 false) (and rf_3_5 false) (and rf_6_5 false))))
 (=> (or true false false $x2794 $x555) (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_6 topo_T_0)))))
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
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x1475 (and true false)))
 (let (($x37 (or false false false or $x1475)))
 (=> $x37 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x2527 (or false false false or)))
 (=> $x2527 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x555 (and false false)))
 (let (($x2556 (or true false false or $x555)))
 (=> $x2556 (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_7 (bvult co_0 co_0)))) (bvult topo_U_7 topo_U_0)))
(assert
 (let (($x1475 (and true false)))
 (let (($x1659 (or (and rf_0_7 (bvult co_0 co_0)))))
 (=> (or false false false $x1659 $x1475) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x1529 (or false false false $x2107 $x1475)))
 (=> $x1529 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x1529 (or false false false $x2107 $x1475)))
 (=> $x1529 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x1529 (or false false false $x2107 $x1475)))
 (=> $x1529 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x1475 (and true false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x1529 (or false false false $x2107 $x1475)))
 (=> $x1529 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x2101 (or false false false $x2107 $x555)))
 (=> $x2101 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x2101 (or false false false $x2107 $x555)))
 (=> $x2101 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x544 (or false false false $x2107)))
 (=> $x544 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x555 (and false false)))
 (let (($x2107 (or (and rf_0_7 false))))
 (let (($x2101 (or false false false $x2107 $x555)))
 (=> $x2101 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2584 (= (_ bv0 32) final_x)))
 (let (($x1969 (= co_0 (_ bv0 1))))
 (=> $x1969 $x2584))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x2086 (= co_3 (_ bv2 2))))
 (=> $x2086 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x2324 (= co_6 (_ bv2 2))))
 (=> $x2324 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x1374 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1959 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x780 (and (distinct rf_0_7 true) true)))
 (let (($x1231 (and (distinct rf_6_5 false) true)))
 (let (($x1553 (and (distinct rf_0_4 true) true)))
 (let (($x967 (and (distinct rf_3_2 false) true)))
 (let (($x2457 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x928 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2642 (and (distinct input_b false) true)))
 (or $x2642 (and (distinct (_ bv0 32) read_t0_no) true) $x928 (and (distinct (_ bv2 32) read_t1_a) true) $x2457 (and (distinct rf_1_2 true) true) $x967 (and (distinct rf_6_2 false) true) $x1553 (and (distinct rf_1_5 false) true) (and (distinct rf_3_5 true) true) $x1231 $x780 $x1959 $x1374 (and (distinct (_ bv1 2) co_3) true) (and (distinct (_ bv2 2) co_6) true))))))))))))
(assert
 (let (($x1374 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1959 (and (distinct (_ bv0 1) co_0) true)))
(let (($x780 (and (distinct rf_0_7 true) true)))
(let (($x1231 (and (distinct rf_6_5 false) true)))
(let (($x1553 (and (distinct rf_0_4 true) true)))
(let (($x967 (and (distinct rf_3_2 false) true)))
(let (($x2457 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x928 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x2642 (and (distinct input_b false) true)))
(or $x2642 (and (distinct (_ bv1 32) read_t0_no) true) $x928 (and (distinct (_ bv0 32) read_t1_a) true) $x2457 (and (distinct rf_1_2 false) true) $x967 (and (distinct rf_6_2 true) true) $x1553 (and (distinct rf_1_5 true) true) (and (distinct rf_3_5 false) true) $x1231 $x780 $x1959 $x1374 (and (distinct (_ bv2 2) co_3) true) (and (distinct (_ bv1 2) co_6) true))))))))))))
(check-sat)
