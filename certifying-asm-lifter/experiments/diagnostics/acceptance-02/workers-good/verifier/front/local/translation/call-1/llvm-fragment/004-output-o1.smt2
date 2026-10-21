; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x28 (bvadd (_ bv0 32) u0)))
(let (($x94 (= u0 ?x28)))
(not $x94))))
(check-sat)
