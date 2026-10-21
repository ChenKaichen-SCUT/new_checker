; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x7 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x43 ((_ zero_extend 31) ?x7)))
(let (($x56 (= $x21 (and (distinct ?x43 (_ bv0 32)) true))))
(not $x56))))))
(check-sat)
