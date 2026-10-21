; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x54 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x70 (ite $x54 (_ bv1 1) (_ bv0 1))))
(let ((?x17 ((_ zero_extend 31) ?x70)))
(let (($x79 (= $x54 (and (distinct ?x17 (_ bv0 32)) true))))
(not $x79))))))
(check-sat)
