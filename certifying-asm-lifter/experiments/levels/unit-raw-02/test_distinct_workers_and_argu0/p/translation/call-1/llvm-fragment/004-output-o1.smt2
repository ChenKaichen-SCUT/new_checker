; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x36 (bvadd (_ bv0 32) u0)))
(let (($x50 (= u0 ?x36)))
(not $x50))))
(check-sat)
