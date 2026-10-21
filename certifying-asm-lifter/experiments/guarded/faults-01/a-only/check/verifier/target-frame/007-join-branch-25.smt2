; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x83 ((_ extract 1 1) p0-join-read-23)))
(let (($x5133 (= ?x83 (_ bv0 1))))
(let (($x30 (= (not (and (distinct (_ bv0 1) ?x83) true)) $x5133)))
(not $x30)))))
(check-sat)
