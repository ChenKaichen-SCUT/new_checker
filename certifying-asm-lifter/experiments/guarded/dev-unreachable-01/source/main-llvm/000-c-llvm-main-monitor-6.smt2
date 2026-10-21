; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3098 (= (_ bv0 32) p0-main-read-0)))
(let (($x3599 (= $x3098 (and (distinct ((_ zero_extend 31) (ite $x3098 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x3599))))
(check-sat)
