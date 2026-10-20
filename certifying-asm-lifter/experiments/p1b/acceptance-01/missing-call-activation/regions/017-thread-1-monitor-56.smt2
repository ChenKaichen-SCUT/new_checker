; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x52 (and (distinct (_ bv0 32) |activation-1:p1-open-read-2|) true)))
(let (($x49 (= $x52 $x52)))
(not $x49))))
(check-sat)
