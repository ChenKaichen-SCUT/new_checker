; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x12 (bvadd (_ bv0 32) u0)))
(let (($x17 (= u0 ?x12)))
(not $x17))))
(check-sat)
