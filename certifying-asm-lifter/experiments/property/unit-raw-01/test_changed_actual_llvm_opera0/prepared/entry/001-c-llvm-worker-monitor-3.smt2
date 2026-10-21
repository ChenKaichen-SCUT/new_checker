; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x59 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x37 ((_ zero_extend 31) ?x59)))
(let (($x10 (= $x39 (and (distinct ?x37 (_ bv0 32)) true))))
(not $x10))))))
(check-sat)
