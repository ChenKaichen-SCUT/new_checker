; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x65 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x50 (ite $x65 (_ bv1 1) (_ bv0 1))))
(let ((?x48 ((_ zero_extend 31) ?x50)))
(let (($x54 (= $x65 (and (distinct ?x48 (_ bv0 32)) true))))
(not $x54))))))
(check-sat)
