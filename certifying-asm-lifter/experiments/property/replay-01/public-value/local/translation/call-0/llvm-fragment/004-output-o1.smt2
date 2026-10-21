; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1425 (bvadd (_ bv0 32) u0)))
(let (($x401 (= u0 ?x1425)))
(not $x401))))
(check-sat)
