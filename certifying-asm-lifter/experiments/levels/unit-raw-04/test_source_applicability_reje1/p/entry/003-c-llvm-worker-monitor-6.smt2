; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x53 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x31 (ite $x53 (_ bv1 1) (_ bv0 1))))
(let ((?x59 ((_ zero_extend 31) ?x31)))
(let (($x37 (= $x53 (and (distinct ?x59 (_ bv0 32)) true))))
(not $x37))))))
(check-sat)
