; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x41 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x53 (ite $x41 (_ bv1 1) (_ bv0 1))))
(let ((?x57 ((_ zero_extend 31) ?x53)))
(let (($x21 (= $x41 (and (distinct ?x57 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
