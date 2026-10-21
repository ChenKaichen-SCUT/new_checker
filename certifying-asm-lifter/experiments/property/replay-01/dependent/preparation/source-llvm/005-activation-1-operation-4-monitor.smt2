; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-2| () (_ BitVec 32))
(assert
 (let (($x340 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x150 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-2|) true)))
(let (($x447 (= $x150 $x340)))
(not $x447)))))
(check-sat)
