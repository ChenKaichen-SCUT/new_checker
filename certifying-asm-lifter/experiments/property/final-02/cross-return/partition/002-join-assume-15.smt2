; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x120 ((_ extract 0 0) p0-join-read-11)))
(let (($x127 (= ?x120 (_ bv0 1))))
(let (($x133 (= (not (and (distinct (_ bv0 1) ?x120) true)) $x127)))
(not $x133)))))
(check-sat)
