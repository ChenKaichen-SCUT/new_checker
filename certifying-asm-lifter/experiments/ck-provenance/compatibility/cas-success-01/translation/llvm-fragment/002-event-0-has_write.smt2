; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x41 (= (_ bv0 32) u0)))
(let (($x46 (= u0 (_ bv0 32))))
(let (($x24 (= $x46 $x41)))
(not $x24)))))
(check-sat)
