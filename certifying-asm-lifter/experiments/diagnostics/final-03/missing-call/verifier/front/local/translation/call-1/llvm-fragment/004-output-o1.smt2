; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x21 (bvadd (_ bv0 32) u0)))
(let (($x2639 (= u0 ?x21)))
(not $x2639))))
(check-sat)
