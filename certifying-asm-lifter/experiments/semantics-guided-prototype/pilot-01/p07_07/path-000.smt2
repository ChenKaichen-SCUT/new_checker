; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_9 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_9_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_7_4 () Bool)
(declare-fun rf_1_6 () Bool)
(declare-fun rf_5_6 () Bool)
(declare-fun rf_7_6 () Bool)
(declare-fun rf_0_8 () Bool)
(declare-fun rf_3_8 () Bool)
(declare-fun rf_9_8 () Bool)
(declare-fun topo_U_0 () (_ BitVec 4))
(declare-fun topo_U_1 () (_ BitVec 4))
(declare-fun topo_U_2 () (_ BitVec 4))
(declare-fun topo_U_3 () (_ BitVec 4))
(declare-fun topo_U_4 () (_ BitVec 4))
(declare-fun topo_U_5 () (_ BitVec 4))
(declare-fun topo_U_6 () (_ BitVec 4))
(declare-fun topo_U_7 () (_ BitVec 4))
(declare-fun topo_U_8 () (_ BitVec 4))
(declare-fun topo_U_9 () (_ BitVec 4))
(declare-fun topo_T_0 () (_ BitVec 4))
(declare-fun topo_T_1 () (_ BitVec 4))
(declare-fun topo_T_2 () (_ BitVec 4))
(declare-fun topo_T_3 () (_ BitVec 4))
(declare-fun topo_T_4 () (_ BitVec 4))
(declare-fun topo_T_5 () (_ BitVec 4))
(declare-fun topo_T_6 () (_ BitVec 4))
(declare-fun topo_T_7 () (_ BitVec 4))
(declare-fun topo_T_8 () (_ BitVec 4))
(declare-fun topo_T_9 () (_ BitVec 4))
(declare-fun final_x () (_ BitVec 32))
(declare-fun final_y () (_ BitVec 32))
(assert
 true)
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv3 2)))
(assert
 (bvult co_9 (_ bv3 2)))
(assert
 (and (distinct co_0 co_3 co_9) true))
(assert
 (bvult co_1 (_ bv3 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (bvult co_7 (_ bv3 2)))
(assert
 (and (distinct co_1 co_5 co_7) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_a (_ bv1 32)) read_t0_a)))
(assert
 (=> rf_9_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_2 rf_3_2 rf_9_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_5_4 (= (bvadd read_t0_b (_ bv2 32)) read_t0_b)))
(assert
 (=> rf_7_4 (= (bvadd read_t1_a (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_5_4 rf_7_4))
(assert
 (=> rf_1_6 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_5_6 (= (bvadd read_t0_b (_ bv2 32)) read_t1_a)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_6 rf_5_6 rf_7_6))
(assert
 (=> rf_0_8 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_8 (= (bvadd read_t0_a (_ bv1 32)) read_t1_b)))
(assert
 (=> rf_9_8 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_8 rf_3_8 rf_9_8))
(assert
 (let (($x1294 (bvult co_0 co_3)))
 (let (($x1242 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_9_2 (bvult co_9 co_0)))))
 (not (and $x1242 $x1294)))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (not (and $x263 false))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (not (and $x263 false))))
(assert
 (let (($x2018 (bvult co_9 co_3)))
 (let (($x1000 (or (and rf_0_2 (bvult co_0 co_9)) (and rf_3_2 (bvult co_3 co_9)) (and rf_9_2 (bvult co_9 co_9)))))
 (not (and $x1000 $x2018)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1651 false))))
(assert
 (let (($x591 (bvult co_1 co_7)))
 (let (($x1720 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (not (and $x1720 $x591)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (not (and $x1651 false))))
(assert
 (let (($x1432 (bvult co_5 co_7)))
 (let (($x1136 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (not (and $x1136 $x1432)))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (not (and $x720 false))))
(assert
 (let (($x1786 (bvult co_1 co_5)))
 (let (($x1272 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (not (and $x1272 $x1786)))))
(assert
 (let (($x1316 (bvult co_7 co_5)))
 (let (($x183 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (not (and $x183 $x1316)))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (not (and $x720 false))))
(assert
 (let (($x283 (bvult co_0 co_9)))
 (let (($x1741 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)) (and rf_9_8 (bvult co_9 co_0)))))
 (not (and $x1741 $x283)))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (not (and $x931 false))))
(assert
 (let (($x571 (bvult co_3 co_9)))
 (let (($x1075 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)) (and rf_9_8 (bvult co_9 co_3)))))
 (not (and $x1075 $x571)))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (not (and $x931 false))))
(assert
 (bvult topo_U_0 (_ bv10 4)))
(assert
 (bvult topo_U_1 (_ bv10 4)))
(assert
 (bvult topo_U_2 (_ bv10 4)))
(assert
 (bvult topo_U_3 (_ bv10 4)))
(assert
 (bvult topo_U_4 (_ bv10 4)))
(assert
 (bvult topo_U_5 (_ bv10 4)))
(assert
 (bvult topo_U_6 (_ bv10 4)))
(assert
 (bvult topo_U_7 (_ bv10 4)))
(assert
 (bvult topo_U_8 (_ bv10 4)))
(assert
 (bvult topo_U_9 (_ bv10 4)))
(assert
 (bvult topo_T_0 (_ bv10 4)))
(assert
 (bvult topo_T_1 (_ bv10 4)))
(assert
 (bvult topo_T_2 (_ bv10 4)))
(assert
 (bvult topo_T_3 (_ bv10 4)))
(assert
 (bvult topo_T_4 (_ bv10 4)))
(assert
 (bvult topo_T_5 (_ bv10 4)))
(assert
 (bvult topo_T_6 (_ bv10 4)))
(assert
 (bvult topo_T_7 (_ bv10 4)))
(assert
 (bvult topo_T_8 (_ bv10 4)))
(assert
 (bvult topo_T_9 (_ bv10 4)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (=> (or false false (bvult co_0 co_3) or) (bvult topo_U_0 topo_U_3)))
(assert
 (=> (or false false (bvult co_0 co_3) or (and true false)) (bvult topo_T_0 topo_T_3)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_0 topo_T_7)))))
(assert
 (=> (or false rf_0_8 false or) (bvult topo_U_0 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_0_8)) (bvult topo_T_0 topo_T_8)))
(assert
 (=> (or false false (bvult co_0 co_9) or) (bvult topo_U_0 topo_U_9)))
(assert
 (=> (or false false (bvult co_0 co_9) or (and true false)) (bvult topo_T_0 topo_T_9)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_1 topo_U_3))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_1 topo_T_3)))))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (=> (or false false (bvult co_1 co_7) or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false (bvult co_1 co_7) or (and true false)) (bvult topo_T_1 topo_T_7)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_1 topo_U_8))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_1 topo_T_8)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_1 topo_U_9))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_1 topo_T_9)))))
(assert
 (let (($x1242 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_9_2 (bvult co_9 co_0)))))
 (=> (or false false false $x1242) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x758 (and true false)))
 (let (($x1242 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_3_2 (bvult co_3 co_0)) (and rf_9_2 (bvult co_9 co_0)))))
 (=> (or false false false $x1242 $x758) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x758 (and true false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x1573 (or false false false $x263 $x758)))
 (=> $x1573 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x407 (and false false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (=> (or false false false $x263 $x407) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1235 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_9_2 (bvult co_9 co_3)))))
 (=> (or true false false $x1235) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x407 (and false false)))
 (let (($x1235 (or (and rf_0_2 (bvult co_0 co_3)) (and rf_3_2 (bvult co_3 co_3)) (and rf_9_2 (bvult co_9 co_3)))))
 (=> (or true false false $x1235 $x407) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x407 (and false false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x41 (or true false false $x263 $x407)))
 (=> $x41 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x407 (and false false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x41 (or true false false $x263 $x407)))
 (=> $x41 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x758 (and true false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x1573 (or false false false $x263 $x758)))
 (=> $x1573 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x758 (and true false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x1573 (or false false false $x263 $x758)))
 (=> $x1573 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x368 (or false false false $x263)))
 (=> $x368 (bvult topo_U_2 topo_U_8)))))
(assert
 (let (($x758 (and true false)))
 (let (($x263 (or (and rf_0_2 false) (and rf_3_2 false) (and rf_9_2 false))))
 (let (($x1573 (or false false false $x263 $x758)))
 (=> $x1573 (bvult topo_T_2 topo_T_8))))))
(assert
 (let (($x1000 (or (and rf_0_2 (bvult co_0 co_9)) (and rf_3_2 (bvult co_3 co_9)) (and rf_9_2 (bvult co_9 co_9)))))
 (=> (or false false false $x1000) (bvult topo_U_2 topo_U_9))))
(assert
 (let (($x758 (and true false)))
 (let (($x1000 (or (and rf_0_2 (bvult co_0 co_9)) (and rf_3_2 (bvult co_3 co_9)) (and rf_9_2 (bvult co_9 co_9)))))
 (=> (or false false false $x1000 $x758) (bvult topo_T_2 topo_T_9)))))
(assert
 (=> (or false false (bvult co_3 co_0) or) (bvult topo_U_3 topo_U_0)))
(assert
 (=> (or false false (bvult co_3 co_0) or (and true false)) (bvult topo_T_3 topo_T_0)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_3 topo_T_1)))))
(assert
 (=> (or false rf_3_2 false or) (bvult topo_U_3 topo_U_2)))
(assert
 (=> (or false false false or (and false rf_3_2)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x407 (and false false)))
 (let (($x2014 (or true false false or $x407)))
 (=> $x2014 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x407 (and false false)))
 (let (($x2014 (or true false false or $x407)))
 (=> $x2014 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_3 topo_T_7)))))
(assert
 (=> (or false rf_3_8 false or) (bvult topo_U_3 topo_U_8)))
(assert
 (=> (or false false false or (and true rf_3_8)) (bvult topo_T_3 topo_T_8)))
(assert
 (=> (or false false (bvult co_3 co_9) or) (bvult topo_U_3 topo_U_9)))
(assert
 (=> (or false false (bvult co_3 co_9) or (and true false)) (bvult topo_T_3 topo_T_9)))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x758 (and true false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1643 (or false false false $x720 $x758)))
 (=> $x1643 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x1272 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x1272) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x758 (and true false)))
 (let (($x1272 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_5_4 (bvult co_5 co_1)) (and rf_7_4 (bvult co_7 co_1)))))
 (=> (or false false false $x1272 $x758) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x407 (and false false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1909 (or false false false $x720 $x407)))
 (=> $x1909 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x407 (and false false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1909 (or false false false $x720 $x407)))
 (=> $x1909 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x407 (and false false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1909 (or false false false $x720 $x407)))
 (=> $x1909 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1360 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x1360) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x407 (and false false)))
 (let (($x1360 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_5_4 (bvult co_5 co_5)) (and rf_7_4 (bvult co_7 co_5)))))
 (=> (or true false false $x1360 $x407) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x758 (and true false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1643 (or false false false $x720 $x758)))
 (=> $x1643 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x183 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x183) (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x758 (and true false)))
 (let (($x183 (or (and rf_1_4 (bvult co_1 co_7)) (and rf_5_4 (bvult co_5 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x183 $x758) (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_8)))))
(assert
 (let (($x758 (and true false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1643 (or false false false $x720 $x758)))
 (=> $x1643 (bvult topo_T_4 topo_T_8))))))
(assert
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1893 (or false false false $x720)))
 (=> $x1893 (bvult topo_U_4 topo_U_9)))))
(assert
 (let (($x758 (and true false)))
 (let (($x720 (or (and rf_1_4 false) (and rf_5_4 false) (and rf_7_4 false))))
 (let (($x1643 (or false false false $x720 $x758)))
 (=> $x1643 (bvult topo_T_4 topo_T_9))))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x407 (and false false)))
 (let (($x220 (or false false false or $x407)))
 (=> $x220 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x407 (and false false)))
 (let (($x220 (or false false false or $x407)))
 (=> $x220 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (or false rf_5_6 false or) (bvult topo_U_5 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_5_6)) (bvult topo_T_5 topo_T_6)))
(assert
 (=> (or false false (bvult co_5 co_7) or) (bvult topo_U_5 topo_U_7)))
(assert
 (=> (or false false (bvult co_5 co_7) or (and true false)) (bvult topo_T_5 topo_T_7)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_5 topo_U_8))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_5 topo_T_8)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_5 topo_U_9))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_5 topo_T_9)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x758 (and true false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1800 (or false false false $x1651 $x758)))
 (=> $x1800 (bvult topo_T_6 topo_T_0))))))
(assert
 (let (($x1720 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1720) (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x758 (and true false)))
 (let (($x1720 (or (and rf_1_6 (bvult co_1 co_1)) (and rf_5_6 (bvult co_5 co_1)) (and rf_7_6 (bvult co_7 co_1)))))
 (=> (or false false false $x1720 $x758) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x758 (and true false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1800 (or false false false $x1651 $x758)))
 (=> $x1800 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x758 (and true false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1800 (or false false false $x1651 $x758)))
 (=> $x1800 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x758 (and true false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x1800 (or false false false $x1651 $x758)))
 (=> $x1800 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x1136 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1136) (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x758 (and true false)))
 (let (($x1136 (or (and rf_1_6 (bvult co_1 co_5)) (and rf_5_6 (bvult co_5 co_5)) (and rf_7_6 (bvult co_7 co_5)))))
 (=> (or false false false $x1136 $x758) (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x407 (and false false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (=> (or false false false $x1651 $x407) (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x1542 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1542) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x407 (and false false)))
 (let (($x1542 (or (and rf_1_6 (bvult co_1 co_7)) (and rf_5_6 (bvult co_5 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x1542 $x407) (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_8)))))
(assert
 (let (($x407 (and false false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x310 (or true false false $x1651 $x407)))
 (=> $x310 (bvult topo_T_6 topo_T_8))))))
(assert
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x2358 (or false false false $x1651)))
 (=> $x2358 (bvult topo_U_6 topo_U_9)))))
(assert
 (let (($x407 (and false false)))
 (let (($x1651 (or (and rf_1_6 false) (and rf_5_6 false) (and rf_7_6 false))))
 (let (($x310 (or true false false $x1651 $x407)))
 (=> $x310 (bvult topo_T_6 topo_T_9))))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_7 topo_U_0))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_7 topo_T_0)))))
(assert
 (=> (or false false (bvult co_7 co_1) or) (bvult topo_U_7 topo_U_1)))
(assert
 (=> (or false false (bvult co_7 co_1) or (and true false)) (bvult topo_T_7 topo_T_1)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_7 topo_T_3)))))
(assert
 (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert
 (=> (or false false (bvult co_7 co_5) or) (bvult topo_U_7 topo_U_5)))
(assert
 (=> (or false false (bvult co_7 co_5) or (and true false)) (bvult topo_T_7 topo_T_5)))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_7 topo_U_8))))
(assert
 (let (($x407 (and false false)))
 (let (($x2014 (or true false false or $x407)))
 (=> $x2014 (bvult topo_T_7 topo_T_8)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_7 topo_U_9))))
(assert
 (let (($x407 (and false false)))
 (let (($x2014 (or true false false or $x407)))
 (=> $x2014 (bvult topo_T_7 topo_T_9)))))
(assert
 (let (($x1741 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)) (and rf_9_8 (bvult co_9 co_0)))))
 (=> (or false false false $x1741) (bvult topo_U_8 topo_U_0))))
(assert
 (let (($x758 (and true false)))
 (let (($x1741 (or (and rf_0_8 (bvult co_0 co_0)) (and rf_3_8 (bvult co_3 co_0)) (and rf_9_8 (bvult co_9 co_0)))))
 (=> (or false false false $x1741 $x758) (bvult topo_T_8 topo_T_0)))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_1)))))
(assert
 (let (($x758 (and true false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2067 (or false false false $x931 $x758)))
 (=> $x2067 (bvult topo_T_8 topo_T_1))))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_2)))))
(assert
 (let (($x758 (and true false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2067 (or false false false $x931 $x758)))
 (=> $x2067 (bvult topo_T_8 topo_T_2))))))
(assert
 (let (($x1075 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)) (and rf_9_8 (bvult co_9 co_3)))))
 (=> (or false false false $x1075) (bvult topo_U_8 topo_U_3))))
(assert
 (let (($x758 (and true false)))
 (let (($x1075 (or (and rf_0_8 (bvult co_0 co_3)) (and rf_3_8 (bvult co_3 co_3)) (and rf_9_8 (bvult co_9 co_3)))))
 (=> (or false false false $x1075 $x758) (bvult topo_T_8 topo_T_3)))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_4)))))
(assert
 (let (($x758 (and true false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2067 (or false false false $x931 $x758)))
 (=> $x2067 (bvult topo_T_8 topo_T_4))))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_5)))))
(assert
 (let (($x758 (and true false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2067 (or false false false $x931 $x758)))
 (=> $x2067 (bvult topo_T_8 topo_T_5))))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_6)))))
(assert
 (let (($x407 (and false false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2010 (or false false false $x931 $x407)))
 (=> $x2010 (bvult topo_T_8 topo_T_6))))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_7)))))
(assert
 (let (($x407 (and false false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2010 (or false false false $x931 $x407)))
 (=> $x2010 (bvult topo_T_8 topo_T_7))))))
(assert
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x1639 (or false false false $x931)))
 (=> $x1639 (bvult topo_U_8 topo_U_8)))))
(assert
 (let (($x407 (and false false)))
 (let (($x931 (or (and rf_0_8 false) (and rf_3_8 false) (and rf_9_8 false))))
 (let (($x2010 (or false false false $x931 $x407)))
 (=> $x2010 (bvult topo_T_8 topo_T_8))))))
(assert
 (let (($x1191 (or (and rf_0_8 (bvult co_0 co_9)) (and rf_3_8 (bvult co_3 co_9)) (and rf_9_8 (bvult co_9 co_9)))))
 (=> (or true false false $x1191) (bvult topo_U_8 topo_U_9))))
(assert
 (let (($x407 (and false false)))
 (let (($x1191 (or (and rf_0_8 (bvult co_0 co_9)) (and rf_3_8 (bvult co_3 co_9)) (and rf_9_8 (bvult co_9 co_9)))))
 (=> (or true false false $x1191 $x407) (bvult topo_T_8 topo_T_9)))))
(assert
 (=> (or false false (bvult co_9 co_0) or) (bvult topo_U_9 topo_U_0)))
(assert
 (=> (or false false (bvult co_9 co_0) or (and true false)) (bvult topo_T_9 topo_T_0)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_9 topo_U_1))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_9 topo_T_1)))))
(assert
 (=> (or false rf_9_2 false or) (bvult topo_U_9 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_9_2)) (bvult topo_T_9 topo_T_2)))
(assert
 (=> (or false false (bvult co_9 co_3) or) (bvult topo_U_9 topo_U_3)))
(assert
 (=> (or false false (bvult co_9 co_3) or (and true false)) (bvult topo_T_9 topo_T_3)))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_9 topo_U_4))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_9 topo_T_4)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_9 topo_U_5))))
(assert
 (let (($x758 (and true false)))
 (let (($x798 (or false false false or $x758)))
 (=> $x798 (bvult topo_T_9 topo_T_5)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_9 topo_U_6))))
(assert
 (let (($x407 (and false false)))
 (let (($x220 (or false false false or $x407)))
 (=> $x220 (bvult topo_T_9 topo_T_6)))))
(assert
 (let (($x1676 (or false false false or)))
 (=> $x1676 (bvult topo_U_9 topo_U_7))))
(assert
 (let (($x407 (and false false)))
 (let (($x220 (or false false false or $x407)))
 (=> $x220 (bvult topo_T_9 topo_T_7)))))
(assert
 (=> (or false rf_9_8 false or) (bvult topo_U_9 topo_U_8)))
(assert
 (=> (or false false false or (and false rf_9_8)) (bvult topo_T_9 topo_T_8)))
(assert
 (=> (or false false (bvult co_9 co_9) or) (bvult topo_U_9 topo_U_9)))
(assert
 (=> (or false false (bvult co_9 co_9) or (and false false)) (bvult topo_T_9 topo_T_9)))
(assert
 (let (($x1969 (= co_0 (_ bv2 2))))
 (=> $x1969 (= (_ bv0 32) final_x))))
(assert
 (let (($x1890 (= co_3 (_ bv2 2))))
 (=> $x1890 (= final_x (bvadd read_t0_a (_ bv1 32))))))
(assert
 (let (($x1656 (= co_9 (_ bv2 2))))
 (=> $x1656 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (let (($x1875 (= co_1 (_ bv2 2))))
 (=> $x1875 (= (_ bv0 32) final_y))))
(assert
 (let (($x1973 (= co_5 (_ bv2 2))))
 (=> $x1973 (= final_y (bvadd read_t0_b (_ bv2 32))))))
(assert
 (let (($x1061 (= co_7 (_ bv2 2))))
(=> $x1061 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
