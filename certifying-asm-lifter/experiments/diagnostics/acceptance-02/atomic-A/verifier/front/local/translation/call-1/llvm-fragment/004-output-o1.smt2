; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x103 (bvadd (_ bv0 32) u0)))
(let (($x715 (= u0 ?x103)))
(not $x715))))
(check-sat)
