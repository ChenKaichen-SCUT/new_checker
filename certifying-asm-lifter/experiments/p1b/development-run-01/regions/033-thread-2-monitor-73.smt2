; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x53 (and (distinct (_ bv0 32) |activation-2:p1-open-read-2|) true)))
(let (($x16 (= $x53 $x53)))
(not $x16))))
(check-sat)
