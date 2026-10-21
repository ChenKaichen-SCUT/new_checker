; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x15 (bvadd (_ bv0 32) u0)))
(let (($x47 (= u0 ?x15)))
(not $x47))))
(check-sat)
