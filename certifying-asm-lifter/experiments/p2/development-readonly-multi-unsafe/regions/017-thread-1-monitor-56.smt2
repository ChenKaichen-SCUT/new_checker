; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x173 (and (distinct (_ bv0 32) |activation-1:p1-open-read-2|) true)))
(let (($x455 (= $x173 $x173)))
(not $x455))))
(check-sat)
