; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x140 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true)))
(let (($x110 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x103 (and (distinct (_ bv0 32) (ite $x110 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x60 (= $x103 $x140)))
(not $x60))))))
(check-sat)
