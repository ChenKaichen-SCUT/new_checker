; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-status-22 () (_ BitVec 8))
(assert
 (let (($x86 (= (and (distinct (_ bv1 8) p0-join-status-22) true) (and (distinct p0-join-status-22 (_ bv1 8)) true))))
(not $x86)))
(check-sat)
