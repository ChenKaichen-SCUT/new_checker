; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x65 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x59 (ite $x65 (_ bv1 1) (_ bv0 1))))
(let ((?x39 ((_ zero_extend 31) ?x59)))
(let (($x45 (= $x65 (and (distinct ?x39 (_ bv0 32)) true))))
(not $x45))))))
(check-sat)
