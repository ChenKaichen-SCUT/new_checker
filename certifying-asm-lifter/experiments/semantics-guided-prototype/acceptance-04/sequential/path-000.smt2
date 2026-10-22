(declare-fun co_0 () (_ BitVec 2))
(declare-fun co_2 () (_ BitVec 2))
(declare-fun co_4 () (_ BitVec 2))
(declare-fun read_a () (_ BitVec 32))
(declare-fun rf_0_1 () Bool)
(declare-fun rf_2_1 () Bool)
(declare-fun read_b () (_ BitVec 32))
(declare-fun rf_4_1 () Bool)
(declare-fun rf_0_3 () Bool)
(declare-fun rf_2_3 () Bool)
(declare-fun rf_4_3 () Bool)
(declare-fun read_other () (_ BitVec 32))
(declare-fun rf_0_5 () Bool)
(declare-fun rf_2_5 () Bool)
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
(assert true)
(assert (bvult co_0 #b11))
(assert (= co_0 #b00))
(assert (bvult co_2 #b11))
(assert (bvult co_4 #b11))
(assert (distinct co_0 co_2 co_4))
(assert (=> rf_0_1 (= #x00000000 read_a)))
(assert (=> rf_2_1 (= (bvadd read_a #x00000001) read_a)))
(assert (=> rf_4_1 (= (bvadd read_b #x00000001) read_a)))
(assert ((_ pbeq 1 1 1 1) rf_0_1 rf_2_1 rf_4_1))
(assert (=> rf_0_3 (= #x00000000 read_b)))
(assert (=> rf_2_3 (= (bvadd read_a #x00000001) read_b)))
(assert (=> rf_4_3 (= (bvadd read_b #x00000001) read_b)))
(assert ((_ pbeq 1 1 1 1) rf_0_3 rf_2_3 rf_4_3))
(assert (=> rf_0_5 (= #x00000000 read_other)))
(assert (=> rf_2_5 (= (bvadd read_a #x00000001) read_other)))
(assert (=> rf_4_5 (= (bvadd read_b #x00000001) read_other)))
(assert ((_ pbeq 1 1 1 1) rf_0_5 rf_2_5 rf_4_5))
(assert (let ((a!1 (and (or (and rf_0_1 (bvult co_0 co_0))
                    (and rf_2_1 (bvult co_2 co_0))
                    (and rf_4_1 (bvult co_4 co_0)))
                (bvult co_0 co_2))))
  (not a!1)))
(assert (let ((a!1 (and (or (and rf_0_3 (bvult co_0 co_0))
                    (and rf_2_3 (bvult co_2 co_0))
                    (and rf_4_3 (bvult co_4 co_0)))
                (bvult co_0 co_4))))
  (not a!1)))
(assert (bvult topo_U_0 #b110))
(assert (bvult topo_U_1 #b110))
(assert (bvult topo_U_2 #b110))
(assert (bvult topo_U_3 #b110))
(assert (bvult topo_U_4 #b110))
(assert (bvult topo_U_5 #b110))
(assert (bvult topo_T_0 #b110))
(assert (bvult topo_T_1 #b110))
(assert (bvult topo_T_2 #b110))
(assert (bvult topo_T_3 #b110))
(assert (bvult topo_T_4 #b110))
(assert (bvult topo_T_5 #b110))
(assert (=> (or false false (bvult co_0 co_0) or) (bvult topo_U_0 topo_U_0)))
(assert (=> (or false false (bvult co_0 co_0) or (and false false))
    (bvult topo_T_0 topo_T_0)))
(assert (=> (or false rf_0_1 false or) (bvult topo_U_0 topo_U_1)))
(assert (=> (or false false false or (and true rf_0_1)) (bvult topo_T_0 topo_T_1)))
(assert (=> (or false false (bvult co_0 co_2) or) (bvult topo_U_0 topo_U_2)))
(assert (=> (or false false (bvult co_0 co_2) or (and true false))
    (bvult topo_T_0 topo_T_2)))
(assert (=> (or false rf_0_3 false or) (bvult topo_U_0 topo_U_3)))
(assert (=> (or false false false or (and true rf_0_3)) (bvult topo_T_0 topo_T_3)))
(assert (=> (or false false (bvult co_0 co_4) or) (bvult topo_U_0 topo_U_4)))
(assert (=> (or false false (bvult co_0 co_4) or (and true false))
    (bvult topo_T_0 topo_T_4)))
(assert (=> (or false rf_0_5 false or) (bvult topo_U_0 topo_U_5)))
(assert (=> (or false false false or (and true rf_0_5)) (bvult topo_T_0 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_1 (bvult co_0 co_0))
        (and rf_2_1 (bvult co_2 co_0))
        (and rf_4_1 (bvult co_4 co_0)))
    (bvult topo_U_1 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_1 (bvult co_0 co_0))
        (and rf_2_1 (bvult co_2 co_0))
        (and rf_4_1 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_1 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false))
    (bvult topo_U_1 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false)
        (and false false))
    (bvult topo_T_1 topo_T_1)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_2))
        (and rf_2_1 (bvult co_2 co_2))
        (and rf_4_1 (bvult co_4 co_2)))
    (bvult topo_U_1 topo_U_2)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_2))
        (and rf_2_1 (bvult co_2 co_2))
        (and rf_4_1 (bvult co_4 co_2))
        (and false false))
    (bvult topo_T_1 topo_T_2)))
(assert (=> (or true
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false))
    (bvult topo_U_1 topo_U_3)))
(assert (=> (or true
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false)
        (and false false))
    (bvult topo_T_1 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_4))
        (and rf_2_1 (bvult co_2 co_4))
        (and rf_4_1 (bvult co_4 co_4)))
    (bvult topo_U_1 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_1 (bvult co_0 co_4))
        (and rf_2_1 (bvult co_2 co_4))
        (and rf_4_1 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_1 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false))
    (bvult topo_U_1 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_1 false)
        (and rf_2_1 false)
        (and rf_4_1 false)
        (and true false))
    (bvult topo_T_1 topo_T_5)))
(assert (=> (or false false (bvult co_2 co_0) or) (bvult topo_U_2 topo_U_0)))
(assert (=> (or false false (bvult co_2 co_0) or (and true false))
    (bvult topo_T_2 topo_T_0)))
(assert (=> (or false rf_2_1 false or) (bvult topo_U_2 topo_U_1)))
(assert (=> (or false false false or (and false rf_2_1)) (bvult topo_T_2 topo_T_1)))
(assert (=> (or false false (bvult co_2 co_2) or) (bvult topo_U_2 topo_U_2)))
(assert (=> (or false false (bvult co_2 co_2) or (and false false))
    (bvult topo_T_2 topo_T_2)))
(assert (=> (or true rf_2_3 false or) (bvult topo_U_2 topo_U_3)))
(assert (=> (or true false false or (and false rf_2_3)) (bvult topo_T_2 topo_T_3)))
(assert (=> (or true false (bvult co_2 co_4) or) (bvult topo_U_2 topo_U_4)))
(assert (=> (or true false (bvult co_2 co_4) or (and false false))
    (bvult topo_T_2 topo_T_4)))
(assert (=> (or false rf_2_5 false or) (bvult topo_U_2 topo_U_5)))
(assert (=> (or false false false or (and true rf_2_5)) (bvult topo_T_2 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0))
        (and rf_4_3 (bvult co_4 co_0)))
    (bvult topo_U_3 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_0))
        (and rf_2_3 (bvult co_2 co_0))
        (and rf_4_3 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_3 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2)))
    (bvult topo_U_3 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 (bvult co_0 co_2))
        (and rf_2_3 (bvult co_2 co_2))
        (and rf_4_3 (bvult co_4 co_2))
        (and false false))
    (bvult topo_T_3 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and false false))
    (bvult topo_T_3 topo_T_3)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4)))
    (bvult topo_U_3 topo_U_4)))
(assert (=> (or true
        false
        false
        (and rf_0_3 (bvult co_0 co_4))
        (and rf_2_3 (bvult co_2 co_4))
        (and rf_4_3 (bvult co_4 co_4))
        (and false false))
    (bvult topo_T_3 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false))
    (bvult topo_U_3 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_3 false)
        (and rf_2_3 false)
        (and rf_4_3 false)
        (and true false))
    (bvult topo_T_3 topo_T_5)))
(assert (=> (or false false (bvult co_4 co_0) or) (bvult topo_U_4 topo_U_0)))
(assert (=> (or false false (bvult co_4 co_0) or (and true false))
    (bvult topo_T_4 topo_T_0)))
(assert (=> (or false rf_4_1 false or) (bvult topo_U_4 topo_U_1)))
(assert (=> (or false false false or (and false rf_4_1)) (bvult topo_T_4 topo_T_1)))
(assert (=> (or false false (bvult co_4 co_2) or) (bvult topo_U_4 topo_U_2)))
(assert (=> (or false false (bvult co_4 co_2) or (and false false))
    (bvult topo_T_4 topo_T_2)))
(assert (=> (or false rf_4_3 false or) (bvult topo_U_4 topo_U_3)))
(assert (=> (or false false false or (and false rf_4_3)) (bvult topo_T_4 topo_T_3)))
(assert (=> (or false false (bvult co_4 co_4) or) (bvult topo_U_4 topo_U_4)))
(assert (=> (or false false (bvult co_4 co_4) or (and false false))
    (bvult topo_T_4 topo_T_4)))
(assert (=> (or false rf_4_5 false or) (bvult topo_U_4 topo_U_5)))
(assert (=> (or false false false or (and true rf_4_5)) (bvult topo_T_4 topo_T_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_4_5 (bvult co_4 co_0)))
    (bvult topo_U_5 topo_U_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_0))
        (and rf_2_5 (bvult co_2 co_0))
        (and rf_4_5 (bvult co_4 co_0))
        (and true false))
    (bvult topo_T_5 topo_T_0)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_1)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_4_5 (bvult co_4 co_2)))
    (bvult topo_U_5 topo_U_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_2))
        (and rf_2_5 (bvult co_2 co_2))
        (and rf_4_5 (bvult co_4 co_2))
        (and true false))
    (bvult topo_T_5 topo_T_2)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and true false))
    (bvult topo_T_5 topo_T_3)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_2_5 (bvult co_2 co_4))
        (and rf_4_5 (bvult co_4 co_4)))
    (bvult topo_U_5 topo_U_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 (bvult co_0 co_4))
        (and rf_2_5 (bvult co_2 co_4))
        (and rf_4_5 (bvult co_4 co_4))
        (and true false))
    (bvult topo_T_5 topo_T_4)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false))
    (bvult topo_U_5 topo_U_5)))
(assert (=> (or false
        false
        false
        (and rf_0_5 false)
        (and rf_2_5 false)
        (and rf_4_5 false)
        (and false false))
    (bvult topo_T_5 topo_T_5)))
(assert (=> (= co_0 #b10) (= #x00000000 final_x)))
(assert (=> (= co_2 #b10) (= final_x (bvadd read_a #x00000001))))
(assert (=> (= co_4 #b10) (= final_x (bvadd read_b #x00000001))))

(check-sat)
