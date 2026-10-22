; benchmark generated from python API
(set-info :status unknown)
(declare-fun read_t0_a () (_ BitVec 32))
(declare-fun co_0 () (_ BitVec 1))
(declare-fun co_1 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun co_5 () (_ BitVec 2))
(declare-fun rf_0_2 () Bool)
(declare-fun read_t0_no () (_ BitVec 32))
(declare-fun rf_1_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun rf_5_3 () Bool)
(declare-fun read_t1_b () (_ BitVec 32))
(declare-fun rf_0_7 () Bool)
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
 (let (($x886 (= (_ bv0 32) read_t0_a)))
 (= $x886 false)))
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
 (bvult co_4 (_ bv3 2)))
(assert
 (bvult co_5 (_ bv3 2)))
(assert
 (and (distinct co_1 co_4 co_5) true))
(assert
 (let (($x886 (= (_ bv0 32) read_t0_a)))
 (=> rf_0_2 $x886)))
(assert
 ((_ pbeq 1 1) rf_0_2))
(assert
 (=> rf_1_3 (= (_ bv0 32) read_t0_no)))
(assert
 (=> rf_4_3 (= (bvadd read_t0_no (_ bv2 32)) read_t0_no)))
(assert
 (=> rf_5_3 (= (_ bv1 32) read_t0_no)))
(assert
 ((_ pbeq 1 1 1 1) rf_1_3 rf_4_3 rf_5_3))
(assert
 (=> rf_0_7 (= (_ bv0 32) read_t1_b)))
(assert
 ((_ pbeq 1 1) rf_0_7))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (not (and $x2316 false))))
(assert
 (let (($x510 (bvult co_1 co_4)))
 (let (($x175 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (not (and $x175 $x510)))))
(assert
 (let (($x1022 (bvult co_5 co_4)))
 (let (($x2189 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (not (and $x2189 $x1022)))))
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
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_0 topo_U_1))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_0 topo_T_1)))))
(assert
 (=> (or false rf_0_2 false or) (bvult topo_U_0 topo_U_2)))
(assert
 (=> (or false false false or (and true rf_0_2)) (bvult topo_T_0 topo_T_2)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_0 topo_U_3))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_0 topo_T_3)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_0 topo_U_4))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_0 topo_T_4)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_0 topo_U_5))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_0 topo_T_5)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_0 topo_U_6))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_0 topo_T_6)))))
(assert
 (=> (or false rf_0_7 false or) (bvult topo_U_0 topo_U_7)))
(assert
 (=> (or false false false or (and true rf_0_7)) (bvult topo_T_0 topo_T_7)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_1 topo_U_0))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_1 topo_T_0)))))
(assert
 (=> (or false false (bvult co_1 co_1) or) (bvult topo_U_1 topo_U_1)))
(assert
 (=> (or false false (bvult co_1 co_1) or (and false false)) (bvult topo_T_1 topo_T_1)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_1 topo_U_2))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_1 topo_T_2)))))
(assert
 (=> (or false rf_1_3 false or) (bvult topo_U_1 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_1_3)) (bvult topo_T_1 topo_T_3)))
(assert
 (=> (or false false (bvult co_1 co_4) or) (bvult topo_U_1 topo_U_4)))
(assert
 (=> (or false false (bvult co_1 co_4) or (and true false)) (bvult topo_T_1 topo_T_4)))
(assert
 (=> (or false false (bvult co_1 co_5) or) (bvult topo_U_1 topo_U_5)))
(assert
 (=> (or false false (bvult co_1 co_5) or (and true false)) (bvult topo_T_1 topo_T_5)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_1 topo_U_6))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_1 topo_T_6)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_1 topo_U_7))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_1 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_2 (bvult co_0 co_0)))) (bvult topo_U_2 topo_U_0)))
(assert
 (let (($x784 (and true false)))
 (let (($x688 (or (and rf_0_2 (bvult co_0 co_0)))))
 (=> (or false false false $x688 $x784) (bvult topo_T_2 topo_T_0)))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_1)))))
(assert
 (let (($x784 (and true false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x779 (or false false false $x1987 $x784)))
 (=> $x779 (bvult topo_T_2 topo_T_1))))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_2)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (=> (or false false false $x1987 $x2247) (bvult topo_T_2 topo_T_2)))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_3)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1905 (or true false false $x1987 $x2247)))
 (=> $x1905 (bvult topo_T_2 topo_T_3))))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_4)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1905 (or true false false $x1987 $x2247)))
 (=> $x1905 (bvult topo_T_2 topo_T_4))))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_5)))))
(assert
 (let (($x784 (and true false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x779 (or false false false $x1987 $x784)))
 (=> $x779 (bvult topo_T_2 topo_T_5))))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_6)))))
(assert
 (let (($x784 (and true false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x779 (or false false false $x1987 $x784)))
 (=> $x779 (bvult topo_T_2 topo_T_6))))))
(assert
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x1651 (or false false false $x1987)))
 (=> $x1651 (bvult topo_U_2 topo_U_7)))))
(assert
 (let (($x784 (and true false)))
 (let (($x1987 (or (and rf_0_2 false))))
 (let (($x779 (or false false false $x1987 $x784)))
 (=> $x779 (bvult topo_T_2 topo_T_7))))))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1192 (or false false false $x2316)))
 (=> $x1192 (bvult topo_U_3 topo_U_0)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x361 (or false false false $x2316 $x784)))
 (=> $x361 (bvult topo_T_3 topo_T_0))))))
(assert
 (let (($x175 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x175) (bvult topo_U_3 topo_U_1))))
(assert
 (let (($x784 (and true false)))
 (let (($x175 (or (and rf_1_3 (bvult co_1 co_1)) (and rf_4_3 (bvult co_4 co_1)) (and rf_5_3 (bvult co_5 co_1)))))
 (=> (or false false false $x175 $x784) (bvult topo_T_3 topo_T_1)))))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1192 (or false false false $x2316)))
 (=> $x1192 (bvult topo_U_3 topo_U_2)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1948 (or false false false $x2316 $x2247)))
 (=> $x1948 (bvult topo_T_3 topo_T_2))))))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1192 (or false false false $x2316)))
 (=> $x1192 (bvult topo_U_3 topo_U_3)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1948 (or false false false $x2316 $x2247)))
 (=> $x1948 (bvult topo_T_3 topo_T_3))))))
(assert
 (let (($x754 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x754) (bvult topo_U_3 topo_U_4))))
(assert
 (let (($x2247 (and false false)))
 (let (($x754 (or (and rf_1_3 (bvult co_1 co_4)) (and rf_4_3 (bvult co_4 co_4)) (and rf_5_3 (bvult co_5 co_4)))))
 (=> (or true false false $x754 $x2247) (bvult topo_T_3 topo_T_4)))))
(assert
 (let (($x2189 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x2189) (bvult topo_U_3 topo_U_5))))
(assert
 (let (($x784 (and true false)))
 (let (($x2189 (or (and rf_1_3 (bvult co_1 co_5)) (and rf_4_3 (bvult co_4 co_5)) (and rf_5_3 (bvult co_5 co_5)))))
 (=> (or false false false $x2189 $x784) (bvult topo_T_3 topo_T_5)))))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1192 (or false false false $x2316)))
 (=> $x1192 (bvult topo_U_3 topo_U_6)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x361 (or false false false $x2316 $x784)))
 (=> $x361 (bvult topo_T_3 topo_T_6))))))
(assert
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x1192 (or false false false $x2316)))
 (=> $x1192 (bvult topo_U_3 topo_U_7)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2316 (or (and rf_1_3 false) (and rf_4_3 false) (and rf_5_3 false))))
 (let (($x361 (or false false false $x2316 $x784)))
 (=> $x361 (bvult topo_T_3 topo_T_7))))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_4 topo_U_0))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_4 topo_T_0)))))
(assert
 (=> (or false false (bvult co_4 co_1) or) (bvult topo_U_4 topo_U_1)))
(assert
 (=> (or false false (bvult co_4 co_1) or (and true false)) (bvult topo_T_4 topo_T_1)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_4 topo_U_2))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1895 (or false false false or $x2247)))
 (=> $x1895 (bvult topo_T_4 topo_T_2)))))
(assert
 (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert
 (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert
 (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert
 (=> (or false false (bvult co_4 co_4) or (and false false)) (bvult topo_T_4 topo_T_4)))
(assert
 (=> (or false false (bvult co_4 co_5) or) (bvult topo_U_4 topo_U_5)))
(assert
 (=> (or false false (bvult co_4 co_5) or (and true false)) (bvult topo_T_4 topo_T_5)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_4 topo_U_6))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_4 topo_T_6)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_4 topo_U_7))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_4 topo_T_7)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_5 topo_U_0))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_5 topo_T_0)))))
(assert
 (=> (or false false (bvult co_5 co_1) or) (bvult topo_U_5 topo_U_1)))
(assert
 (=> (or false false (bvult co_5 co_1) or (and true false)) (bvult topo_T_5 topo_T_1)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_5 topo_U_2))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_5 topo_T_2)))))
(assert
 (=> (or false rf_5_3 false or) (bvult topo_U_5 topo_U_3)))
(assert
 (=> (or false false false or (and true rf_5_3)) (bvult topo_T_5 topo_T_3)))
(assert
 (=> (or false false (bvult co_5 co_4) or) (bvult topo_U_5 topo_U_4)))
(assert
 (=> (or false false (bvult co_5 co_4) or (and true false)) (bvult topo_T_5 topo_T_4)))
(assert
 (=> (or false false (bvult co_5 co_5) or) (bvult topo_U_5 topo_U_5)))
(assert
 (=> (or false false (bvult co_5 co_5) or (and false false)) (bvult topo_T_5 topo_T_5)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_5 topo_U_6))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1895 (or false false false or $x2247)))
 (=> $x1895 (bvult topo_T_5 topo_T_6)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_5 topo_U_7))))
(assert
 (=> (or false true false or (and false false)) (bvult topo_T_5 topo_T_7)))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_0))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_6 topo_T_0)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_1))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_6 topo_T_1)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_2))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_6 topo_T_2)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_3))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_6 topo_T_3)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_4))))
(assert
 (let (($x784 (and true false)))
 (let (($x1670 (or false false false or $x784)))
 (=> $x1670 (bvult topo_T_6 topo_T_4)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_5))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1895 (or false false false or $x2247)))
 (=> $x1895 (bvult topo_T_6 topo_T_5)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_6))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1895 (or false false false or $x2247)))
 (=> $x1895 (bvult topo_T_6 topo_T_6)))))
(assert
 (let (($x47 (or false false false or)))
 (=> $x47 (bvult topo_U_6 topo_U_7))))
(assert
 (let (($x2247 (and false false)))
 (let (($x1895 (or false false false or $x2247)))
 (=> $x1895 (bvult topo_T_6 topo_T_7)))))
(assert
 (=> (or false false false (or (and rf_0_7 (bvult co_0 co_0)))) (bvult topo_U_7 topo_U_0)))
(assert
 (let (($x784 (and true false)))
 (let (($x2327 (or (and rf_0_7 (bvult co_0 co_0)))))
 (=> (or false false false $x2327 $x784) (bvult topo_T_7 topo_T_0)))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_1)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2329 (or false false false $x2610 $x784)))
 (=> $x2329 (bvult topo_T_7 topo_T_1))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_2)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2329 (or false false false $x2610 $x784)))
 (=> $x2329 (bvult topo_T_7 topo_T_2))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_3)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2329 (or false false false $x2610 $x784)))
 (=> $x2329 (bvult topo_T_7 topo_T_3))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_4)))))
(assert
 (let (($x784 (and true false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2329 (or false false false $x2610 $x784)))
 (=> $x2329 (bvult topo_T_7 topo_T_4))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_5)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2207 (or false false false $x2610 $x2247)))
 (=> $x2207 (bvult topo_T_7 topo_T_5))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_6)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2207 (or false false false $x2610 $x2247)))
 (=> $x2207 (bvult topo_T_7 topo_T_6))))))
(assert
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2474 (or false false false $x2610)))
 (=> $x2474 (bvult topo_U_7 topo_U_7)))))
(assert
 (let (($x2247 (and false false)))
 (let (($x2610 (or (and rf_0_7 false))))
 (let (($x2207 (or false false false $x2610 $x2247)))
 (=> $x2207 (bvult topo_T_7 topo_T_7))))))
(assert
 (let (($x2692 (= co_0 (_ bv0 1))))
 (=> $x2692 (= (_ bv0 32) final_x))))
(assert
 (let (($x780 (= co_1 (_ bv2 2))))
 (=> $x780 (= (_ bv0 32) final_y))))
(assert
 (let (($x865 (= co_4 (_ bv2 2))))
 (=> $x865 (= final_y (bvadd read_t0_no (_ bv2 32))))))
(assert
 (let (($x720 (= co_5 (_ bv2 2))))
(=> $x720 (= (_ bv1 32) final_y))))
(check-sat)
