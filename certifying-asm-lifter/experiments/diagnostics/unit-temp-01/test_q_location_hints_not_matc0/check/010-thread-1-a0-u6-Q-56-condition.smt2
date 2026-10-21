; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x35 (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true)))
(let (($x128 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x173 (and (distinct (_ bv0 32) (ite $x128 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x140 (= $x173 $x35)))
(not $x140))))))
(check-sat)
