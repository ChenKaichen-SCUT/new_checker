; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 1))
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun rf_2_4 () Bool)
(declare-fun rf_5_4 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_1_6 () Bool)
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
 (= input_b true))
(assert
 (bvult co_0 (_ bv3 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_2 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_0 co_2 co_5) true))
(assert
 (bvult co_1 (_ bv1 1)))
(assert
 (= co_1 (_ bv0 1)))
(assert
 (and true))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_b)))
(assert
 ((_ pbeq 1 1) rf_1_3))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_2_4 (= (_ bv1 32) read_t1_yes)))
(assert
 (=> rf_5_4 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1 1) rf_0_4 rf_2_4 rf_5_4))
(assert
 (let (($x629 (= (_ bv0 32) read_t1_b)))
 (=> rf_1_6 $x629)))
(assert
 ((_ pbeq 1 1) rf_1_6))
(assert
 (let (($x523 (bvult co_0 co_5)))
 (let (($x809 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (not (and $x809 $x523)))))
(assert
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (not (and $x1085 false))))
(assert
 (let (($x1236 (bvult co_2 co_5)))
 (let (($x707 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (not (and $x707 $x1236)))))
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
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false (bvult co_0 co_2) or (and true false)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (=> (or false false (bvult co_0 co_5) or) (bvult topo_U_0 topo_U_5)))
(assert
 (=> (or false false (bvult co_0 co_5) or (and true false)) (bvult topo_T_0 topo_T_5)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_0 topo_T_6)))))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_1 topo_T_4)))))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_1 topo_U_5))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_1 topo_T_5)))))
(assert
 (=> (or false rf_1_6 false or) (bvult topo_U_1 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_1_6)) (bvult topo_T_1 topo_T_6)))
(assert
 (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert
 (=> (or false false (bvult co_2 co_0) or (and true false)) (bvult topo_T_2 topo_T_0)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_2 topo_T_1)))))
(assert
 (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert
 (=> (or false false (bvult co_2 co_2) or (and false false)) (bvult topo_T_2 topo_T_2)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_2 topo_U_3))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_2 topo_T_3)))
(assert
 (=> (or false rf_2_4 false or) (bvult topo_U_2 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_2_4)) (bvult topo_T_2 topo_T_4)))
(assert
 (=> (or false false (bvult co_2 co_5) or) (bvult topo_U_2 topo_U_5)))
(assert
 (=> (or false false (bvult co_2 co_5) or (and true false)) (bvult topo_T_2 topo_T_5)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_2 topo_U_6))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_2 topo_T_6)))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x197 (or false false false $x713 $x1320)))
 (=> $x197 (bvult topo_T_3 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_3 (bvult co_1 co_1)))) (bvult topo_U_3 topo_U_1)))
(assert
 (let (($x1320 (and true false)))
 (let (($x205 (or (and rf_1_3 (bvult co_1 co_1)))))
 (=> (or false false false $x205 $x1320) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x376 (and false false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x248 (or false false false $x713 $x376)))
 (=> $x248 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x376 (and false false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x248 (or false false false $x713 $x376)))
 (=> $x248 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_4)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x197 (or false false false $x713 $x1320)))
 (=> $x197 (bvult topo_T_3 topo_T_4))))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_5)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x197 (or false false false $x713 $x1320)))
 (=> $x197 (bvult topo_T_3 topo_T_5))))))
(assert
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x1347 (or false false false $x713)))
 (=> $x1347 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x713 (or (and rf_1_3 false))))
 (let (($x197 (or false false false $x713 $x1320)))
 (=> $x197 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x809 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x809) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1320 (and true false)))
 (let (($x809 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_2_4 (bvult co_2 co_0)) (and rf_5_4 (bvult co_5 co_0)))))
 (=> (or false false false $x809 $x1320) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1182 (or false false false $x1085)))
 (=> $x1182 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1628 (or false false false $x1085 $x1320)))
 (=> $x1628 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x707 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (=> (or false false false $x707) (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x1320 (and true false)))
 (let (($x707 (or (and rf_0_4 (bvult co_0 co_2)) (and rf_2_4 (bvult co_2 co_2)) (and rf_5_4 (bvult co_5 co_2)))))
 (=> (or false false false $x707 $x1320) (bvult topo_T_4 topo_T_2)))))
(assert
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1182 (or false false false $x1085)))
 (=> $x1182 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1628 (or false false false $x1085 $x1320)))
 (=> $x1628 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1182 (or false false false $x1085)))
 (=> $x1182 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x376 (and false false)))
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (=> (or false false false $x1085 $x376) (bvult topo_T_4 topo_T_4)))))
(assert
 (let (($x127 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_2_4 (bvult co_2 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x127) (bvult topo_U_4 topo_U_5))))
(assert
 (let (($x376 (and false false)))
 (let (($x127 (or (and rf_0_4 (bvult co_0 co_5)) (and rf_2_4 (bvult co_2 co_5)) (and rf_5_4 (bvult co_5 co_5)))))
 (=> (or true false false $x127 $x376) (bvult topo_T_4 topo_T_5)))))
(assert
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (let (($x1182 (or false false false $x1085)))
 (=> $x1182 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x376 (and false false)))
 (let (($x1085 (or (and rf_0_4 false) (and rf_2_4 false) (and rf_5_4 false))))
 (=> (or true false false $x1085 $x376) (bvult topo_T_4 topo_T_6)))))
(assert
 (=> (or false false (bvult co_5 co_0) or) (bvult topo_U_5 topo_U_0)))
(assert
 (=> (or false false (bvult co_5 co_0) or (and true false)) (bvult topo_T_5 topo_T_0)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_5 topo_T_1)))))
(assert
 (=> (or false false (bvult co_5 co_2) or) (bvult topo_U_5 topo_U_2)))
(assert
 (=> (or false false (bvult co_5 co_2) or (and true false)) (bvult topo_T_5 topo_T_2)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1320 (and true false)))
 (let (($x242 (or false false false or $x1320)))
 (=> $x242 (bvult topo_T_5 topo_T_3)))))
(assert
 (=> (or false rf_5_4 false or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false false or (and false rf_5_4)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x1593 (or false false false or)))
 (=> $x1593 (bvult topo_U_5 topo_U_6))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_5 topo_T_6)))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_0)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1664 (or false false false $x893 $x1320)))
 (=> $x1664 (bvult topo_T_6 topo_T_0))))))
(assert
 (=> (or false false false (or (and rf_1_6 (bvult co_1 co_1)))) (bvult topo_U_6 topo_U_1)))
(assert
 (let (($x1320 (and true false)))
 (let (($x1042 (or (and rf_1_6 (bvult co_1 co_1)))))
 (=> (or false false false $x1042 $x1320) (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1664 (or false false false $x893 $x1320)))
 (=> $x1664 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1320 (and true false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1664 (or false false false $x893 $x1320)))
 (=> $x1664 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x376 (and false false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x147 (or false false false $x893 $x376)))
 (=> $x147 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x376 (and false false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x147 (or false false false $x893 $x376)))
 (=> $x147 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x1310 (or false false false $x893)))
 (=> $x1310 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x376 (and false false)))
 (let (($x893 (or (and rf_1_6 false))))
 (let (($x147 (or false false false $x893 $x376)))
 (=> $x147 (bvult topo_T_6 topo_T_6))))))
(assert
 (=> (= co_0 (_ bv2 2)) (= (_ bv0 32) final_x)))
(assert
 (let (($x1651 (= co_2 (_ bv2 2))))
 (=> $x1651 (= (_ bv1 32) final_x))))
(assert
 (let (($x8 (= co_5 (_ bv2 2))))
 (=> $x8 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x1242 (= (_ bv0 32) final_y)))
 (let (($x418 (= co_1 (_ bv0 1))))
 (=> $x418 $x1242))))
(assert
 (let (($x475 (and (distinct (_ bv0 1) co_1) true)))
 (let (($x1692 (and (distinct (_ bv0 2) co_0) true)))
 (let (($x433 (and (distinct rf_1_6 true) true)))
 (let (($x1248 (and (distinct rf_5_4 false) true)))
 (let (($x759 (and (distinct rf_1_3 true) true)))
 (let (($x1300 (and (distinct (_ bv0 32) read_t1_b) true)))
 (let (($x1439 (and (distinct (_ bv0 32) read_t0_b) true)))
 (let (($x746 (and (distinct input_b true) true)))
 (or $x746 $x1439 (and (distinct (_ bv0 32) read_t1_yes) true) $x1300 $x759 (and (distinct rf_0_4 true) true) (and (distinct rf_2_4 false) true) $x1248 $x433 $x1692 (and (distinct (_ bv2 2) co_2) true) (and (distinct (_ bv1 2) co_5) true) $x475))))))))))
(assert
 (let (($x475 (and (distinct (_ bv0 1) co_1) true)))
(let (($x1692 (and (distinct (_ bv0 2) co_0) true)))
(let (($x433 (and (distinct rf_1_6 true) true)))
(let (($x1248 (and (distinct rf_5_4 false) true)))
(let (($x759 (and (distinct rf_1_3 true) true)))
(let (($x1300 (and (distinct (_ bv0 32) read_t1_b) true)))
(let (($x1439 (and (distinct (_ bv0 32) read_t0_b) true)))
(let (($x746 (and (distinct input_b true) true)))
(or $x746 $x1439 (and (distinct (_ bv1 32) read_t1_yes) true) $x1300 $x759 (and (distinct rf_0_4 false) true) (and (distinct rf_2_4 true) true) $x1248 $x433 $x1692 (and (distinct (_ bv1 2) co_2) true) (and (distinct (_ bv2 2) co_5) true) $x475))))))))))
(check-sat)
