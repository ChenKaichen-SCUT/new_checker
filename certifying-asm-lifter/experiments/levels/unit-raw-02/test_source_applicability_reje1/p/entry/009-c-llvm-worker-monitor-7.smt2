; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x40 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x42 (ite $x40 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x42)))
(let (($x15 (= $x40 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x15))))))
(check-sat)
