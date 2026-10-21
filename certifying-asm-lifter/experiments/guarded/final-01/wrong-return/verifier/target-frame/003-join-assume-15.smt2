; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6462 ((_ extract 0 0) p0-join-read-11)))
(let (($x8503 (= ?x6462 (_ bv0 1))))
(let (($x1130 (= (not (and (distinct (_ bv0 1) ?x6462) true)) $x8503)))
(not $x1130)))))
(check-sat)
