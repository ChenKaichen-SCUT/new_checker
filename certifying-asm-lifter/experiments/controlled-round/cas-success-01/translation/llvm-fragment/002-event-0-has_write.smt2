; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x22 (= (_ bv0 32) u0)))
(let (($x12 (= u0 (_ bv0 32))))
(let (($x25 (= $x12 $x22)))
(not $x25)))))
(check-sat)
