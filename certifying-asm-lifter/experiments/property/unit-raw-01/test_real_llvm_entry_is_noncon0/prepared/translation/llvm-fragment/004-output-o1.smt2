; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x41 (bvadd (_ bv0 32) u0)))
(let (($x42 (= u0 ?x41)))
(not $x42))))
(check-sat)
