; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x26 (ite $x10 (_ bv1 1) (_ bv0 1))))
(let ((?x42 ((_ zero_extend 31) ?x26)))
(let (($x47 (= $x10 (and (distinct ?x42 (_ bv0 32)) true))))
(not $x47))))))
(check-sat)
