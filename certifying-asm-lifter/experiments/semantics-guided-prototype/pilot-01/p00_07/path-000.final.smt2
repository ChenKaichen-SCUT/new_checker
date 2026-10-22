; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_6 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_6_2 () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_0_5 () Bool)
(declare-fun rf_6_5 () Bool)
(declare-fun topo_U_0 () (_ BitVec 3))
(declare-fun topo_U_1 () (_ BitVec 3))
(declare-fun topo_U_2 () (_ BitVec 3))
(declare-fun topo_U_3 () (_ BitVec 3))
(declare-fun topo_U_4 () (_ BitVec 3))
(declare-fun topo_U_5 () (_ BitVec 3))
(declare-fun topo_U_6 () (_ BitVec 3))
(declare-fun topo_T_0 () (_ BitVec 3))
(declare-fun topo_T_1 () (_ BitVec 3))
(declare-fun topo_T_2 () (_ BitVec 3))
(declare-fun topo_T_3 () (_ BitVec 3))
(declare-fun topo_T_4 () (_ BitVec 3))
(declare-fun topo_T_5 () (_ BitVec 3))
(declare-fun topo_T_6 () (_ BitVec 3))
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
 (bvult co_6 (_ bv2 2)))
(assert
 (and (distinct co_0 co_6) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_4 (_ bv2 2)))
(assert
 (and (distinct co_1 co_4) true))
(assert
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 (=> rf_6_2 (= (bvadd read_t1_b (_ bv2 32)) read_t0_a)))
(assert
 ((_ pbeq 1 1 1) rf_0_2 rf_6_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t1_a)))
(assert
 (=> rf_4_3 (= (bvadd read_t1_a (_ bv1 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_3 rf_4_3))
(assert
 (=> rf_0_5 (= (_ bv0 32) read_t1_b)))
(assert
 (=> rf_6_5 (= (bvadd read_t1_b (_ bv2 32)) read_t1_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_5 rf_6_5))
(assert
 (let (($x383 (bvult co_0 co_6)))
 (let (($x476 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (not (and $x476 $x383)))))
(assert
 (not (and (or (and rf_0_5 false) (and rf_6_5 false)) false)))
(assert
 (not (and (or (and rf_1_3 false) (and rf_4_3 false)) false)))
(assert
 (let (($x155 (bvult co_1 co_4)))
 (let (($x37 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (not (and $x37 $x155)))))
(assert
 (bvult topo_U_0 (_ bv7 3)))
(assert
 (bvult topo_U_1 (_ bv7 3)))
(assert
 (bvult topo_U_2 (_ bv7 3)))
(assert
 (bvult topo_U_3 (_ bv7 3)))
(assert
 (bvult topo_U_4 (_ bv7 3)))
(assert
 (bvult topo_U_5 (_ bv7 3)))
(assert
 (bvult topo_U_6 (_ bv7 3)))
(assert
 (bvult topo_T_0 (_ bv7 3)))
(assert
 (bvult topo_T_1 (_ bv7 3)))
(assert
 (bvult topo_T_2 (_ bv7 3)))
(assert
 (bvult topo_T_3 (_ bv7 3)))
(assert
 (bvult topo_T_4 (_ bv7 3)))
(assert
 (bvult topo_T_5 (_ bv7 3)))
(assert
 (bvult topo_T_6 (_ bv7 3)))
(assert
 (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert
 (=> (or false false (bvult co_0 co_0) or (and false false)) (bvult topo_T_0 topo_T_0)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_0 topo_T_4)))))
(assert
 (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert
 (=> (or false false (bvult co_0 co_6) or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false (bvult co_0 co_6) or (and true false)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x495 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x495) (bvult topo_U_2 topo_U_0))))
(assert
 (let (($x52 (and true false)))
 (let (($x495 (or (and rf_0_2 (bvult co_0 co_0)) (and rf_6_2 (bvult co_6 co_0)))))
 (=> (or false false false $x495 $x52) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x62 (or false false false $x511)))
 (=> $x62 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x52 (and true false)))
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x126 (or false false false $x511 $x52)))
 (=> $x126 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x62 (or false false false $x511)))
 (=> $x62 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x264 (and false false)))
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (=> (or false false false $x511 $x264) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x62 (or false false false $x511)))
 (=> $x62 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x52 (and true false)))
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x126 (or false false false $x511 $x52)))
 (=> $x126 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x62 (or false false false $x511)))
 (=> $x62 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x52 (and true false)))
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x126 (or false false false $x511 $x52)))
 (=> $x126 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x62 (or false false false $x511)))
 (=> $x62 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x52 (and true false)))
 (let (($x511 (or (and rf_0_2 false) (and rf_6_2 false))))
 (let (($x126 (or false false false $x511 $x52)))
 (=> $x126 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x412 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x412) (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x52 (and true false)))
 (let (($x412 (or (and rf_0_2 (bvult co_0 co_6)) (and rf_6_2 (bvult co_6 co_6)))))
 (=> (or false false false $x412 $x52) (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x150 (or false false false $x44)))
 (=> $x150 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x52 (and true false)))
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x315 (or false false false $x44 $x52)))
 (=> $x315 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x37 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x37) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x52 (and true false)))
 (let (($x37 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)))))
 (=> (or false false false $x37 $x52) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x150 (or false false false $x44)))
 (=> $x150 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x52 (and true false)))
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x315 (or false false false $x44 $x52)))
 (=> $x315 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x150 (or false false false $x44)))
 (=> $x150 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x264 (and false false)))
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (=> (or false false false $x44 $x264) (bvult topo_T_3 topo_T_3)))))
(assert
 (let (($x84 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x84) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x264 (and false false)))
 (let (($x84 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)))))
 (=> (or true false false $x84 $x264) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x150 (or false false false $x44)))
 (=> $x150 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x264 (and false false)))
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x332 (or true false false $x44 $x264)))
 (=> $x332 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x150 (or false false false $x44)))
 (=> $x150 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x264 (and false false)))
 (let (($x44 (or (and rf_1_3 false) (and rf_4_3 false))))
 (let (($x332 (or true false false $x44 $x264)))
 (=> $x332 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x264 (and false false)))
 (let (($x686 (or true false false or $x264)))
 (=> $x686 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x264 (and false false)))
 (let (($x686 (or true false false or $x264)))
 (=> $x686 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x476 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x476) (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x52 (and true false)))
 (let (($x476 (or (and rf_0_5 (bvult co_0 co_0)) (and rf_6_5 (bvult co_6 co_0)))))
 (=> (or false false false $x476 $x52) (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x725 (or false false false $x247)))
 (=> $x725 (bvult topo_U_5 topo_U_1)))))
(assert
 (let (($x52 (and true false)))
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x662 (or false false false $x247 $x52)))
 (=> $x662 (bvult topo_T_5 topo_T_1))))))
(assert
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x725 (or false false false $x247)))
 (=> $x725 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x52 (and true false)))
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x662 (or false false false $x247 $x52)))
 (=> $x662 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x725 (or false false false $x247)))
 (=> $x725 (bvult topo_U_5 topo_U_3)))))
(assert
 (let (($x264 (and false false)))
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x528 (or false false false $x247 $x264)))
 (=> $x528 (bvult topo_T_5 topo_T_3))))))
(assert
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x725 (or false false false $x247)))
 (=> $x725 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x264 (and false false)))
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x528 (or false false false $x247 $x264)))
 (=> $x528 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x725 (or false false false $x247)))
 (=> $x725 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x264 (and false false)))
 (let (($x247 (or (and rf_0_5 false) (and rf_6_5 false))))
 (let (($x528 (or false false false $x247 $x264)))
 (=> $x528 (bvult topo_T_5 topo_T_5))))))
(assert
 (let (($x509 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x509) (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x264 (and false false)))
 (let (($x509 (or (and rf_0_5 (bvult co_0 co_6)) (and rf_6_5 (bvult co_6 co_6)))))
 (=> (or true false false $x509 $x264) (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false (bvult co_6 co_0) or) (bvult topo_U_6 topo_U_0)))
(assert
 (=> (or false false (bvult co_6 co_0) or (and true false)) (bvult topo_T_6 topo_T_0)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x52 (and true false)))
 (let (($x91 (or false false false or $x52)))
 (=> $x91 (bvult topo_T_6 topo_T_1)))))
(assert
 (=> (or false rf_6_2 false or) (bvult topo_U_6 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_6_2)) (bvult topo_T_6 topo_T_2)))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x264 (and false false)))
 (let (($x489 (or false false false or $x264)))
 (=> $x489 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x420 (or false false false or)))
 (=> $x420 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x264 (and false false)))
 (let (($x489 (or false false false or $x264)))
 (=> $x489 (bvult topo_T_6 topo_T_4)))))
(assert
 (=> (or false rf_6_5 false or) (bvult topo_U_6 topo_U_5)))
(assert
 (=> (or false false false or (and false rf_6_5)) (bvult topo_T_6 topo_T_5)))
(assert
 (=> (or false false (bvult co_6 co_6) or) (bvult topo_U_6 topo_U_6)))
(assert
 (=> (or false false (bvult co_6 co_6) or (and false false)) (bvult topo_T_6 topo_T_6)))
(assert
 (=> (= co_0 (_ bv1 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x762 (= co_6 (_ bv1 2))))
 (=> $x762 (= final_x (bvadd read_t1_b (_ bv2 32))))))
(assert
 (=> (= co_1 (_ bv1 2)) (= (_ bv0 32) final_y)))
(assert
 (let (($x779 (= co_4 (_ bv1 2))))
 (=> $x779 (= final_y (bvadd read_t1_a (_ bv1 32))))))
(assert
 (let (($x807 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x794 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x813 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x809 (and (distinct rf_6_5 false) true)))
 (let (($x792 (and (distinct rf_0_5 true) true)))
 (let (($x795 (and (distinct rf_4_3 false) true)))
 (let (($x1097 (and (distinct rf_1_3 true) true)))
 (let (($x788 (and (distinct rf_6_2 true) true)))
 (let (($x791 (and (distinct rf_0_2 false) true)))
 (let (($x804 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x800 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x801 (and (distinct (_ bv2 32) read_t0_a) true)))
 (let (($x803 (and (distinct input_b false) true)))
 (or $x803 $x801 $x800 $x804 $x791 $x788 $x1097 $x795 $x792 $x809 $x813 $x794 $x806 $x807))))))))))))))))
(assert
 (let (($x807 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x794 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x813 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x809 (and (distinct rf_6_5 false) true)))
 (let (($x792 (and (distinct rf_0_5 true) true)))
 (let (($x795 (and (distinct rf_4_3 false) true)))
 (let (($x1097 (and (distinct rf_1_3 true) true)))
 (let (($x1173 (and (distinct rf_6_2 false) true)))
 (let (($x1179 (and (distinct rf_0_2 true) true)))
 (let (($x804 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x800 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1185 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x1176 (and (distinct input_b true) true)))
 (or $x1176 $x1185 $x800 $x804 $x1179 $x1173 $x1097 $x795 $x792 $x809 $x813 $x794 $x806 $x807))))))))))))))))
(assert
 (let (($x807 (and (distinct (_ bv1 2) co_4) true)))
 (let (($x806 (and (distinct (_ bv0 2) co_1) true)))
 (let (($x794 (and (distinct (_ bv1 2) co_6) true)))
 (let (($x813 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x809 (and (distinct rf_6_5 false) true)))
 (let (($x792 (and (distinct rf_0_5 true) true)))
 (let (($x795 (and (distinct rf_4_3 false) true)))
 (let (($x1097 (and (distinct rf_1_3 true) true)))
 (let (($x1173 (and (distinct rf_6_2 false) true)))
 (let (($x1179 (and (distinct rf_0_2 true) true)))
 (let (($x804 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x800 (and (distinct (_ bv0 32) read_t1_a) true)))
 (let (($x1185 (and (distinct (_ bv0 32) read_t0_a) true)))
 (let (($x803 (and (distinct input_b false) true)))
 (or $x803 $x1185 $x800 $x804 $x1179 $x1173 $x1097 $x795 $x792 $x809 $x813 $x794 $x806 $x807))))))))))))))))
(assert
 (let (($x807 (and (distinct (_ bv1 2) co_4) true)))
(let (($x806 (and (distinct (_ bv0 2) co_1) true)))
(let (($x794 (and (distinct (_ bv1 2) co_6) true)))
(let (($x813 (and (distinct (_ bv0 2) co_0) true)))
(let (($x809 (and (distinct rf_6_5 false) true)))
(let (($x792 (and (distinct rf_0_5 true) true)))
(let (($x795 (and (distinct rf_4_3 false) true)))
(let (($x1097 (and (distinct rf_1_3 true) true)))
(let (($x788 (and (distinct rf_6_2 true) true)))
(let (($x791 (and (distinct rf_0_2 false) true)))
(let (($x804 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x800 (and (distinct (_ bv0 32) read_t1_a) true)))
(let (($x801 (and (distinct (_ bv2 32) read_t0_a) true)))
(let (($x1176 (and (distinct input_b true) true)))
(or $x1176 $x801 $x800 $x804 $x791 $x788 $x1097 $x795 $x792 $x809 $x813 $x794 $x806 $x807))))))))))))))))
(check-sat)
