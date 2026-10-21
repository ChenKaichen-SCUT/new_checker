; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x26 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x29 (ite $x26 (_ bv1 1) (_ bv0 1))))
(let ((?x52 ((_ zero_extend 31) ?x29)))
(let (($x36 (= $x26 (and (distinct ?x52 (_ bv0 32)) true))))
(not $x36))))))
(check-sat)
