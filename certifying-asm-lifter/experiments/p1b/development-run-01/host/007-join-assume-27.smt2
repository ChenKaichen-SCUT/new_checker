; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x15 ((_ extract 0 0) p0-join-read-23)))
(let (($x50 (= ?x15 (_ bv0 1))))
(let (($x14 (= (not (and (distinct (_ bv0 1) ?x15) true)) $x50)))
(not $x14)))))
(check-sat)
