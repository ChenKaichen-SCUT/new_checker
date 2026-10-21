; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x1190 (and (distinct (_ bv0 32) |activation-1:p1-open-read-2|) true)))
(let (($x1180 (= $x1190 $x1190)))
(not $x1180))))
(check-sat)
