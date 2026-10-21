; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3362 ((_ extract 0 0) p0-join-read-23)))
(let (($x3330 (= ?x3362 (_ bv0 1))))
(let (($x1997 (= (not (and (distinct (_ bv0 1) ?x3362) true)) $x3330)))
(not $x1997)))))
(check-sat)
