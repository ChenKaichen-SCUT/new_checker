; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5536 ((_ extract 1 1) p0-join-read-11)))
(let (($x3497 (= ?x5536 (_ bv0 1))))
(let (($x5537 (= (not (and (distinct (_ bv0 1) ?x5536) true)) $x3497)))
(not $x5537)))))
(check-sat)
