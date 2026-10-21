; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x93 (and (distinct ((_ zero_extend 31) (ite (= (_ bv0 32) |pd-source-1:p1-open-rmw-1|) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x14 (= (_ bv0 32) |pd-source-1:p1-open-rmw-1|)))
(let (($x150 (= $x14 $x93)))
(not $x150)))))
(check-sat)
