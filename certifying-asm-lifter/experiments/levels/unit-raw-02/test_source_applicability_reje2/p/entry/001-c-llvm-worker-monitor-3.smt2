; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x58 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x56 (ite $x58 (_ bv1 1) (_ bv0 1))))
(let ((?x11 ((_ zero_extend 31) ?x56)))
(let (($x65 (= $x58 (and (distinct ?x11 (_ bv0 32)) true))))
(not $x65))))))
(check-sat)
