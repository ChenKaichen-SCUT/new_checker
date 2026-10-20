; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x73 (= u0 (_ bv0 32))))
(let (($x51 (=> $x73 (= (_ bv2 32) (_ bv2 32)))))
(not $x51))))
(check-sat)
