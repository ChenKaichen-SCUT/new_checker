; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x382 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x2810 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x388 (and (distinct (_ bv0 32) (ite $x2810 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x3052 (= $x388 $x382)))
(not $x3052))))))
(check-sat)
