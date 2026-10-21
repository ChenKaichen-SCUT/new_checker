; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x740 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x372 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x2970 (and (distinct (_ bv0 32) (ite $x372 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x2557 (= $x2970 $x740)))
(not $x2557))))))
(check-sat)
