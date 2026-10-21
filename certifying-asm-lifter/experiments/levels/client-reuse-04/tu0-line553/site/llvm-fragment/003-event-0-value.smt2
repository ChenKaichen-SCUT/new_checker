; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x14 (=> true (= (bvadd u0 (_ bv42 32)) (bvadd u0 (_ bv42 32))))))
(not $x14)))
(check-sat)
