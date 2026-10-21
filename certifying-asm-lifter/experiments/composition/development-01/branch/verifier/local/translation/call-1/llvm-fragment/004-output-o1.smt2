; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x84 (bvadd (_ bv0 32) u0)))
(let (($x69 (= u0 ?x84)))
(not $x69))))
(check-sat)
