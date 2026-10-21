; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x19 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x13 (ite $x19 (_ bv1 1) (_ bv0 1))))
(let ((?x43 ((_ zero_extend 31) ?x13)))
(let (($x84 (= $x19 (and (distinct ?x43 (_ bv0 32)) true))))
(not $x84))))))
(check-sat)
