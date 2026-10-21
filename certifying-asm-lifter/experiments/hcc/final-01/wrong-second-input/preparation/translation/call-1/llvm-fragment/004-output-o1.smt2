; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x27 (bvadd (_ bv0 32) u0)))
(let (($x62 (= u0 ?x27)))
(not $x62))))
(check-sat)
