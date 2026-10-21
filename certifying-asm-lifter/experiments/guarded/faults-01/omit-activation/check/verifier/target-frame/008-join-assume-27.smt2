; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3034 ((_ extract 0 0) p0-join-read-23)))
(let (($x6642 (= ?x3034 (_ bv0 1))))
(let (($x8313 (= (not (and (distinct (_ bv0 1) ?x3034) true)) $x6642)))
(not $x8313)))))
(check-sat)
