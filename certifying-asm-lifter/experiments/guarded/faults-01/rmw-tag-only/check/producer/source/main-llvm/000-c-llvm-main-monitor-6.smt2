; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x7843 (= (_ bv1 32) p0-main-read-0)))
(let (($x3978 (= $x7843 (and (distinct ((_ zero_extend 31) (ite $x7843 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x3978))))
(check-sat)
