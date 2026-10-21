; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x24 (bvadd (_ bv0 32) u0)))
(let (($x66 (= u0 ?x24)))
(not $x66))))
(check-sat)
