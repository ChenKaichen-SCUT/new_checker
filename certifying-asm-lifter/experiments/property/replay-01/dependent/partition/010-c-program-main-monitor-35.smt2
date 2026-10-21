; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x499 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x448 (= $x499 $x499)))
(not $x448))))
(check-sat)
