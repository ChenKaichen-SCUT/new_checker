; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x34 (= u0 (_ bv0 32))))
(let (($x60 (=> $x34 (= (_ bv2 32) (_ bv2 32)))))
(not $x60))))
(check-sat)
