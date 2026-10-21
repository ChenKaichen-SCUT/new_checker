; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x208 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x80 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x207 (= $x80 $x208)))
(not $x207)))))
(check-sat)
