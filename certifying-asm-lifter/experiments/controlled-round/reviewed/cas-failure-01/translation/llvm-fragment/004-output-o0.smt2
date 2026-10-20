; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x44 (bvadd (_ bv0 32) u0)))
(let (($x45 (= u0 ?x44)))
(not $x45))))
(check-sat)
