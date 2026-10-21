; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x91 (bvadd (_ bv0 32) u0)))
(let (($x23 (= u0 ?x91)))
(not $x23))))
(check-sat)
