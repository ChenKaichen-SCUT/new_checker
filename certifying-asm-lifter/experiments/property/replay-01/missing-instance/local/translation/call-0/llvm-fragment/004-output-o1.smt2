; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x966 (bvadd (_ bv0 32) u0)))
(let (($x2659 (= u0 ?x966)))
(not $x2659))))
(check-sat)
