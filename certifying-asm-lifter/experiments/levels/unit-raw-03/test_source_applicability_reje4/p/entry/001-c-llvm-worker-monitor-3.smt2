; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x13 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x64 (ite $x13 (_ bv1 1) (_ bv0 1))))
(let ((?x14 ((_ zero_extend 31) ?x64)))
(let (($x58 (= $x13 (and (distinct ?x14 (_ bv0 32)) true))))
(not $x58))))))
(check-sat)
