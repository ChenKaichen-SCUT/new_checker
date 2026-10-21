; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x46 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x60 ((_ zero_extend 31) ?x46)))
(let (($x59 (= $x39 (and (distinct ?x60 (_ bv0 32)) true))))
(not $x59))))))
(check-sat)
