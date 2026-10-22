; benchmark generated from python API
(set-info :status unknown)
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_6 () Bool)
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
 (=> rf_0_2 (= (_ bv0 32) read_t0_a)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_6))
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
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false false (bvult co_1 co_3) or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false (bvult co_1 co_3) or (and true false)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_1 topo_T_5)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_1 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x884 (and true false)))
 (let (($x321 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x321 $x884) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x884 (and true false)))
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x212 (or false false false $x580 $x884)))
 (=> $x212 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x815 (and false false)))
 (let (($x580 (or (and rf_0_2 false))))
 (=> (or false false false $x580 $x815) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x815 (and false false)))
 (let (($x580 (or (and rf_0_2 false))))
 (=> (or true false false $x580 $x815) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x884 (and true false)))
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x212 (or false false false $x580 $x884)))
 (=> $x212 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x884 (and true false)))
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x212 (or false false false $x580 $x884)))
 (=> $x212 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x220 (or false false false $x580)))
 (=> $x220 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x884 (and true false)))
 (let (($x580 (or (and rf_0_2 false))))
 (let (($x212 (or false false false $x580 $x884)))
 (=> $x212 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_3 topo_T_0)))))
(assert
 (=> (or false false (bvult co_3 co_1) or) (bvult topo_U_3 topo_U_1)))
(assert
 (=> (or false false (bvult co_3 co_1) or (and true false)) (bvult topo_T_3 topo_T_1)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_3 topo_U_2))))
(assert
 (let (($x815 (and false false)))
 (let (($x1042 (or false false false or $x815)))
 (=> $x1042 (bvult topo_T_3 topo_T_2)))))
(assert
 (=> (or false false (bvult co_3 co_3) or) (bvult topo_U_3 topo_U_3)))
(assert
 (=> (or false false (bvult co_3 co_3) or (and false false)) (bvult topo_T_3 topo_T_3)))
(assert
 (=> (or false false (bvult co_3 co_4) or) (bvult topo_U_3 topo_U_4)))
(assert
 (=> (or false false (bvult co_3 co_4) or (and true false)) (bvult topo_T_3 topo_T_4)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false false (bvult co_4 co_3) or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false (bvult co_4 co_3) or (and true false)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x815 (and false false)))
 (let (($x1042 (or false false false or $x815)))
 (=> $x1042 (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_4 topo_U_6))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_4 topo_T_6)))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_5 topo_T_0)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_5 topo_T_2)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x884 (and true false)))
 (let (($x293 (or false false false or $x884)))
 (=> $x293 (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_4))))
(assert
 (let (($x815 (and false false)))
 (let (($x1042 (or false false false or $x815)))
 (=> $x1042 (bvult topo_T_5 topo_T_4)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_5))))
(assert
 (let (($x815 (and false false)))
 (let (($x1042 (or false false false or $x815)))
 (=> $x1042 (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x673 (or false false false or)))
 (=> $x673 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x815 (and false false)))
 (let (($x1042 (or false false false or $x815)))
 (=> $x1042 (bvult topo_T_5 topo_T_6)))))
(assert
 (=> (or false false false (or (and rf_0_6 (bvult co_0 co_0)))) (bvult topo_U_6 topo_U_0)))
(assert
 (let (($x884 (and true false)))
 (let (($x1009 (or (and rf_0_6 (bvult co_0 co_0)))))
 (=> (or false false false $x1009 $x884) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x884 (and true false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x817 (or false false false $x417 $x884)))
 (=> $x817 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x884 (and true false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x817 (or false false false $x417 $x884)))
 (=> $x817 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x884 (and true false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x817 (or false false false $x417 $x884)))
 (=> $x817 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x815 (and false false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x123 (or false false false $x417 $x815)))
 (=> $x123 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x815 (and false false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x123 (or false false false $x417 $x815)))
 (=> $x123 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x143 (or false false false $x417)))
 (=> $x143 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x815 (and false false)))
 (let (($x417 (or (and rf_0_6 false))))
 (let (($x123 (or false false false $x417 $x815)))
 (=> $x123 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x1782 (= co_0 (_ bv0 1))))
 (=> $x1782 (= (_ bv0 32) final_x))))
(assert
 (let (($x141 (= co_1 (_ bv2 2))))
 (=> $x141 (= (_ bv0 32) final_y))))
(assert
 (let (($x1192 (= (_ bv1 32) final_y)))
 (let (($x920 (= co_3 (_ bv2 2))))
 (=> $x920 $x1192))))
(assert
 (let (($x1192 (= (_ bv1 32) final_y)))
(let (($x1589 (= co_4 (_ bv2 2))))
(=> $x1589 $x1192))))
(check-sat)
