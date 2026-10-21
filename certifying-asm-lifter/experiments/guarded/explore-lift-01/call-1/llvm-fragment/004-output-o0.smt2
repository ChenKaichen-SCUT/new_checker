; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x20 (bvadd (_ bv0 32) u0)))
(let (($x29 (= u0 ?x20)))
(not $x29))))
(check-sat)
