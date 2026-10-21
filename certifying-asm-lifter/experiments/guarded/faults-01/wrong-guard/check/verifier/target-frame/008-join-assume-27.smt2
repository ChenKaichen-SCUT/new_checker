; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x72 ((_ extract 0 0) p0-join-read-23)))
(let (($x83 (= ?x72 (_ bv0 1))))
(let (($x82 (= (not (and (distinct (_ bv0 1) ?x72) true)) $x83)))
(not $x82)))))
(check-sat)
