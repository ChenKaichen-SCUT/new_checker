; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x1425 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-1|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x407 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-1|) true)))
(let (($x2683 (= $x407 $x1425)))
(not $x2683)))))
(check-sat)
