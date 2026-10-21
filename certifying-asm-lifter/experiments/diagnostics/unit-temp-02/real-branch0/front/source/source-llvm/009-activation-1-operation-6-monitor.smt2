; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x234 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x170 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x347 (and (distinct (_ bv0 32) (ite $x170 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x333 (= $x347 $x234)))
(not $x333))))))
(check-sat)
