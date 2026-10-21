; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x49 (bvadd (_ bv0 32) u0)))
(let (($x91 (= u0 ?x49)))
(not $x91))))
(check-sat)
