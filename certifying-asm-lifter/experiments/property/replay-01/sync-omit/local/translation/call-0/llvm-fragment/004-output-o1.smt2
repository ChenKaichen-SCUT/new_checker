; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x2524 (bvadd (_ bv0 32) u0)))
(let (($x561 (= u0 ?x2524)))
(not $x561))))
(check-sat)
