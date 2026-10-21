; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x412 ((_ extract 0 0) p0-join-read-23)))
(let (($x409 (= ?x412 (_ bv0 1))))
(let (($x740 (= (not (and (distinct (_ bv0 1) ?x412) true)) $x409)))
(not $x740)))))
(check-sat)
