; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x44 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x116 (ite $x44 (_ bv1 1) (_ bv0 1))))
(let ((?x52 ((_ zero_extend 31) ?x116)))
(let (($x16 (= $x44 (and (distinct ?x52 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
