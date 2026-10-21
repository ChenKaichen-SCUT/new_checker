; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x45 (bvadd (_ bv0 32) u0)))
(let (($x22 (= u0 ?x45)))
(not $x22))))
(check-sat)
