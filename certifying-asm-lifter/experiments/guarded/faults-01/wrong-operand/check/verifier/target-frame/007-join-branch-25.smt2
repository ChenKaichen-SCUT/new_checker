; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x549 ((_ extract 1 1) p0-join-read-23)))
(let (($x108 (= ?x549 (_ bv0 1))))
(let (($x242 (= (not (and (distinct (_ bv0 1) ?x549) true)) $x108)))
(not $x242)))))
(check-sat)
