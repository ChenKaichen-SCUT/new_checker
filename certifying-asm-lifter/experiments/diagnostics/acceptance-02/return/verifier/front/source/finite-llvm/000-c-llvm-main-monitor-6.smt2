; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x6 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x200 (ite $x6 (_ bv1 1) (_ bv0 1))))
(let ((?x252 ((_ zero_extend 31) ?x200)))
(let (($x38 (= $x6 (and (distinct ?x252 (_ bv0 32)) true))))
(not $x38))))))
(check-sat)
