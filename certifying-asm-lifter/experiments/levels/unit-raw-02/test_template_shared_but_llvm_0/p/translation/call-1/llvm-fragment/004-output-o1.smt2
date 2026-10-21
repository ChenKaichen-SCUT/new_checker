; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x33 (bvadd (_ bv0 32) u0)))
(let (($x13 (= u0 ?x33)))
(not $x13))))
(check-sat)
