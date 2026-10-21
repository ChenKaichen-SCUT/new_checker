; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3333 (= (_ bv1 32) p0-main-read-0)))
(let (($x76 (= $x3333 $x3333)))
(not $x76))))
(check-sat)
