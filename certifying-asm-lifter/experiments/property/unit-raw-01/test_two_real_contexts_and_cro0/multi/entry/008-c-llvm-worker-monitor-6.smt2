; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x47 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x79 (ite $x47 (_ bv1 1) (_ bv0 1))))
(let ((?x37 ((_ zero_extend 31) ?x79)))
(let (($x13 (= $x47 (and (distinct ?x37 (_ bv0 32)) true))))
(not $x13))))))
(check-sat)
