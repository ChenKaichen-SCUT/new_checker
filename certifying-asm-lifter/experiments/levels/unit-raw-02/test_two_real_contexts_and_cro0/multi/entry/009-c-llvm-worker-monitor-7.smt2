; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x38 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x19 (ite $x38 (_ bv1 1) (_ bv0 1))))
(let ((?x52 ((_ zero_extend 31) ?x19)))
(let (($x47 (= $x38 (and (distinct ?x52 (_ bv0 32)) true))))
(not $x47))))))
(check-sat)
