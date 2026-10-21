; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let (($x29 (=> true (= (bvadd u0 (_ bv2 64)) (bvadd u0 (_ bv2 64))))))
(not $x29)))
(check-sat)
