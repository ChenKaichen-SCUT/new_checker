; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x60 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x59 (ite $x60 (_ bv1 1) (_ bv0 1))))
(let ((?x48 ((_ zero_extend 31) ?x59)))
(let (($x16 (= $x60 (and (distinct ?x48 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
