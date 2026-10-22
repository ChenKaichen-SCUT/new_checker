; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
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
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv1 1)))
(assert
 (= co_0 (_ bv0 1)))
(assert
 (and true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_4 rf_3_4))
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
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x849 (and true false)))
 (let (($x1673 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x1673 $x849) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1711 (or false false false $x999)))
 (=> $x1711 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x849 (and true false)))
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1201 (or false false false $x999 $x849)))
 (=> $x1201 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1711 (or false false false $x999)))
 (=> $x1711 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x1083 (and false false)))
 (let (($x999 (or (and rf_0_2 false))))
 (=> (or false false false $x999 $x1083) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1711 (or false false false $x999)))
 (=> $x1711 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x1083 (and false false)))
 (let (($x999 (or (and rf_0_2 false))))
 (=> (or true false false $x999 $x1083) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1711 (or false false false $x999)))
 (=> $x1711 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x849 (and true false)))
 (let (($x999 (or (and rf_0_2 false))))
 (let (($x1201 (or false false false $x999 $x849)))
 (=> $x1201 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x849 (and true false)))
 (let (($x977 (or false false false or $x849)))
 (=> $x977 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x846 (or false false false or)))
 (=> $x846 (bvult topo_U_3 topo_U_2))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_3 topo_T_2)))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false rf_3_4 false or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_3_4)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1262 (or false false false $x1747)))
 (=> $x1262 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x849 (and true false)))
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x201 (or false false false $x1747 $x849)))
 (=> $x201 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x220 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x220) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x849 (and true false)))
 (let (($x220 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)))))
 (=> (or false false false $x220 $x849) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1262 (or false false false $x1747)))
 (=> $x1262 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x849 (and true false)))
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x201 (or false false false $x1747 $x849)))
 (=> $x201 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1501 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1501) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x849 (and true false)))
 (let (($x1501 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)))))
 (=> (or false false false $x1501 $x849) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (let (($x1262 (or false false false $x1747)))
 (=> $x1262 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x1083 (and false false)))
 (let (($x1747 (or (and rf_1_4 false) (and rf_3_4 false))))
 (=> (or false false false $x1747 $x1083) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x1733 (= (_ bv0 32) final_x)))
 (let (($x56 (= co_0 (_ bv0 1))))
 (=> $x56 $x1733))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x673 (= (_ bv1 32) final_y)))
 (let (($x1569 (= co_3 (_ bv1 2))))
 (=> $x1569 $x673))))
(assert
 (let (($x1457 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x115 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x312 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x109 (and (distinct rf_3_4 false) true)))
 (let (($x1782 (and (distinct rf_1_4 true) true)))
 (let (($x943 (and (distinct rf_0_2 true) true)))
 (let (($x1932 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1847 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1401 (and (distinct input_b false) true)))
 (or $x1401 $x1847 $x1932 $x943 $x1782 $x109 $x312 $x115 $x1457)))))))))))
(assert
 (let (($x1457 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x115 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x312 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1635 (and (distinct rf_3_4 true) true)))
 (let (($x1614 (and (distinct rf_1_4 false) true)))
 (let (($x943 (and (distinct rf_0_2 true) true)))
 (let (($x1165 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1847 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1401 (and (distinct input_b false) true)))
 (or $x1401 $x1847 $x1165 $x943 $x1614 $x1635 $x312 $x115 $x1457)))))))))))
(assert
 (let (($x1457 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x115 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x312 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1635 (and (distinct rf_3_4 true) true)))
 (let (($x1614 (and (distinct rf_1_4 false) true)))
 (let (($x943 (and (distinct rf_0_2 true) true)))
 (let (($x1165 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x1847 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1207 (and (distinct input_b true) true)))
 (or $x1207 $x1847 $x1165 $x943 $x1614 $x1635 $x312 $x115 $x1457)))))))))))
(assert
 (let (($x1457 (and (distinct (_ bv1 2) co_3) true)))
(let (($x115 (and (distinct (_ bv0 2) co_1) true)))
(let (($x312 (and (distinct (_ bv0 1) co_0) true)))
(let (($x109 (and (distinct rf_3_4 false) true)))
(let (($x1782 (and (distinct rf_1_4 true) true)))
(let (($x943 (and (distinct rf_0_2 true) true)))
(let (($x1932 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1847 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x1207 (and (distinct input_b true) true)))
(or $x1207 $x1847 $x1932 $x943 $x1782 $x109 $x312 $x115 $x1457)))))))))))
(check-sat)
