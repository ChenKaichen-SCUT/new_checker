; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x50 (bvadd (_ bv0 32) u0)))
(let (($x63 (= u0 ?x50)))
(not $x63))))
(check-sat)
