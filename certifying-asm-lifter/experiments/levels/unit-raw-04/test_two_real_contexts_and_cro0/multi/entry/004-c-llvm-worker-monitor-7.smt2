; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x20 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x79 (ite $x20 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x79)))
(let (($x52 (= $x20 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x52))))))
(check-sat)
