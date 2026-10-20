; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x58 (= (_ bv0 32) u0)))
(let (($x11 (= u0 (_ bv0 32))))
(let (($x22 (= $x11 $x58)))
(not $x22)))))
(check-sat)
