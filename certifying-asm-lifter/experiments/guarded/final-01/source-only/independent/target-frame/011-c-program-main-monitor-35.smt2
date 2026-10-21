; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3001 (= (_ bv0 32) p0-main-read-0)))
(let (($x824 (= $x3001 $x3001)))
(not $x824))))
(check-sat)
