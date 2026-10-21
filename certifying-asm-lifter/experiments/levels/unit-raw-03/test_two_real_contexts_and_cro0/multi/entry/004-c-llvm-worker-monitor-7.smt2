; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x14 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x42 (ite $x14 (_ bv1 1) (_ bv0 1))))
(let ((?x51 ((_ zero_extend 31) ?x42)))
(let (($x20 (= $x14 (and (distinct ?x51 (_ bv0 32)) true))))
(not $x20))))))
(check-sat)
