; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x84 ((_ extract 1 1) p0-join-read-23)))
(let (($x83 (= ?x84 (_ bv0 1))))
(let (($x44 (= (not (and (distinct (_ bv0 1) ?x84) true)) $x83)))
(not $x44)))))
(check-sat)
