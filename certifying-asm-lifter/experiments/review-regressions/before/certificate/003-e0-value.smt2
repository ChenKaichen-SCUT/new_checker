; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x20 (=> true (= (bvadd u0 (_ bv0 32)) (bvadd (_ bv0 32) u0)))))
(not $x20)))
(check-sat)
