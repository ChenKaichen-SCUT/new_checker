; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x23 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x25 (ite $x23 (_ bv1 1) (_ bv0 1))))
(let ((?x52 ((_ zero_extend 31) ?x25)))
(let (($x16 (= $x23 (and (distinct ?x52 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
