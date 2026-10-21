; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8803 ((_ extract 0 0) p0-join-read-11)))
(let (($x2593 (= ?x8803 (_ bv0 1))))
(let (($x748 (= (not (and (distinct (_ bv0 1) ?x8803) true)) $x2593)))
(not $x748)))))
(check-sat)
