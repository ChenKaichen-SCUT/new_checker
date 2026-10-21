; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(assert
 (let (($x89 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x339 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true)))
(let (($x328 (= $x339 $x89)))
(not $x328)))))
(check-sat)
