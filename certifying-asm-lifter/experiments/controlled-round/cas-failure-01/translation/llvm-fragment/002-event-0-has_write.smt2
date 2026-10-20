; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (= (_ bv0 32) u0)))
(let (($x73 (= u0 (_ bv0 32))))
(let (($x27 (= $x73 $x35)))
(not $x27)))))
(check-sat)
