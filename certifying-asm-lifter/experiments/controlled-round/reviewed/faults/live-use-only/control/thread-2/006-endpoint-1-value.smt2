; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:rcert_150e328a9c7e_0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x21 (or true)))
(let ((?x64 (ite $x21 u0 |entry:rcert_150e328a9c7e_0|)))
(let ((?x58 (bvadd ?x64 (_ bv1 32))))
(let ((?x56 (bvadd u0 (_ bv1 32))))
(let (($x63 (=> true (= ?x56 ?x58))))
(not $x63)))))))
(check-sat)
