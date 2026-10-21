; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x21 (bvadd (_ bv0 32) u0)))
(let (($x132 (= u0 ?x21)))
(not $x132))))
(check-sat)
