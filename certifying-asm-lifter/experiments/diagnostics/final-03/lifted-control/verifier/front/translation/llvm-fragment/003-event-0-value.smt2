; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x24 (=> true (= (bvadd u0 (_ bv1 32)) (bvadd u0 (_ bv1 32))))))
(not $x24)))
(check-sat)
