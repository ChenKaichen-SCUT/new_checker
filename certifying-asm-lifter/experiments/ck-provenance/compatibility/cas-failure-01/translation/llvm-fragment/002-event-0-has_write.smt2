; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x31 (= (_ bv0 32) u0)))
(let (($x71 (= u0 (_ bv0 32))))
(let (($x72 (= $x71 $x31)))
(not $x72)))))
(check-sat)
