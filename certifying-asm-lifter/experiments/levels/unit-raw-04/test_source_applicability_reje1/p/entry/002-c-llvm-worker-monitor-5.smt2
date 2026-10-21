; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x91 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x73 ((_ zero_extend 31) ?x91)))
(let (($x93 (= $x57 (and (distinct ?x73 (_ bv0 32)) true))))
(not $x93))))))
(check-sat)
