; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x17 (bvadd (_ bv0 32) u0)))
(let (($x43 (= u0 ?x17)))
(not $x43))))
(check-sat)
