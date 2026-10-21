; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x47 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x22 (ite $x47 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x22)))
(let (($x98 (= $x47 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x98))))))
(check-sat)
