; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x33 (bvadd (_ bv0 32) u0)))
(let (($x9 (= u0 ?x33)))
(not $x9))))
(check-sat)
