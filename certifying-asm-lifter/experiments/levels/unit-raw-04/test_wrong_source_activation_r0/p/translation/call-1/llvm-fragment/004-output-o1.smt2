; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x5 (bvadd (_ bv0 32) u0)))
(let (($x61 (= u0 ?x5)))
(not $x61))))
(check-sat)
