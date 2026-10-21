; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x355 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x363 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x356 (and (distinct (_ bv0 32) (ite $x363 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x525 (= $x356 $x355)))
(not $x525))))))
(check-sat)
