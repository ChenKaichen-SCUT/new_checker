; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x10 (bvadd (_ bv0 32) u0)))
(let (($x7 (= u0 ?x10)))
(not $x7))))
(check-sat)
