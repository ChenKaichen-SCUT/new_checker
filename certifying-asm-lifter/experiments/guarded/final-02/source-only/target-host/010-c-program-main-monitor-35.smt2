; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3001 (= (_ bv0 32) p0-main-read-0)))
(let (($x3362 (= $x3001 $x3001)))
(not $x3362))))
(check-sat)
