; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x13 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-1|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x53 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-1|) true)))
(let (($x20 (= $x53 $x13)))
(not $x20)))))
(check-sat)
