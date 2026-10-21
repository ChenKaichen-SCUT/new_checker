; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x25 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x49 (ite $x25 (_ bv1 1) (_ bv0 1))))
(let ((?x34 ((_ zero_extend 31) ?x49)))
(let (($x22 (= $x25 (and (distinct ?x34 (_ bv0 32)) true))))
(not $x22))))))
(check-sat)
