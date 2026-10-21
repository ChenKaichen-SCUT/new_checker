; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x38 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x23 (ite $x38 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x23)))
(let (($x7 (= $x38 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x7))))))
(check-sat)
