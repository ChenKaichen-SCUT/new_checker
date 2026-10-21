; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x51 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x57 (ite $x51 (_ bv1 1) (_ bv0 1))))
(let ((?x40 ((_ zero_extend 31) ?x57)))
(let (($x43 (= $x51 (and (distinct ?x40 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
