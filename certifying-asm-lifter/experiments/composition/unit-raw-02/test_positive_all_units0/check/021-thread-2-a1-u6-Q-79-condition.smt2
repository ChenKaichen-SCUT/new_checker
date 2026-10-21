; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x83 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true)))
(let (($x110 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x103 (and (distinct (_ bv0 32) (ite $x110 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x8 (= $x103 $x83)))
(not $x8))))))
(check-sat)
