; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x39 (bvadd (_ bv0 32) u0)))
(let (($x36 (= u0 ?x39)))
(not $x36))))
(check-sat)
