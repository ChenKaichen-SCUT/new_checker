; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x457 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x575 (ite $x457 (_ bv1 1) (_ bv0 1))))
(let ((?x377 ((_ zero_extend 31) ?x575)))
(let (($x574 (= $x457 (and (distinct ?x377 (_ bv0 32)) true))))
(not $x574))))))
(check-sat)
