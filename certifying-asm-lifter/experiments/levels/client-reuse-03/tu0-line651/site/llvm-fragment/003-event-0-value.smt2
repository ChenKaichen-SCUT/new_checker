; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let (($x33 (=> true (= (bvadd u0 (_ bv84 64)) (bvadd u0 (_ bv84 64))))))
(not $x33)))
(check-sat)
