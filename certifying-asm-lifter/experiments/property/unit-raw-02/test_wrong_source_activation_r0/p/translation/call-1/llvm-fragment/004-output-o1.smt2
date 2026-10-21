; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x108 (bvadd (_ bv0 32) u0)))
(let (($x110 (= u0 ?x108)))
(not $x110))))
(check-sat)
