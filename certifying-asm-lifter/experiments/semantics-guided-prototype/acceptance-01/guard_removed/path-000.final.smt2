; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun read_always () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun final_x () (_ BitVec 32))
(declare-fun input_b () Bool)
(assert
 true)
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv2 2)))
(assert
 (and (distinct co_0 co_2) true))
(assert
 (let (($x261 (= (_ bv0 32) read_always)))
 (=> rf_0_1 $x261)))
(assert
 (=> rf_2_1 (= (bvadd read_always (_ bv1 32)) read_always)))
(assert
 ((_ pbeq 1 1 1) rf_0_1 rf_2_1))
(assert
 (=> rf_0_3 (= (_ bv0 32) read_other)))
(assert
 (=> rf_2_3 (= (bvadd read_always (_ bv1 32)) read_other)))
(assert
 ((_ pbeq 1 1 1) rf_0_3 rf_2_3))
(assert
 (let (($x97 (bvult co_0 co_2)))
 (let (($x744 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (not (and $x744 $x97)))))
(assert
 (bvult topo_U_0 (_ bv4 3)))
(assert
 (bvult topo_U_1 (_ bv4 3)))
(assert
 (bvult topo_U_2 (_ bv4 3)))
(assert
 (bvult topo_U_3 (_ bv4 3)))
(assert
 (bvult topo_T_0 (_ bv4 3)))
(assert
 (bvult topo_T_1 (_ bv4 3)))
(assert
 (bvult topo_T_2 (_ bv4 3)))
(assert
 (bvult topo_T_3 (_ bv4 3)))
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
 (let (($x744 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x744) (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x594 (and true false)))
 (let (($x744 (or (and rf_0_1 (bvult co_0 co_0)) (and rf_2_1 (bvult co_2 co_0)))))
 (=> (or false false false $x744 $x594) (bvult topo_T_1 topo_T_0)))))
(assert
 (let (($x757 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x1216 (or false false false $x757)))
 (=> $x1216 (bvult topo_U_1 topo_U_1)))))
(assert
 (let (($x893 (and false false)))
 (let (($x757 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x757 $x893) (bvult topo_T_1 topo_T_1)))))
(assert
 (let (($x1194 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x1194) (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x893 (and false false)))
 (let (($x1194 (or (and rf_0_1 (bvult co_0 co_2)) (and rf_2_1 (bvult co_2 co_2)))))
 (=> (or true false false $x1194 $x893) (bvult topo_T_1 topo_T_2)))))
(assert
 (let (($x757 (or (and rf_0_1 false) (and rf_2_1 false))))
 (let (($x1216 (or false false false $x757)))
 (=> $x1216 (bvult topo_U_1 topo_U_3)))))
(assert
 (let (($x594 (and true false)))
 (let (($x757 (or (and rf_0_1 false) (and rf_2_1 false))))
 (=> (or false false false $x757 $x594) (bvult topo_T_1 topo_T_3)))))
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
 (=> (or false rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert
 (let (($x268 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x268) (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x594 (and true false)))
 (let (($x268 (or (and rf_0_3 (bvult co_0 co_0)) (and rf_2_3 (bvult co_2 co_0)))))
 (=> (or false false false $x268 $x594) (bvult topo_T_3 topo_T_0)))))
(assert
 (let (($x363 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x170 (or false false false $x363)))
 (=> $x170 (bvult topo_U_3 topo_U_1)))))
(assert
 (let (($x594 (and true false)))
 (let (($x363 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x363 $x594) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x447 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x447) (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x594 (and true false)))
 (let (($x447 (or (and rf_0_3 (bvult co_0 co_2)) (and rf_2_3 (bvult co_2 co_2)))))
 (=> (or false false false $x447 $x594) (bvult topo_T_3 topo_T_2)))))
(assert
 (let (($x363 (or (and rf_0_3 false) (and rf_2_3 false))))
 (let (($x170 (or false false false $x363)))
 (=> $x170 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x893 (and false false)))
 (let (($x363 (or (and rf_0_3 false) (and rf_2_3 false))))
 (=> (or false false false $x363 $x893) (bvult topo_T_3 topo_T_3)))))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x965 (= co_2 (_ bv1 2))))
 (=> $x965 (= final_x (bvadd read_always (_ bv1 32))))))
(assert
 (let (($x721 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x284 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x411 (and (distinct rf_2_3 false) true)))
 (let (($x316 (and (distinct rf_0_3 true) true)))
 (let (($x1275 (and (distinct rf_2_1 false) true)))
 (let (($x785 (and (distinct rf_0_1 true) true)))
 (let (($x984 (and (distinct (_ bv0 32) read_other) true)))
 (let (($x1214 (and (distinct (_ bv0 32) read_always) true)))
 (let (($x128 (and (distinct input_b false) true)))
 (or $x128 $x1214 $x984 $x785 $x1275 $x316 $x411 $x284 $x721)))))))))))
(assert
 (let (($x721 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x284 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x778 (and (distinct rf_2_3 true) true)))
 (let (($x1204 (and (distinct rf_0_3 false) true)))
 (let (($x1275 (and (distinct rf_2_1 false) true)))
 (let (($x785 (and (distinct rf_0_1 true) true)))
 (let (($x401 (and (distinct (_ bv1 32) read_other) true)))
 (let (($x1214 (and (distinct (_ bv0 32) read_always) true)))
 (let (($x128 (and (distinct input_b false) true)))
 (or $x128 $x1214 $x401 $x785 $x1275 $x1204 $x778 $x284 $x721)))))))))))
(assert
 (let (($x721 (and (distinct (_ bv1 2) co_2) true)))
 (let (($x284 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x778 (and (distinct rf_2_3 true) true)))
 (let (($x1204 (and (distinct rf_0_3 false) true)))
 (let (($x1275 (and (distinct rf_2_1 false) true)))
 (let (($x785 (and (distinct rf_0_1 true) true)))
 (let (($x401 (and (distinct (_ bv1 32) read_other) true)))
 (let (($x1214 (and (distinct (_ bv0 32) read_always) true)))
 (let (($x833 (and (distinct input_b true) true)))
 (or $x833 $x1214 $x401 $x785 $x1275 $x1204 $x778 $x284 $x721)))))))))))
(assert
 (let (($x721 (and (distinct (_ bv1 2) co_2) true)))
(let (($x284 (and (distinct (_ bv0 2) co_0) true)))
(let (($x411 (and (distinct rf_2_3 false) true)))
(let (($x316 (and (distinct rf_0_3 true) true)))
(let (($x1275 (and (distinct rf_2_1 false) true)))
(let (($x785 (and (distinct rf_0_1 true) true)))
(let (($x984 (and (distinct (_ bv0 32) read_other) true)))
(let (($x1214 (and (distinct (_ bv0 32) read_always) true)))
(let (($x833 (and (distinct input_b true) true)))
(or $x833 $x1214 $x984 $x785 $x1275 $x316 $x411 $x284 $x721)))))))))))
(check-sat)
