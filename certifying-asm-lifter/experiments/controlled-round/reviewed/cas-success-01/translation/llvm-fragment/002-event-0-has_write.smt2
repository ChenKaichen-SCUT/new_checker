; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x24 (= (_ bv0 32) u0)))
(let (($x23 (= u0 (_ bv0 32))))
(let (($x70 (= $x23 $x24)))
(not $x70)))))
(check-sat)
