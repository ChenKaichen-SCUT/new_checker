; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x31 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x25 (ite $x31 (_ bv1 1) (_ bv0 1))))
(let ((?x60 ((_ zero_extend 31) ?x25)))
(let (($x57 (= $x31 (and (distinct ?x60 (_ bv0 32)) true))))
(not $x57))))))
(check-sat)
