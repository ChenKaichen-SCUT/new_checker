; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x7 (bvadd (_ bv0 32) u0)))
(let (($x330 (= u0 ?x7)))
(not $x330))))
(check-sat)
