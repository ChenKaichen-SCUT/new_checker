; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x106 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-1|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x53 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-1|) true)))
(let (($x8 (= $x53 $x106)))
(not $x8)))))
(check-sat)
