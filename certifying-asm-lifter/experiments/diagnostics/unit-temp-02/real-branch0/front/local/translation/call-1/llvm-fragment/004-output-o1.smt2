; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x7 (bvadd (_ bv0 32) u0)))
(let (($x132 (= u0 ?x7)))
(not $x132))))
(check-sat)
