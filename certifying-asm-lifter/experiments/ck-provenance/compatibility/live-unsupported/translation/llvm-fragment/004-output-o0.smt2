; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x17 (bvadd (_ bv0 32) u0)))
(let (($x74 (= u0 ?x17)))
(not $x74))))
(check-sat)
