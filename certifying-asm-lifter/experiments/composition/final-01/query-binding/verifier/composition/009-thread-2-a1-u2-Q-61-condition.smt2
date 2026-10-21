; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(assert
 (let (($x55 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true)))
(let (($x54 (= $x55 $x55)))
(not $x54))))
(check-sat)
