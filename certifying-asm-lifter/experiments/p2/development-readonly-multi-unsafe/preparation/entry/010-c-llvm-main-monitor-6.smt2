; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x488 (= (_ bv0 32) p0-main-read-0)))
(let (($x1188 (= $x488 (and (distinct ((_ zero_extend 31) (ite $x488 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x1188))))
(check-sat)
