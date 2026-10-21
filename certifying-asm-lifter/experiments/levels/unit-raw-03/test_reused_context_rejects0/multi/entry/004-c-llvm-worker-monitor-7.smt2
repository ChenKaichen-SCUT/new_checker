; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x14 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x39 (ite $x14 (_ bv1 1) (_ bv0 1))))
(let ((?x27 ((_ zero_extend 31) ?x39)))
(let (($x40 (= $x14 (and (distinct ?x27 (_ bv0 32)) true))))
(not $x40))))))
(check-sat)
