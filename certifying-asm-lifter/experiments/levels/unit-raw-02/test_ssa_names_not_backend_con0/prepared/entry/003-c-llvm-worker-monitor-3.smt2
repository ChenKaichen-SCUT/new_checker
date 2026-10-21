; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x34 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x60 (ite $x34 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x60)))
(let (($x25 (= $x34 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x25))))))
(check-sat)
