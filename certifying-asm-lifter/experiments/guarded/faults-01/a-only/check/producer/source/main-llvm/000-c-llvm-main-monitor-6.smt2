; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x8653 (= (_ bv1 32) p0-main-read-0)))
(let (($x6992 (= $x8653 (and (distinct ((_ zero_extend 31) (ite $x8653 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x6992))))
(check-sat)
