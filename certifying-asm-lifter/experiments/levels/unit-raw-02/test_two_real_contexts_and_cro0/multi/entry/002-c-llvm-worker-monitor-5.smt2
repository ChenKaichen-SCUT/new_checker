; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x32 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x32)))
(let (($x56 (= $x21 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x56))))))
(check-sat)
