; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_5_2 () Bool)
(declare-fun rf_1_3 () Bool)
(declare-fun rf_0_4 () Bool)
(declare-fun rf_5_4 () Bool)
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
 (let (($x526 (= (_ bv0 32) read_t1_a)))
 (= $x526 true)))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_5 (_ bv2 2)))
(assert
 (and (distinct co_0 co_5) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_5_2 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_5_2))
(assert
 (let (($x526 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_3 $x526)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (let (($x572 (= (_ bv0 32) read_t1_yes)))
 (=> rf_0_4 $x572)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_5_4))
(assert
 (let (($x75 (bvult co_0 co_5)))
 (let (($x646 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (not (and $x646 $x75)))))
(assert
 (not (and (or (and rf_0_4 false) (and rf_5_4 false)) false)))
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
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x719 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x719) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x209 (and true false)))
 (let (($x719 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_5_2 (bvult co_5 co_0)))))
 (=> (or false false false $x719 $x209) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x987 (or false false false $x748)))
 (=> $x987 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x209 (and true false)))
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x976 (or false false false $x748 $x209)))
 (=> $x976 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x987 (or false false false $x748)))
 (=> $x987 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x484 (and false false)))
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (=> (or false false false $x748 $x484) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x987 (or false false false $x748)))
 (=> $x987 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x209 (and true false)))
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x976 (or false false false $x748 $x209)))
 (=> $x976 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x987 (or false false false $x748)))
 (=> $x987 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x209 (and true false)))
 (let (($x748 (or (and rf_0_2 false) (and rf_5_2 false))))
 (let (($x976 (or false false false $x748 $x209)))
 (=> $x976 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1100 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1100) (bvult topo_U_2 topo_U_5))))
(assert
 (let (($x209 (and true false)))
 (let (($x1100 (or (and rf_0_2 (bvult co_0 co_5)) (and rf_5_2 (bvult co_5 co_5)))))
 (=> (or false false false $x1100 $x209) (bvult topo_T_2 topo_T_5)))))
(assert
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x314 (or false false false $x43)))
 (=> $x314 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x209 (and true false)))
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x622 (or false false false $x43 $x209)))
 (=> $x622 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x209 (and true false)))
 (let (($x123 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x123 $x209) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x314 (or false false false $x43)))
 (=> $x314 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x209 (and true false)))
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x622 (or false false false $x43 $x209)))
 (=> $x622 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x314 (or false false false $x43)))
 (=> $x314 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x484 (and false false)))
 (let (($x43 (or (and rf_1_3 false))))
 (=> (or false false false $x43 $x484) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x314 (or false false false $x43)))
 (=> $x314 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x484 (and false false)))
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x333 (or true false false $x43 $x484)))
 (=> $x333 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x314 (or false false false $x43)))
 (=> $x314 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x484 (and false false)))
 (let (($x43 (or (and rf_1_3 false))))
 (let (($x333 (or true false false $x43 $x484)))
 (=> $x333 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x646 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x646) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x209 (and true false)))
 (let (($x646 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x646 $x209) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1097 (or false false false $x675)))
 (=> $x1097 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x209 (and true false)))
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x804 (or false false false $x675 $x209)))
 (=> $x804 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1097 (or false false false $x675)))
 (=> $x1097 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x209 (and true false)))
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x804 (or false false false $x675 $x209)))
 (=> $x804 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1097 (or false false false $x675)))
 (=> $x1097 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x484 (and false false)))
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1068 (or false false false $x675 $x484)))
 (=> $x1068 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1097 (or false false false $x675)))
 (=> $x1097 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x484 (and false false)))
 (let (($x675 (or (and rf_0_4 false) (and rf_5_4 false))))
 (let (($x1068 (or false false false $x675 $x484)))
 (=> $x1068 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1123 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1123) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x484 (and false false)))
 (let (($x1123 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x1123 $x484) (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x209 (and true false)))
 (let (($x280 (or false false false or $x209)))
 (=> $x280 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false rf_5_2 false or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_5_2)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x175 (or false false false or)))
 (=> $x175 (bvult topo_U_5 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1078 (= co_5 (_ bv1 2))))
 (=> $x1078 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x1117 (= (_ bv0 32) final_y)))
 (let (($x379 (= co_1 (_ bv0 1))))
 (=> $x379 $x1117))))
(assert
 (let (($x1133 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1030 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1050 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1066 (and (distinct rf_5_4 false) true)))
 (let (($x1049 (and (distinct rf_0_4 true) true)))
 (let (($x1026 (and (distinct rf_1_3 true) true)))
 (let (($x368 (and (distinct rf_5_2 true) true)))
 (let (($x1131 (and (distinct rf_0_2 false) true)))
 (let (($x1098 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1108 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1116 (and (distinct (_ bv1 32) read_t0_a) true)))
 (let (($x1136 (and (distinct input_b false) true)))
 (or $x1136 $x1116 $x1108 $x1098 $x1131 $x368 $x1026 $x1049 $x1066 $x1050 $x1030 $x1133))))))))))))))
(assert
 (let (($x1133 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1030 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1050 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1066 (and (distinct rf_5_4 false) true)))
 (let (($x1049 (and (distinct rf_0_4 true) true)))
 (let (($x1026 (and (distinct rf_1_3 true) true)))
 (let (($x567 (and (distinct rf_5_2 false) true)))
 (let (($x647 (and (distinct rf_0_2 true) true)))
 (let (($x1098 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1108 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x16 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1136 (and (distinct input_b false) true)))
 (or $x1136 $x16 $x1108 $x1098 $x647 $x567 $x1026 $x1049 $x1066 $x1050 $x1030 $x1133))))))))))))))
(assert
 (let (($x1133 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1030 (and (distinct (_ bv1 2) co_5) true)))
 (let (($x1050 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x1066 (and (distinct rf_5_4 false) true)))
 (let (($x1049 (and (distinct rf_0_4 true) true)))
 (let (($x1026 (and (distinct rf_1_3 true) true)))
 (let (($x567 (and (distinct rf_5_2 false) true)))
 (let (($x647 (and (distinct rf_0_2 true) true)))
 (let (($x1098 (and (distinct (_ bv0 32) read_t1_yes) true)))
 (let (($x1108 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x16 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x22 (and (distinct input_b true) true)))
 (or $x22 $x16 $x1108 $x1098 $x647 $x567 $x1026 $x1049 $x1066 $x1050 $x1030 $x1133))))))))))))))
(assert
 (let (($x1133 (and (distinct (_ bv0 1) co_1) true)))
(let (($x1030 (and (distinct (_ bv1 2) co_5) true)))
(let (($x1050 (and (distinct (_ bv0 2) co_0) true)))
(let (($x1066 (and (distinct rf_5_4 false) true)))
(let (($x1049 (and (distinct rf_0_4 true) true)))
(let (($x1026 (and (distinct rf_1_3 true) true)))
(let (($x368 (and (distinct rf_5_2 true) true)))
(let (($x1131 (and (distinct rf_0_2 false) true)))
(let (($x1098 (and (distinct (_ bv0 32) read_t1_yes) true)))
(let (($x1108 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x1116 (and (distinct (_ bv1 32) read_t0_a) true)))
(let (($x22 (and (distinct input_b true) true)))
(or $x22 $x1116 $x1108 $x1098 $x1131 $x368 $x1026 $x1049 $x1066 $x1050 $x1030 $x1133))))))))))))))
(check-sat)
