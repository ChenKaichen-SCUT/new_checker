; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x45 (= u0 (_ bv0 32))))
(let (($x48 (=> $x45 (= (_ bv2 32) (_ bv2 32)))))
(not $x48))))
(check-sat)
