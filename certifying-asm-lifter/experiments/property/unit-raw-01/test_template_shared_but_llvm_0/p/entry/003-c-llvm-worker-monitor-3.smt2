; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x20 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x38 (ite $x20 (_ bv1 1) (_ bv0 1))))
(let ((?x37 ((_ zero_extend 31) ?x38)))
(let (($x9 (= $x20 (and (distinct ?x37 (_ bv0 32)) true))))
(not $x9))))))
(check-sat)
