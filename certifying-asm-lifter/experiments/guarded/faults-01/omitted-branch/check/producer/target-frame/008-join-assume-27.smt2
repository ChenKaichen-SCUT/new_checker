; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x192 ((_ extract 0 0) p0-join-read-23)))
(let (($x240 (= ?x192 (_ bv0 1))))
(let (($x84 (= (not (and (distinct (_ bv0 1) ?x192) true)) $x240)))
(not $x84)))))
(check-sat)
