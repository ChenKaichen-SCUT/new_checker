; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun rf_6_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
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
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_0 co_3) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (bvult co_6 (_ bv3 2)))
(assert
 (and (distinct co_1 co_5 co_6) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_3_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 (=> rf_6_4 (= (_ bv1 32) read_t0_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_6_4))
(assert
 (=> rf_0_8 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_8 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_8 rf_3_8))
(assert
 (let (($x1134 (bvult co_0 co_3)))
 (let (($x1326 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (not (and $x1326 $x1134)))))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (not (and (or (and rf_0_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (not (and $x1441 false))))
(assert
 (let (($x1274 (bvult co_1 co_5)))
 (let (($x1542 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (not (and $x1542 $x1274)))))
(assert
 (let (($x1949 (bvult co_6 co_5)))
 (let (($x1615 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (not (and $x1615 $x1949)))))
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
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_0 topo_T_7)))))
(assert
 (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false (bvult co_1 co_6) or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false (bvult co_1 co_6) or (and true false)) (bvult topo_T_1 topo_T_6)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1326 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1326) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x1326 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)))))
 (=> (or false false false $x1326 $x773) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x266 (or false false false $x1012 $x773)))
 (=> $x266 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (=> (or false false false $x1012 $x955) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x433 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x433) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x955 (and false false)))
 (let (($x433 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x433 $x955) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x922 (or true false false $x1012 $x955)))
 (=> $x922 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x922 (or true false false $x1012 $x955)))
 (=> $x922 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x266 (or false false false $x1012 $x773)))
 (=> $x266 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x266 (or false false false $x1012 $x773)))
 (=> $x266 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x1991 (or false false false $x1012)))
 (=> $x1991 (bvult topo_U_2 topo_U_8)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1012 (or (and rf_0_2 false) (and rf_3_2 false))))
 (let (($x266 (or false false false $x1012 $x773)))
 (=> $x266 (bvult topo_T_2 topo_T_8))))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x955 (and false false)))
 (let (($x176 (or true false false or $x955)))
 (=> $x176 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x955 (and false false)))
 (let (($x176 (or true false false or $x955)))
 (=> $x176 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_3 topo_T_7)))))
(assert
 (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x37 (or false false false $x1441 $x773)))
 (=> $x37 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1542 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1542) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x773 (and true false)))
 (let (($x1542 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_6_4 (bvult co_6 co_1)))))
 (=> (or false false false $x1542 $x773) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1948 (or false false false $x1441 $x955)))
 (=> $x1948 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1948 (or false false false $x1441 $x955)))
 (=> $x1948 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1948 (or false false false $x1441 $x955)))
 (=> $x1948 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1664 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1664) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x955 (and false false)))
 (let (($x1664 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_6_4 (bvult co_6 co_5)))))
 (=> (or true false false $x1664 $x955) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1615 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1615) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x773 (and true false)))
 (let (($x1615 (or (and rf_1_4 (bvult co_1 co_6)) (and rf_5_4 (bvult co_5 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x1615 $x773) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x37 (or false false false $x1441 $x773)))
 (=> $x37 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x1919 (or false false false $x1441)))
 (=> $x1919 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1441 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_6_4 false))))
 (let (($x37 (or false false false $x1441 $x773)))
 (=> $x37 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false false (bvult co_5 co_6) or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false (bvult co_5 co_6) or (and true false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_5 topo_U_7))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_5 topo_T_7)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_5 topo_U_8))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_5 topo_T_8)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_6 topo_T_0)))))
(assert
 (=> (or false false (bvult co_6 co_1) or) (bvult topo_U_6 topo_U_1)))
(assert
 (=> (or false false (bvult co_6 co_1) or (and true false)) (bvult topo_T_6 topo_T_1)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false false (bvult co_6 co_5) or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false (bvult co_6 co_5) or (and true false)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_6 topo_U_8))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_6 topo_T_8)))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_4))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_4)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_5))))
(assert
 (let (($x773 (and true false)))
 (let (($x1001 (or false false false or $x773)))
 (=> $x1001 (bvult topo_T_7 topo_T_5)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_6))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_7 topo_T_6)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_7))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_7 topo_T_7)))))
(assert
 (let (($x522 (or false false false or)))
 (=> $x522 (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x955 (and false false)))
 (let (($x310 (or false false false or $x955)))
 (=> $x310 (bvult topo_T_7 topo_T_8)))))
(assert
 (let (($x735 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)))))
 (=> (or false false false $x735) (bvult topo_U_8 topo_U_0))))
(assert
 (let (($x773 (and true false)))
 (let (($x735 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)))))
 (=> (or false false false $x735 $x773) (bvult topo_T_8 topo_T_0)))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_1)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x254 (or false false false $x1738 $x773)))
 (=> $x254 (bvult topo_T_8 topo_T_1))))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_2)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x254 (or false false false $x1738 $x773)))
 (=> $x254 (bvult topo_T_8 topo_T_2))))))
(assert
 (let (($x166 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)))))
 (=> (or false false false $x166) (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x773 (and true false)))
 (let (($x166 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)))))
 (=> (or false false false $x166 $x773) (bvult topo_T_8 topo_T_3)))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_4)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x254 (or false false false $x1738 $x773)))
 (=> $x254 (bvult topo_T_8 topo_T_4))))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_5)))))
(assert
 (let (($x773 (and true false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x254 (or false false false $x1738 $x773)))
 (=> $x254 (bvult topo_T_8 topo_T_5))))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_6)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1341 (or false false false $x1738 $x955)))
 (=> $x1341 (bvult topo_T_8 topo_T_6))))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_7)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1341 (or false false false $x1738 $x955)))
 (=> $x1341 (bvult topo_T_8 topo_T_7))))))
(assert
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1684 (or false false false $x1738)))
 (=> $x1684 (bvult topo_U_8 topo_U_8)))))
(assert
 (let (($x955 (and false false)))
 (let (($x1738 (or (and rf_0_8 false) (and rf_3_8 false))))
 (let (($x1341 (or false false false $x1738 $x955)))
 (=> $x1341 (bvult topo_T_8 topo_T_8))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x458 (= co_3 (_ bv1 2))))
 (=> $x458 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1966 (= co_5 (_ bv2 2))))
 (=> $x1966 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x333 (= co_6 (_ bv2 2))))
 (=> $x333 (= (_ bv1 32) final_y))))
(assert
 (let (($x412 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1545 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x53 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1965 (and (distinct rf_3_8 true) true)))
 (let (($x1632 (and (distinct rf_0_8 false) true)))
 (let (($x894 (and (distinct rf_6_4 false) true)))
 (let (($x163 (and (distinct rf_5_4 false) true)))
 (let (($x705 (and (distinct rf_1_4 true) true)))
 (let (($x1625 (and (distinct rf_3_2 false) true)))
 (let (($x111 (and (distinct rf_0_2 true) true)))
 (let (($x1000 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1490 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x709 (and (distinct input_b false) true)))
 (or $x709 $x2060 $x1490 $x1000 $x111 $x1625 $x705 $x163 $x894 $x1632 $x1965 $x1434 $x1240 $x53 $x1545 $x412))))))))))))))))))
(assert
 (let (($x412 (and (distinct (_ bv2 2) co_6) true)))
 (let (($x1545 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x53 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1965 (and (distinct rf_3_8 true) true)))
 (let (($x1632 (and (distinct rf_0_8 false) true)))
 (let (($x894 (and (distinct rf_6_4 false) true)))
 (let (($x163 (and (distinct rf_5_4 false) true)))
 (let (($x705 (and (distinct rf_1_4 true) true)))
 (let (($x1625 (and (distinct rf_3_2 false) true)))
 (let (($x111 (and (distinct rf_0_2 true) true)))
 (let (($x1000 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1490 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1077 (and (distinct input_b true) true)))
 (or $x1077 $x2060 $x1490 $x1000 $x111 $x1625 $x705 $x163 $x894 $x1632 $x1965 $x1434 $x1240 $x53 $x1545 $x412))))))))))))))))))
(assert
 (let (($x781 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1932 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x53 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1965 (and (distinct rf_3_8 true) true)))
 (let (($x1632 (and (distinct rf_0_8 false) true)))
 (let (($x1606 (and (distinct rf_6_4 true) true)))
 (let (($x163 (and (distinct rf_5_4 false) true)))
 (let (($x770 (and (distinct rf_1_4 false) true)))
 (let (($x1625 (and (distinct rf_3_2 false) true)))
 (let (($x111 (and (distinct rf_0_2 true) true)))
 (let (($x1000 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1660 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x709 (and (distinct input_b false) true)))
 (or $x709 $x2060 $x1660 $x1000 $x111 $x1625 $x770 $x163 $x1606 $x1632 $x1965 $x1434 $x1240 $x53 $x1932 $x781))))))))))))))))))
(assert
 (let (($x781 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1932 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x53 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1965 (and (distinct rf_3_8 true) true)))
 (let (($x1632 (and (distinct rf_0_8 false) true)))
 (let (($x1606 (and (distinct rf_6_4 true) true)))
 (let (($x163 (and (distinct rf_5_4 false) true)))
 (let (($x770 (and (distinct rf_1_4 false) true)))
 (let (($x1625 (and (distinct rf_3_2 false) true)))
 (let (($x111 (and (distinct rf_0_2 true) true)))
 (let (($x1000 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x1660 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1077 (and (distinct input_b true) true)))
 (or $x1077 $x2060 $x1660 $x1000 $x111 $x1625 $x770 $x163 $x1606 $x1632 $x1965 $x1434 $x1240 $x53 $x1932 $x781))))))))))))))))))
(assert
 (let (($x781 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x1932 (and (distinct (_ bv2 2) co_5) true)))
 (let (($x53 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x272 (and (distinct rf_3_8 false) true)))
 (let (($x43 (and (distinct rf_0_8 true) true)))
 (let (($x1606 (and (distinct rf_6_4 true) true)))
 (let (($x163 (and (distinct rf_5_4 false) true)))
 (let (($x770 (and (distinct rf_1_4 false) true)))
 (let (($x1625 (and (distinct rf_3_2 false) true)))
 (let (($x111 (and (distinct rf_0_2 true) true)))
 (let (($x362 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1660 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x709 (and (distinct input_b false) true)))
 (or $x709 $x2060 $x1660 $x362 $x111 $x1625 $x770 $x163 $x1606 $x43 $x272 $x1434 $x1240 $x53 $x1932 $x781))))))))))))))))))
(assert
 (let (($x781 (and (distinct (_ bv1 2) co_6) true)))
(let (($x1932 (and (distinct (_ bv2 2) co_5) true)))
(let (($x53 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1240 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1434 (and (distinct (_ bv0 2) co_0) true)))
(let (($x272 (and (distinct rf_3_8 false) true)))
(let (($x43 (and (distinct rf_0_8 true) true)))
(let (($x1606 (and (distinct rf_6_4 true) true)))
(let (($x163 (and (distinct rf_5_4 false) true)))
(let (($x770 (and (distinct rf_1_4 false) true)))
(let (($x1625 (and (distinct rf_3_2 false) true)))
(let (($x111 (and (distinct rf_0_2 true) true)))
(let (($x362 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1660 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x2060 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x1077 (and (distinct input_b true) true)))
(or $x1077 $x2060 $x1660 $x362 $x111 $x1625 $x770 $x163 $x1606 $x43 $x272 $x1434 $x1240 $x53 $x1932 $x781))))))))))))))))))
(check-sat)
