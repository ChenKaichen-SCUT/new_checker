; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x61 (bvadd (_ bv0 32) u0)))
(let (($x48 (= u0 ?x61)))
(not $x48))))
(check-sat)
