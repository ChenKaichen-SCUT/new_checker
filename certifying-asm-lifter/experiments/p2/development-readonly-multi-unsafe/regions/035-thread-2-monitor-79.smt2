; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x101 (and (distinct (_ bv0 32) |activation-2:p1-open-read-2|) true)))
(let (($x491 (= $x101 $x101)))
(not $x491))))
(check-sat)
