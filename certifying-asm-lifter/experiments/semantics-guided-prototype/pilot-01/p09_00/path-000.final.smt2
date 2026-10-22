; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_yes () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_5 () Bool)
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
(declare-fun final_y () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (let (($x2642 (= (_ bv0 32) read_t0_a)))
 (= $x2642 true)))
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
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (let (($x2642 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x2642)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (let (($x2175 (= (_ bv0 32) read_t0_yes)))
 (=> rf_1_3 $x2175)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_yes (_ bv1 32)) read_t0_yes)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_1_5 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_5 (= (bvadd read_t0_yes (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_4_5))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x1195 (bvult co_1 co_4)))
 (let (($x2415 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x2415 $x1195)))))
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
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_1 topo_T_2)))))
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
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x507 (and true false)))
 (let (($x460 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x460 $x507) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1647 (or false false false $x1409)))
 (=> $x1647 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x342 (or false false false $x1409 $x507)))
 (=> $x342 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1647 (or false false false $x1409)))
 (=> $x1647 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1409 (or (and rf_0_2 false))))
 (=> (or false false false $x1409 $x530) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1647 (or false false false $x1409)))
 (=> $x1647 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1216 (or true false false $x1409 $x530)))
 (=> $x1216 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1647 (or false false false $x1409)))
 (=> $x1647 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1216 (or true false false $x1409 $x530)))
 (=> $x1216 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x1647 (or false false false $x1409)))
 (=> $x1647 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1409 (or (and rf_0_2 false))))
 (let (($x342 (or false false false $x1409 $x507)))
 (=> $x342 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1271 (or false false false $x1965)))
 (=> $x1271 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1828 (or false false false $x1965 $x507)))
 (=> $x1828 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x2415 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x2415) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x507 (and true false)))
 (let (($x2415 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x2415 $x507) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1271 (or false false false $x1965)))
 (=> $x1271 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2284 (or false false false $x1965 $x530)))
 (=> $x2284 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1271 (or false false false $x1965)))
 (=> $x1271 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x2284 (or false false false $x1965 $x530)))
 (=> $x2284 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x2578 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x2578) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x530 (and false false)))
 (let (($x2578 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x2578 $x530) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1271 (or false false false $x1965)))
 (=> $x1271 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1965 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x1828 (or false false false $x1965 $x507)))
 (=> $x1828 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x507 (and true false)))
 (let (($x1677 (or false false false or $x507)))
 (=> $x1677 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x740 (or false false false or)))
 (=> $x740 (bvult topo_U_4 topo_U_2))))
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
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x475 (or false false false $x1998)))
 (=> $x475 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1281 (or false false false $x1998 $x507)))
 (=> $x1281 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1526 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x1526) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x507 (and true false)))
 (let (($x1526 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_4_5 (bvult co_4 co_1)))))
 (=> (or false false false $x1526 $x507) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x475 (or false false false $x1998)))
 (=> $x475 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1281 (or false false false $x1998 $x507)))
 (=> $x1281 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x475 (or false false false $x1998)))
 (=> $x475 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x507 (and true false)))
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x1281 (or false false false $x1998 $x507)))
 (=> $x1281 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1385 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1385) (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x507 (and true false)))
 (let (($x1385 (or (and rf_1_5 (bvult co_1 co_4)) (and rf_4_5 (bvult co_4 co_4)))))
 (=> (or false false false $x1385 $x507) (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (let (($x475 (or false false false $x1998)))
 (=> $x475 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x530 (and false false)))
 (let (($x1998 (or (and rf_1_5 false) (and rf_4_5 false))))
 (=> (or false false false $x1998 $x530) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x1735 (= co_0 (_ bv0 1))))
 (=> $x1735 (= (_ bv0 32) final_x))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1007 (= co_4 (_ bv1 2))))
 (=> $x1007 (= final_y (bvadd read_t0_yes (_ bv1 32))))))
(assert
 (let (($x1062 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x2253 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x982 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x87 (and (distinct rf_4_5 false) true)))
 (let (($x333 (and (distinct rf_1_5 true) true)))
 (let (($x295 (and (distinct rf_4_3 false) true)))
 (let (($x935 (and (distinct rf_1_3 true) true)))
 (let (($x75 (and (distinct rf_0_2 true) true)))
 (let (($x2492 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x389 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x2040 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x514 (and (distinct input_b false) true)))
 (or $x514 $x2040 $x389 $x2492 $x75 $x935 $x295 $x333 $x87 $x982 $x2253 $x1062))))))))))))))
(assert
 (let (($x1062 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x2253 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x982 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x813 (and (distinct rf_4_5 true) true)))
 (let (($x1096 (and (distinct rf_1_5 false) true)))
 (let (($x295 (and (distinct rf_4_3 false) true)))
 (let (($x935 (and (distinct rf_1_3 true) true)))
 (let (($x75 (and (distinct rf_0_2 true) true)))
 (let (($x672 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x389 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x2040 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x514 (and (distinct input_b false) true)))
 (or $x514 $x2040 $x389 $x672 $x75 $x935 $x295 $x1096 $x813 $x982 $x2253 $x1062))))))))))))))
(assert
 (let (($x1062 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x2253 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x982 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x813 (and (distinct rf_4_5 true) true)))
 (let (($x1096 (and (distinct rf_1_5 false) true)))
 (let (($x295 (and (distinct rf_4_3 false) true)))
 (let (($x935 (and (distinct rf_1_3 true) true)))
 (let (($x75 (and (distinct rf_0_2 true) true)))
 (let (($x672 (and (distinct (_ bv1 32) read_t1_a) true)))
 (let (($x389 (and (distinct (_ bv0 32) read_t0_yes) true)))
 (let (($x2040 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x2202 (and (distinct input_b true) true)))
 (or $x2202 $x2040 $x389 $x672 $x75 $x935 $x295 $x1096 $x813 $x982 $x2253 $x1062))))))))))))))
(assert
 (let (($x1062 (and (distinct (_ bv1 2) co_4) true)))
(let (($x2253 (and (distinct (_ bv0 2) co_1) true)))
(let (($x982 (and (distinct (_ bv0 1) co_0) true)))
(let (($x87 (and (distinct rf_4_5 false) true)))
(let (($x333 (and (distinct rf_1_5 true) true)))
(let (($x295 (and (distinct rf_4_3 false) true)))
(let (($x935 (and (distinct rf_1_3 true) true)))
(let (($x75 (and (distinct rf_0_2 true) true)))
(let (($x2492 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x389 (and (distinct (_ bv0 32) read_t0_yes) true)))
(let (($x2040 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x2202 (and (distinct input_b true) true)))
(or $x2202 $x2040 $x389 $x2492 $x75 $x935 $x295 $x333 $x87 $x982 $x2253 $x1062))))))))))))))
(check-sat)
