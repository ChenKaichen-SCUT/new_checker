; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x189 ((_ extract 1 1) p0-join-read-23)))
(let (($x3468 (= ?x189 (_ bv0 1))))
(let (($x3965 (= (not (and (distinct (_ bv0 1) ?x189) true)) $x3468)))
(not $x3965)))))
(check-sat)
