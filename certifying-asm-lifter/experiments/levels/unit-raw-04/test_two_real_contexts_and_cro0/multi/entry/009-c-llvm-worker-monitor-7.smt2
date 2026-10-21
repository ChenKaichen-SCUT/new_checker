; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x40 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x37 (ite $x40 (_ bv1 1) (_ bv0 1))))
(let ((?x79 ((_ zero_extend 31) ?x37)))
(let (($x16 (= $x40 (and (distinct ?x79 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
