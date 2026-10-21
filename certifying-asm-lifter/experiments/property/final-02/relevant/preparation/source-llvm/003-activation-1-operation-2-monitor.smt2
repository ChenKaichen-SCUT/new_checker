; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x48 (and (distinct ((_ zero_extend 31) (ite (= (_ bv0 32) |pd-source-1:p1-open-rmw-1|) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x55 (= (_ bv0 32) |pd-source-1:p1-open-rmw-1|)))
(let (($x20 (= $x55 $x48)))
(not $x20)))))
(check-sat)
