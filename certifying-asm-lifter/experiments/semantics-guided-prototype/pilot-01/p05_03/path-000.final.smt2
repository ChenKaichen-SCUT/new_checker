; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
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
 (bvult co_4 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_4) true))
(assert
 (let (($x11 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x11)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_5))
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
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x495 (and true false)))
 (let (($x105 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x105 $x495) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x1529 (or false false false $x1387)))
 (=> $x1529 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x152 (or false false false $x1387 $x495)))
 (=> $x152 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x1529 (or false false false $x1387)))
 (=> $x1529 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x472 (and false false)))
 (let (($x1387 (or (and rf_0_2 false))))
 (=> (or false false false $x1387 $x472) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x1529 (or false false false $x1387)))
 (=> $x1529 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x472 (and false false)))
 (let (($x1387 (or (and rf_0_2 false))))
 (=> (or true false false $x1387 $x472) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x1529 (or false false false $x1387)))
 (=> $x1529 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x152 (or false false false $x1387 $x495)))
 (=> $x152 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x1529 (or false false false $x1387)))
 (=> $x1529 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1387 (or (and rf_0_2 false))))
 (let (($x152 (or false false false $x1387 $x495)))
 (=> $x152 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x472 (and false false)))
 (let (($x1756 (or false false false or $x472)))
 (=> $x1756 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false false (bvult co_3 co_4) or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false (bvult co_3 co_4) or (and true false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x495 (and true false)))
 (let (($x244 (or false false false or $x495)))
 (=> $x244 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false false (bvult co_4 co_3) or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false (bvult co_4 co_3) or (and true false)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x1454 (or false false false or)))
 (=> $x1454 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x472 (and false false)))
 (let (($x1756 (or false false false or $x472)))
 (=> $x1756 (bvult topo_T_4 topo_T_5)))))
(assert
 (=> (or false false false (or (and rf_0_5 (bvult co_0 co_0)))) (bvult topo_U_5 topo_U_0)))
(assert
 (let (($x495 (and true false)))
 (let (($x905 (or (and rf_0_5 (bvult co_0 co_0)))))
 (=> (or false false false $x905 $x495) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1457 (or false false false $x1399)))
 (=> $x1457 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1592 (or false false false $x1399 $x495)))
 (=> $x1592 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1457 (or false false false $x1399)))
 (=> $x1457 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1592 (or false false false $x1399 $x495)))
 (=> $x1592 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1457 (or false false false $x1399)))
 (=> $x1457 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x495 (and true false)))
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1592 (or false false false $x1399 $x495)))
 (=> $x1592 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1457 (or false false false $x1399)))
 (=> $x1457 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x472 (and false false)))
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x262 (or false false false $x1399 $x472)))
 (=> $x262 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x1457 (or false false false $x1399)))
 (=> $x1457 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x472 (and false false)))
 (let (($x1399 (or (and rf_0_5 false))))
 (let (($x262 (or false false false $x1399 $x472)))
 (=> $x262 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x157 (= co_0 (_ bv0 1))))
 (=> $x157 (= (_ bv0 32) final_x))))
(assert
 (=> (= co_1 (_ bv2 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x1505 (= (_ bv1 32) final_y)))
 (let (($x510 (= co_3 (_ bv2 2))))
 (=> $x510 $x1505))))
(assert
 (let (($x1505 (= (_ bv1 32) final_y)))
 (let (($x1782 (= co_4 (_ bv2 2))))
 (=> $x1782 $x1505))))
(assert
 (let (($x290 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x814 (and (distinct (_ bv2 2) co_3) true)))
 (let (($x1312 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1348 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1548 (and (distinct rf_0_5 true) true)))
 (let (($x424 (and (distinct rf_0_2 true) true)))
 (let (($x8 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x335 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x908 (and (distinct input_b false) true)))
 (or $x908 $x335 $x8 $x424 $x1548 $x1348 $x1312 $x814 $x290)))))))))))
(assert
 (let (($x1513 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x365 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1312 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1348 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1548 (and (distinct rf_0_5 true) true)))
 (let (($x424 (and (distinct rf_0_2 true) true)))
 (let (($x8 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x335 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x908 (and (distinct input_b false) true)))
 (or $x908 $x335 $x8 $x424 $x1548 $x1348 $x1312 $x365 $x1513)))))))))))
(assert
 (let (($x1513 (and (distinct (_ bv2 2) co_4) true)))
 (let (($x365 (and (distinct (_ bv1 2) co_3) true)))
 (let (($x1312 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x1348 (and (distinct (_ bv0 1) co_0) true)))
 (let (($x1548 (and (distinct rf_0_5 true) true)))
 (let (($x424 (and (distinct rf_0_2 true) true)))
 (let (($x8 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x335 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x974 (and (distinct input_b true) true)))
 (or $x974 $x335 $x8 $x424 $x1548 $x1348 $x1312 $x365 $x1513)))))))))))
(assert
 (let (($x290 (and (distinct (_ bv1 2) co_4) true)))
(let (($x814 (and (distinct (_ bv2 2) co_3) true)))
(let (($x1312 (and (distinct (_ bv0 2) co_1) true)))
(let (($x1348 (and (distinct (_ bv0 1) co_0) true)))
(let (($x1548 (and (distinct rf_0_5 true) true)))
(let (($x424 (and (distinct rf_0_2 true) true)))
(let (($x8 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x335 (and (distinct (_ bv0 32) read_t0_a) true)))
(let (($x974 (and (distinct input_b true) true)))
(or $x974 $x335 $x8 $x424 $x1548 $x1348 $x1312 $x814 $x290)))))))))))
(check-sat)
