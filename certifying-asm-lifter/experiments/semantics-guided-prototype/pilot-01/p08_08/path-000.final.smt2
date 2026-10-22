; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_6_4 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_7 () Bool)
(declare-fun rf_3_7 () Bool)
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
 (= input_b true))
(assert
 (= input_b true))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_0 co_6) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_yes)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_6_4 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_6_4))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert
 (=> rf_1_7 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_3_7 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_1_7 rf_3_7))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1067 (bvult co_1 co_3)))
 (let (($x42 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (not (and $x42 $x1067)))))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x310 (bvult co_0 co_6)))
 (let (($x211 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x211 $x310)))))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
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
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_0 topo_U_7))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_0 topo_T_7)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false rf_1_7 false or) (bvult topo_U_1 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_1_7)) (bvult topo_T_1 topo_T_7)))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x20 (or false false false $x2281 $x624)))
 (=> $x20 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x42 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x42) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x624 (and true false)))
 (let (($x42 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x42 $x624) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or false false false $x2281 $x1198) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x652 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x652) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x1198 (and false false)))
 (let (($x652 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x652 $x1198) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or true false false $x2281 $x1198) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x20 (or false false false $x2281 $x624)))
 (=> $x20 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x20 (or false false false $x2281 $x624)))
 (=> $x20 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x1584 (or false false false $x2281)))
 (=> $x1584 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2281 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x20 (or false false false $x2281 $x624)))
 (=> $x20 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x1198 (and false false)))
 (let (($x277 (or true false false or $x1198)))
 (=> $x277 (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_3 topo_T_6)))))
(assert
 (=> (or false rf_3_7 false or) (bvult topo_U_3 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_3_7)) (bvult topo_T_3 topo_T_7)))
(assert
 (let (($x179 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_6_4 (bvult co_6 co_0)))))
 (=> (or false false false $x179) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x624 (and true false)))
 (let (($x179 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_6_4 (bvult co_6 co_0)))))
 (=> (or false false false $x179 $x624) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1758 (or false false false $x2041 $x624)))
 (=> $x1758 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1878 (or false false false $x2041 $x1198)))
 (=> $x1878 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1878 (or false false false $x2041 $x1198)))
 (=> $x1878 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1878 (or false false false $x2041 $x1198)))
 (=> $x1878 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1758 (or false false false $x2041 $x624)))
 (=> $x1758 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x852 (or (and rf_0_4 (bvult co_0 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x852) (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x624 (and true false)))
 (let (($x852 (or (and rf_0_4 (bvult co_0 co_6)) (and rf_6_4 (bvult co_6 co_6)))))
 (=> (or false false false $x852 $x624) (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x536 (or false false false $x2041)))
 (=> $x536 (bvult topo_U_4 topo_U_7)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2041 (or (and rf_0_4 false) (and rf_6_4 false))))
 (let (($x1758 (or false false false $x2041 $x624)))
 (=> $x1758 (bvult topo_T_4 topo_T_7))))))
(assert
 (let (($x211 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x211) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x624 (and true false)))
 (let (($x211 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x211 $x624) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x645 (or false false false $x2601 $x624)))
 (=> $x645 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x645 (or false false false $x2601 $x624)))
 (=> $x645 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x645 (or false false false $x2601 $x624)))
 (=> $x645 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x624 (and true false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x645 (or false false false $x2601 $x624)))
 (=> $x645 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (=> (or false false false $x2601 $x1198) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x26 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x26) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x1198 (and false false)))
 (let (($x26 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x26 $x1198) (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x2035 (or false false false $x2601)))
 (=> $x2035 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x2601 (or (and rf_0_5 false) (and rf_6_5 false))))
 (=> (or true false false $x2601 $x1198) (bvult topo_T_5 topo_T_7)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x624 (and true false)))
 (let (($x680 (or false false false or $x624)))
 (=> $x680 (bvult topo_T_6 topo_T_3)))))
(assert
 (=> (or false rf_6_4 false or) (bvult topo_U_6 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_6_4)) (bvult topo_T_6 topo_T_4)))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (let (($x1636 (or false false false or)))
 (=> $x1636 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x1198 (and false false)))
 (let (($x277 (or true false false or $x1198)))
 (=> $x277 (bvult topo_T_6 topo_T_7)))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_0)))))
(assert
 (let (($x624 (and true false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2203 (or false false false $x1548 $x624)))
 (=> $x2203 (bvult topo_T_7 topo_T_0))))))
(assert
 (let (($x29 (or (and rf_1_7 (bvult co_1 co_1)) (and rf_3_7 (bvult co_3 co_1)))))
 (=> (or false false false $x29) (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x624 (and true false)))
 (let (($x29 (or (and rf_1_7 (bvult co_1 co_1)) (and rf_3_7 (bvult co_3 co_1)))))
 (=> (or false false false $x29 $x624) (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x624 (and true false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2203 (or false false false $x1548 $x624)))
 (=> $x2203 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x1608 (or (and rf_1_7 (bvult co_1 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x1608) (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x624 (and true false)))
 (let (($x1608 (or (and rf_1_7 (bvult co_1 co_3)) (and rf_3_7 (bvult co_3 co_3)))))
 (=> (or false false false $x1608 $x624) (bvult topo_T_7 topo_T_3)))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x624 (and true false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2203 (or false false false $x1548 $x624)))
 (=> $x2203 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2469 (or false false false $x1548 $x1198)))
 (=> $x2469 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2469 (or false false false $x1548 $x1198)))
 (=> $x2469 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x1444 (or false false false $x1548)))
 (=> $x1444 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x1198 (and false false)))
 (let (($x1548 (or (and rf_1_7 false) (and rf_3_7 false))))
 (let (($x2469 (or false false false $x1548 $x1198)))
 (=> $x2469 (bvult topo_T_7 topo_T_7))))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1116 (= co_6 (_ bv1 2))))
 (=> $x1116 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1802 (= co_3 (_ bv1 2))))
 (=> $x1802 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x1074 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1464 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1186 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x284 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1875 (and (distinct rf_6_5 false) true)))
 (let (($x2457 (and (distinct rf_0_5 true) true)))
 (let (($x928 (and (distinct rf_6_4 true) true)))
 (let (($x1759 (and (distinct rf_0_4 false) true)))
 (let (($x402 (and (distinct rf_3_2 false) true)))
 (let (($x35 (and (distinct rf_1_2 true) true)))
 (let (($x411 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x577 (and (distinct (_ bv1 32) read_t0_b) true)))
 (let (($x1917 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x272 (and (distinct input_b true) true)))
 (or $x272 $x1917 $x577 $x411 (and (distinct (_ bv0 32) read_t1_b) true) $x35 $x402 $x1759 $x928 $x2457 $x1875 (and (distinct rf_1_7 true) true) (and (distinct rf_3_7 false) true) $x284 $x1186 $x1464 $x1074))))))))))))))))
(assert
 (let (($x1074 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1464 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1186 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x284 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1558 (and (distinct rf_3_7 true) true)))
 (let (($x1494 (and (distinct rf_1_7 false) true)))
 (let (($x1875 (and (distinct rf_6_5 false) true)))
 (let (($x2457 (and (distinct rf_0_5 true) true)))
 (let (($x402 (and (distinct rf_3_2 false) true)))
 (let (($x35 (and (distinct rf_1_2 true) true)))
 (let (($x364 (and (distinct (_ bv1 32) read_t1_b) true)))
 (let (($x411 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1917 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x272 (and (distinct input_b true) true)))
 (or $x272 $x1917 (and (distinct (_ bv0 32) read_t0_b) true) $x411 $x364 $x35 $x402 (and (distinct rf_0_4 true) true) (and (distinct rf_6_4 false) true) $x2457 $x1875 $x1494 $x1558 $x284 $x1186 $x1464 $x1074))))))))))))))))
(assert
 (let (($x1074 (and (distinct (_ bv1 2) co_3) true)))
(let (($x1464 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1186 (and (distinct (_ bv1 2) co_6) true)))
(let (($x284 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1558 (and (distinct rf_3_7 true) true)))
(let (($x1494 (and (distinct rf_1_7 false) true)))
(let (($x1875 (and (distinct rf_6_5 false) true)))
(let (($x2457 (and (distinct rf_0_5 true) true)))
(let (($x928 (and (distinct rf_6_4 true) true)))
(let (($x1759 (and (distinct rf_0_4 false) true)))
(let (($x402 (and (distinct rf_3_2 false) true)))
(let (($x35 (and (distinct rf_1_2 true) true)))
(let (($x364 (and (distinct (_ bv1 32) read_t1_b) true)))
(let (($x411 (and (distinct (_ bv0 32) read_t1_yes) true)))
(let (($x577 (and (distinct (_ bv1 32) read_t0_b) true)))
(let (($x1917 (and (distinct (_ bv0 32) read_t0_yes) true)))
(let (($x272 (and (distinct input_b true) true)))
(or $x272 $x1917 $x577 $x411 $x364 $x35 $x402 $x1759 $x928 $x2457 $x1875 $x1494 $x1558 $x284 $x1186 $x1464 $x1074)))))))))))))))))))
(check-sat)
