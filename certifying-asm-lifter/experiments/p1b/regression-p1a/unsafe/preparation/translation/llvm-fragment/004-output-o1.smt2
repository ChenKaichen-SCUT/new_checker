; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x19 (bvadd (_ bv0 32) u0)))
(let (($x13 (= u0 ?x19)))
(not $x13))))
(check-sat)
