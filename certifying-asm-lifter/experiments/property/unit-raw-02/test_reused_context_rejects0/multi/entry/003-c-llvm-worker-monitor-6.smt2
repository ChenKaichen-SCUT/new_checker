; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x27 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x86 (ite $x27 (_ bv1 1) (_ bv0 1))))
(let ((?x45 ((_ zero_extend 31) ?x86)))
(let (($x54 (= $x27 (and (distinct ?x45 (_ bv0 32)) true))))
(not $x54))))))
(check-sat)
