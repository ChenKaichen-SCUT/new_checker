; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x2698 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-1|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x1425 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-1|) true)))
(let (($x2524 (= $x1425 $x2698)))
(not $x2524)))))
(check-sat)
