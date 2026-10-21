; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-2| () (_ BitVec 32))
(assert
 (let (($x71 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x54 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-2|) true)))
(let (($x72 (= $x54 $x71)))
(not $x72)))))
(check-sat)
