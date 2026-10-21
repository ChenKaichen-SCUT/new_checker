; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x52 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x30 (ite $x52 (_ bv1 1) (_ bv0 1))))
(let ((?x91 ((_ zero_extend 31) ?x30)))
(let (($x53 (= $x52 (and (distinct ?x91 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
