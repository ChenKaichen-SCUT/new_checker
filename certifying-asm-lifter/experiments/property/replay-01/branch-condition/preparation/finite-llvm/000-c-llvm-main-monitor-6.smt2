; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x419 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x1693 (ite $x419 (_ bv1 1) (_ bv0 1))))
(let ((?x734 ((_ zero_extend 31) ?x1693)))
(let (($x1153 (= $x419 (and (distinct ?x734 (_ bv0 32)) true))))
(not $x1153))))))
(check-sat)
