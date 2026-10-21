; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x69 (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true)))
(let (($x76 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x82 (and (distinct (_ bv0 32) (ite $x76 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x60 (= $x82 $x69)))
(not $x60))))))
(check-sat)
