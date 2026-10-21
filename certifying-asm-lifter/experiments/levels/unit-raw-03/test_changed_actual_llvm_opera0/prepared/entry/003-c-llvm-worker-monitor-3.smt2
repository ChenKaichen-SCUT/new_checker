; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x29 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x59 (ite $x29 (_ bv1 1) (_ bv0 1))))
(let ((?x44 ((_ zero_extend 31) ?x59)))
(let (($x21 (= $x29 (and (distinct ?x44 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
