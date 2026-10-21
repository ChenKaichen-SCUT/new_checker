; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x10 (=> true (= (bvadd u0 (_ bv4 32)) (bvadd u0 (_ bv4 32))))))
(not $x10)))
(check-sat)
