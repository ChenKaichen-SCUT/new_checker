; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x87 (bvadd (_ bv0 32) u0)))
(let (($x50 (= u0 ?x87)))
(not $x50))))
(check-sat)
