; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7834 ((_ extract 1 1) p0-join-read-23)))
(let (($x3302 (= ?x7834 (_ bv0 1))))
(let (($x8920 (= (not (and (distinct (_ bv0 1) ?x7834) true)) $x3302)))
(not $x8920)))))
(check-sat)
