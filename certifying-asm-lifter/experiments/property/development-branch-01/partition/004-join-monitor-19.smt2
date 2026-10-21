; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-status-10 () (_ BitVec 8))
(assert
 (let (($x149 (= (and (distinct (_ bv1 8) p0-join-status-10) true) (and (distinct p0-join-status-10 (_ bv1 8)) true))))
(not $x149)))
(check-sat)
