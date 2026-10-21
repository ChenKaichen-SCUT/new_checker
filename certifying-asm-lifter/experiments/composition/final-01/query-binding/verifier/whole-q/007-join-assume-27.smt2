; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x61 ((_ extract 0 0) p0-join-read-23)))
(let (($x69 (= ?x61 (_ bv0 1))))
(let (($x13 (= (not (and (distinct (_ bv0 1) ?x61) true)) $x69)))
(not $x13)))))
(check-sat)
