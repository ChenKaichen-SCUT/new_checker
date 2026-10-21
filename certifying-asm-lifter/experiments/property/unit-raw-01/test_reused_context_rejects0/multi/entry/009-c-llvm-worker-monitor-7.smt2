; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x79 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x59 (ite $x79 (_ bv1 1) (_ bv0 1))))
(let ((?x7 ((_ zero_extend 31) ?x59)))
(let (($x50 (= $x79 (and (distinct ?x7 (_ bv0 32)) true))))
(not $x50))))))
(check-sat)
