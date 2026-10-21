; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x101 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x6 (ite $x101 (_ bv1 1) (_ bv0 1))))
(let ((?x121 ((_ zero_extend 31) ?x6)))
(let (($x48 (= $x101 (and (distinct ?x121 (_ bv0 32)) true))))
(not $x48))))))
(check-sat)
