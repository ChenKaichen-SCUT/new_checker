; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x18 (bvadd (_ bv0 32) u0)))
(let (($x19 (= u0 ?x18)))
(not $x19))))
(check-sat)
