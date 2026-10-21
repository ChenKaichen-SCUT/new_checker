; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x281 ((_ extract 0 0) p0-join-read-11)))
(let (($x85 (= ?x281 (_ bv0 1))))
(let (($x180 (= (not (and (distinct (_ bv0 1) ?x281) true)) $x85)))
(not $x180)))))
(check-sat)
