; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x538 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x394 (ite $x538 (_ bv1 1) (_ bv0 1))))
(let ((?x459 ((_ zero_extend 31) ?x394)))
(let (($x561 (= $x538 (and (distinct ?x459 (_ bv0 32)) true))))
(not $x561))))))
(check-sat)
