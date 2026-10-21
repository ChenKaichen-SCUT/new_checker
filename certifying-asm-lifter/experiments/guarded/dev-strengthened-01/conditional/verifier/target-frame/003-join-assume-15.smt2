; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x123 ((_ extract 0 0) p0-join-read-11)))
(let (($x105 (= ?x123 (_ bv0 1))))
(let (($x70 (= (not (and (distinct (_ bv0 1) ?x123) true)) $x105)))
(not $x70)))))
(check-sat)
