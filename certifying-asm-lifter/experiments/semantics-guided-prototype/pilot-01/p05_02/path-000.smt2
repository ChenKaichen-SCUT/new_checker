; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_4 () Bool)
(declare-fun rf_3_4 () Bool)
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
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_3 co_5) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_4 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_3_4 (= (_ bv1 32) read_t1_a)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_4 rf_3_4 rf_5_4))
(assert
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (not (and $x660 false))))
(assert
 (let (($x147 (bvult co_1 co_5)))
 (let (($x910 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (not (and $x910 $x147)))))
(assert
 (let (($x1172 (bvult co_3 co_5)))
 (let (($x715 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (not (and $x715 $x1172)))))
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
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false rf_1_4 false or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_1_4)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x783 (and true false)))
 (let (($x83 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x83 $x783) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x336 (or false false false $x1847)))
 (=> $x336 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x783 (and true false)))
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x636 (or false false false $x1847 $x783)))
 (=> $x636 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x336 (or false false false $x1847)))
 (=> $x336 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x481 (and false false)))
 (let (($x1847 (or (and rf_0_2 false))))
 (=> (or false false false $x1847 $x481) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x336 (or false false false $x1847)))
 (=> $x336 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x481 (and false false)))
 (let (($x1847 (or (and rf_0_2 false))))
 (=> (or true false false $x1847 $x481) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x336 (or false false false $x1847)))
 (=> $x336 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x783 (and true false)))
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x636 (or false false false $x1847 $x783)))
 (=> $x636 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x336 (or false false false $x1847)))
 (=> $x336 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x783 (and true false)))
 (let (($x1847 (or (and rf_0_2 false))))
 (let (($x636 (or false false false $x1847 $x783)))
 (=> $x636 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_3 topo_U_2))))
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
 (=> (or false false (bvult co_3 co_5) or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false (bvult co_3 co_5) or (and true false)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1520 (or false false false $x660)))
 (=> $x1520 (bvult topo_U_4 topo_U_0)))))
(assert
 (let (($x783 (and true false)))
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x495 (or false false false $x660 $x783)))
 (=> $x495 (bvult topo_T_4 topo_T_0))))))
(assert
 (let (($x910 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x910) (bvult topo_U_4 topo_U_1))))
(assert
 (let (($x783 (and true false)))
 (let (($x910 (or (and rf_1_4 (bvult co_1 co_1)) (and rf_3_4 (bvult co_3 co_1)) (and rf_5_4 (bvult co_5 co_1)))))
 (=> (or false false false $x910 $x783) (bvult topo_T_4 topo_T_1)))))
(assert
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1520 (or false false false $x660)))
 (=> $x1520 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x783 (and true false)))
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x495 (or false false false $x660 $x783)))
 (=> $x495 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x715 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x715) (bvult topo_U_4 topo_U_3))))
(assert
 (let (($x783 (and true false)))
 (let (($x715 (or (and rf_1_4 (bvult co_1 co_3)) (and rf_3_4 (bvult co_3 co_3)) (and rf_5_4 (bvult co_5 co_3)))))
 (=> (or false false false $x715 $x783) (bvult topo_T_4 topo_T_3)))))
(assert
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (let (($x1520 (or false false false $x660)))
 (=> $x1520 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x481 (and false false)))
 (let (($x660 (or (and rf_1_4 false) (and rf_3_4 false) (and rf_5_4 false))))
 (=> (or false false false $x660 $x481) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x269 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x269) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x481 (and false false)))
 (let (($x269 (or (and rf_1_4 (bvult co_1 co_5)) (and rf_3_4 (bvult co_3 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x269 $x481) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x1406 (or false false false or)))
 (=> $x1406 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x783 (and true false)))
 (let (($x1514 (or false false false or $x783)))
 (=> $x1514 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false false (bvult co_5 co_3) or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false (bvult co_5 co_3) or (and true false)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x727 (= co_0 (_ bv0 1))))
 (=> $x727 (= (_ bv0 32) final_x))))
(assert
 (let (($x338 (= co_1 (_ bv2 2))))
 (=> $x338 (= (_ bv0 32) final_y))))
(assert
 (let (($x496 (= co_3 (_ bv2 2))))
 (=> $x496 (= (_ bv1 32) final_y))))
(assert
 (let (($x1504 (= co_5 (_ bv2 2))))
(=> $x1504 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(check-sat)
