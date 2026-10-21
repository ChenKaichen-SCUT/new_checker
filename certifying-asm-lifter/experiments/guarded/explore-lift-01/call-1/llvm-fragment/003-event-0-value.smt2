; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x18 (=> true (= (bvadd u0 (_ bv2 32)) (bvadd u0 (_ bv2 32))))))
(not $x18)))
(check-sat)
