; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x56 ((_ extract 1 1) p0-join-read-23)))
(let (($x61 (= ?x56 (_ bv0 1))))
(let (($x36 (= (not (and (distinct (_ bv0 1) ?x56) true)) $x61)))
(not $x36)))))
(check-sat)
