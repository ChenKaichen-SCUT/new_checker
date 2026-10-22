; benchmark generated from python API
(set-info :status unknown)
(declare-fun input_b () Bool)
(declare-fun read_t1_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_7 () (_ BitVec 2))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_3 () (_ BitVec 2))
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_2 () Bool)
(declare-fun rf_3_2 () Bool)
(declare-fun read_t0_b () (_ BitVec 32))
(declare-fun rf_0_4 () Bool)
(declare-fun read_t1_yes () (_ BitVec 32))
(declare-fun rf_7_4 () Bool)
(declare-fun rf_1_5 () Bool)
(declare-fun rf_3_5 () Bool)
(declare-fun rf_0_6 () Bool)
(declare-fun rf_7_6 () Bool)
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
 (= input_b false))
(assert
 (let (($x2097 (= (_ bv0 32) read_t1_a)))
 (= $x2097 true)))
(assert
 (bvult co_0 (_ bv2 2)))
(assert
 (= co_0 (_ bv0 2)))
(assert
 (bvult co_7 (_ bv2 2)))
(assert
 (and (distinct co_0 co_7) true))
(assert
 (bvult co_1 (_ bv2 2)))
(assert
 (= co_1 (_ bv0 2)))
(assert
 (bvult co_3 (_ bv2 2)))
(assert
 (and (distinct co_1 co_3) true))
(assert
 (=> rf_1_2 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_3_2 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 ((_ pbeq 1 1 1) rf_1_2 rf_3_2))
(assert
 (=> rf_0_4 (= (_ bv0 32) read_t0_b)))
(assert
 (=> rf_7_4 (= (bvadd read_t1_yes (_ bv1 32)) read_t0_b)))
(assert
 ((_ pbeq 1 1 1) rf_0_4 rf_7_4))
(assert
 (let (($x2097 (= (_ bv0 32) read_t1_a)))
 (=> rf_1_5 $x2097)))
(assert
 (=> rf_3_5 (= (bvadd read_t0_no (_ bv2 32)) read_t1_a)))
(assert
 ((_ pbeq 1 1 1) rf_1_5 rf_3_5))
(assert
 (=> rf_0_6 (= (_ bv0 32) read_t1_yes)))
(assert
 (=> rf_7_6 (= (bvadd read_t1_yes (_ bv1 32)) read_t1_yes)))
(assert
 ((_ pbeq 1 1 1) rf_0_6 rf_7_6))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1898 (bvult co_1 co_3)))
 (let (($x191 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (not (and $x191 $x1898)))))
(assert
 (not (and (or (and rf_1_2 false) (and rf_3_2 false)) false)))
(assert
 (let (($x1636 (bvult co_0 co_7)))
 (let (($x740 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (not (and $x740 $x1636)))))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
(assert
 (not (and (or (and rf_0_6 false) (and rf_7_6 false)) false)))
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
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_0 topo_T_1)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_0 topo_U_2))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_0 topo_T_2)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_0 topo_T_3)))))
(assert
 (=> (or false rf_0_4 false or) (bvult topo_U_0 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_0_4)) (bvult topo_T_0 topo_T_4)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_0 topo_T_5)))))
(assert
 (=> (or false rf_0_6 false or) (bvult topo_U_0 topo_U_6)))
(assert
 (=> (or false false false or (and true rf_0_6)) (bvult topo_T_0 topo_T_6)))
(assert
 (=> (or false false (bvult co_0 co_7) or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false (bvult co_0 co_7) or (and true false)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_1 topo_T_0)))))
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
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_1 topo_U_4))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_1 topo_T_4)))))
(assert
 (=> (or false rf_1_5 false or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_1_5)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_1 topo_T_7)))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_0)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2241 (or false false false $x19 $x1758)))
 (=> $x2241 (bvult topo_T_2 topo_T_0))))))
(assert
 (let (($x191 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x191) (bvult topo_U_2 topo_U_1))))
(assert
 (let (($x1758 (and true false)))
 (let (($x191 (or (and rf_1_2 (bvult co_1 co_1)) (and rf_3_2 (bvult co_3 co_1)))))
 (=> (or false false false $x191 $x1758) (bvult topo_T_2 topo_T_1)))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x826 (and false false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or false false false $x19 $x826) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1828 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1828) (bvult topo_U_2 topo_U_3))))
(assert
 (let (($x826 (and false false)))
 (let (($x1828 (or (and rf_1_2 (bvult co_1 co_3)) (and rf_3_2 (bvult co_3 co_3)))))
 (=> (or true false false $x1828 $x826) (bvult topo_T_2 topo_T_3)))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x826 (and false false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (=> (or true false false $x19 $x826) (bvult topo_T_2 topo_T_4)))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2241 (or false false false $x19 $x1758)))
 (=> $x2241 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2241 (or false false false $x19 $x1758)))
 (=> $x2241 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x485 (or false false false $x19)))
 (=> $x485 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x19 (or (and rf_1_2 false) (and rf_3_2 false))))
 (let (($x2241 (or false false false $x19 $x1758)))
 (=> $x2241 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_3 topo_U_0))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_3 topo_T_0)))))
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
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_3 topo_U_4))))
(assert
 (=> (or true false false or (and false false)) (bvult topo_T_3 topo_T_4)))
(assert
 (=> (or false rf_3_5 false or) (bvult topo_U_3 topo_U_5)))
(assert
 (=> (or false false false or (and true rf_3_5)) (bvult topo_T_3 topo_T_5)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_3 topo_U_6))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_3 topo_T_6)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_3 topo_U_7))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_3 topo_T_7)))))
(assert
 (let (($x175 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_7_4 (bvult co_7 co_0)))))
 (=> (or false false false $x175) (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x1758 (and true false)))
 (let (($x175 (or (and rf_0_4 (bvult co_0 co_0)) (and rf_7_4 (bvult co_7 co_0)))))
 (=> (or false false false $x175 $x1758) (bvult topo_T_4 topo_T_0)))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_1)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x2919 (or false false false $x1751 $x1758)))
 (=> $x2919 (bvult topo_T_4 topo_T_1))))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_2)))))
(assert
 (let (($x826 (and false false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x766 (or false false false $x1751 $x826)))
 (=> $x766 (bvult topo_T_4 topo_T_2))))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_3)))))
(assert
 (let (($x826 (and false false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x766 (or false false false $x1751 $x826)))
 (=> $x766 (bvult topo_T_4 topo_T_3))))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_4)))))
(assert
 (let (($x826 (and false false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x766 (or false false false $x1751 $x826)))
 (=> $x766 (bvult topo_T_4 topo_T_4))))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_5)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x2919 (or false false false $x1751 $x1758)))
 (=> $x2919 (bvult topo_T_4 topo_T_5))))))
(assert
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x60 (or false false false $x1751)))
 (=> $x60 (bvult topo_U_4 topo_U_6)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1751 (or (and rf_0_4 false) (and rf_7_4 false))))
 (let (($x2919 (or false false false $x1751 $x1758)))
 (=> $x2919 (bvult topo_T_4 topo_T_6))))))
(assert
 (let (($x2574 (or (and rf_0_4 (bvult co_0 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x2574) (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2574 (or (and rf_0_4 (bvult co_0 co_7)) (and rf_7_4 (bvult co_7 co_7)))))
 (=> (or false false false $x2574 $x1758) (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_0)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1520 (or false false false $x335 $x1758)))
 (=> $x1520 (bvult topo_T_5 topo_T_0))))))
(assert
 (let (($x1155 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x1155) (bvult topo_U_5 topo_U_1))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1155 (or (and rf_1_5 (bvult co_1 co_1)) (and rf_3_5 (bvult co_3 co_1)))))
 (=> (or false false false $x1155 $x1758) (bvult topo_T_5 topo_T_1)))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_2)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1520 (or false false false $x335 $x1758)))
 (=> $x1520 (bvult topo_T_5 topo_T_2))))))
(assert
 (let (($x2451 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x2451) (bvult topo_U_5 topo_U_3))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2451 (or (and rf_1_5 (bvult co_1 co_3)) (and rf_3_5 (bvult co_3 co_3)))))
 (=> (or false false false $x2451 $x1758) (bvult topo_T_5 topo_T_3)))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_4)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1520 (or false false false $x335 $x1758)))
 (=> $x1520 (bvult topo_T_5 topo_T_4))))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_5)))))
(assert
 (let (($x826 (and false false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (=> (or false false false $x335 $x826) (bvult topo_T_5 topo_T_5)))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_6)))))
(assert
 (let (($x826 (and false false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2617 (or true false false $x335 $x826)))
 (=> $x2617 (bvult topo_T_5 topo_T_6))))))
(assert
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x1701 (or false false false $x335)))
 (=> $x1701 (bvult topo_U_5 topo_U_7)))))
(assert
 (let (($x826 (and false false)))
 (let (($x335 (or (and rf_1_5 false) (and rf_3_5 false))))
 (let (($x2617 (or true false false $x335 $x826)))
 (=> $x2617 (bvult topo_T_5 topo_T_7))))))
(assert
 (let (($x740 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x740) (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x1758 (and true false)))
 (let (($x740 (or (and rf_0_6 (bvult co_0 co_0)) (and rf_7_6 (bvult co_7 co_0)))))
 (=> (or false false false $x740 $x1758) (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_1)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x665 (or false false false $x2529 $x1758)))
 (=> $x665 (bvult topo_T_6 topo_T_1))))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_2)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x665 (or false false false $x2529 $x1758)))
 (=> $x665 (bvult topo_T_6 topo_T_2))))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_3)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x665 (or false false false $x2529 $x1758)))
 (=> $x665 (bvult topo_T_6 topo_T_3))))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_4)))))
(assert
 (let (($x1758 (and true false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x665 (or false false false $x2529 $x1758)))
 (=> $x665 (bvult topo_T_6 topo_T_4))))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_5)))))
(assert
 (let (($x826 (and false false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x2342 (or false false false $x2529 $x826)))
 (=> $x2342 (bvult topo_T_6 topo_T_5))))))
(assert
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x188 (or false false false $x2529)))
 (=> $x188 (bvult topo_U_6 topo_U_6)))))
(assert
 (let (($x826 (and false false)))
 (let (($x2529 (or (and rf_0_6 false) (and rf_7_6 false))))
 (let (($x2342 (or false false false $x2529 $x826)))
 (=> $x2342 (bvult topo_T_6 topo_T_6))))))
(assert
 (let (($x697 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x697) (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x826 (and false false)))
 (let (($x697 (or (and rf_0_6 (bvult co_0 co_7)) (and rf_7_6 (bvult co_7 co_7)))))
 (=> (or true false false $x697 $x826) (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false (bvult co_7 co_0) or) (bvult topo_U_7 topo_U_0)))
(assert
 (=> (or false false (bvult co_7 co_0) or (and true false)) (bvult topo_T_7 topo_T_0)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_7 topo_U_1))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_7 topo_T_1)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_7 topo_U_2))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_7 topo_T_2)))))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_7 topo_U_3))))
(assert
 (let (($x1758 (and true false)))
 (let (($x1262 (or false false false or $x1758)))
 (=> $x1262 (bvult topo_T_7 topo_T_3)))))
(assert
 (=> (or false rf_7_4 false or) (bvult topo_U_7 topo_U_4)))
(assert
 (=> (or false false false or (and true rf_7_4)) (bvult topo_T_7 topo_T_4)))
(assert
 (let (($x416 (or false false false or)))
 (=> $x416 (bvult topo_U_7 topo_U_5))))
(assert
 (=> (or false false false or (and false false)) (bvult topo_T_7 topo_T_5)))
(assert
 (=> (or false rf_7_6 false or) (bvult topo_U_7 topo_U_6)))
(assert
 (=> (or false false false or (and false rf_7_6)) (bvult topo_T_7 topo_T_6)))
(assert
 (=> (or false false (bvult co_7 co_7) or) (bvult topo_U_7 topo_U_7)))
(assert
 (=> (or false false (bvult co_7 co_7) or (and false false)) (bvult topo_T_7 topo_T_7)))
(assert
 (let (($x2069 (= co_0 (_ bv1 2))))
 (=> $x2069 (= (_ bv0 32) final_x))))
(assert
 (let (($x2147 (= co_7 (_ bv1 2))))
 (=> $x2147 (= final_x (bvadd read_t1_yes (_ bv1 32))))))
(assert
 (let (($x204 (= co_1 (_ bv1 2))))
 (=> $x204 (= (_ bv0 32) final_y))))
(assert
 (let (($x1629 (= co_3 (_ bv1 2))))
(=> $x1629 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(check-sat)
