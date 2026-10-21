; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x325 (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true)))
(let (($x28 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x177 (and (distinct (_ bv0 32) (ite $x28 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x108 (= $x177 $x325)))
(not $x108))))))
(check-sat)
