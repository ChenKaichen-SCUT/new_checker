; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x18 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x52 (ite $x18 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x52)))
(let (($x23 (= $x18 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x23))))))
(check-sat)
