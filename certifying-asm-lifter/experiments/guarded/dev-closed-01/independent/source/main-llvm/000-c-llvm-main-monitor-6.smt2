; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x50 (= (_ bv0 32) p0-main-read-0)))
(let (($x3563 (= $x50 (and (distinct ((_ zero_extend 31) (ite $x50 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x3563))))
(check-sat)
