; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x1630 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x384 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x2538 (and (distinct (_ bv0 32) (ite $x384 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x431 (= $x2538 $x1630)))
(not $x431))))))
(check-sat)
