; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x524 (bvadd (_ bv0 32) u0)))
(let (($x346 (= u0 ?x524)))
(not $x346))))
(check-sat)
