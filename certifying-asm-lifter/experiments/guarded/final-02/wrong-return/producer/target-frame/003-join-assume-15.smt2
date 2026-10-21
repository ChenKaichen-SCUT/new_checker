; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x98 ((_ extract 0 0) p0-join-read-11)))
(let (($x3741 (= ?x98 (_ bv0 1))))
(let (($x3965 (= (not (and (distinct (_ bv0 1) ?x98) true)) $x3741)))
(not $x3965)))))
(check-sat)
