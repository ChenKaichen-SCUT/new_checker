; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x7 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x70 ((_ zero_extend 31) ?x7)))
(let (($x86 (= $x39 (and (distinct ?x70 (_ bv0 32)) true))))
(not $x86))))))
(check-sat)
