; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x9 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x100 ((_ zero_extend 31) ?x9)))
(let (($x25 (= $x39 (and (distinct ?x100 (_ bv0 32)) true))))
(not $x25))))))
(check-sat)
