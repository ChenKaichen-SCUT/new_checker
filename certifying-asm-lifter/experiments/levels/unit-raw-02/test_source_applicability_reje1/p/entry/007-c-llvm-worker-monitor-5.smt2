; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x52 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x39 (ite $x52 (_ bv1 1) (_ bv0 1))))
(let ((?x23 ((_ zero_extend 31) ?x39)))
(let (($x47 (= $x52 (and (distinct ?x23 (_ bv0 32)) true))))
(not $x47))))))
(check-sat)
