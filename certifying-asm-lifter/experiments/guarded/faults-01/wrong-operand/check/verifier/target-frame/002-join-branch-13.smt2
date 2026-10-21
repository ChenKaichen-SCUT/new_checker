; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x65 ((_ extract 1 1) p0-join-read-11)))
(let (($x2510 (= ?x65 (_ bv0 1))))
(let (($x105 (= (not (and (distinct (_ bv0 1) ?x65) true)) $x2510)))
(not $x105)))))
(check-sat)
