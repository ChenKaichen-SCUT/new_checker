; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let (($x20 (=> true (= (bvadd u0 (_ bv8 64)) (bvadd u0 (_ bv8 64))))))
(not $x20)))
(check-sat)
