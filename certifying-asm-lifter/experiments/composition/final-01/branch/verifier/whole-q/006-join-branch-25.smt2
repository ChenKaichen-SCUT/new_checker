; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x140 ((_ extract 1 1) p0-join-read-23)))
(let (($x69 (= ?x140 (_ bv0 1))))
(let (($x59 (= (not (and (distinct (_ bv0 1) ?x140) true)) $x69)))
(not $x59)))))
(check-sat)
