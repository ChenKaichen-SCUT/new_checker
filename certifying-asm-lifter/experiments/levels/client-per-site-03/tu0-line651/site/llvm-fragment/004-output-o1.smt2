; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let ((?x12 (bvadd (_ bv0 64) u0)))
(let (($x22 (= u0 ?x12)))
(not $x22))))
(check-sat)
