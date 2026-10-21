; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x16 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x22 (ite $x16 (_ bv1 1) (_ bv0 1))))
(let ((?x64 ((_ zero_extend 31) ?x22)))
(let (($x21 (= $x16 (and (distinct ?x64 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
