; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let ((?x14 (bvadd (_ bv0 64) u0)))
(let (($x15 (= u0 ?x14)))
(not $x15))))
(check-sat)
