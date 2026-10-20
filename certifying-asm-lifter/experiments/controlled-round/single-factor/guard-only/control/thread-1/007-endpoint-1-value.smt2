; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x36 (= u0 (_ bv0 32))))
(let (($x18 (=> $x36 (= (_ bv2 32) (_ bv2 32)))))
(not $x18))))
(check-sat)
