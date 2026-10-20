; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x16 (= u0 (_ bv0 32))))
(let (($x57 (=> $x16 (= (_ bv2 32) (_ bv2 32)))))
(not $x57))))
(check-sat)
