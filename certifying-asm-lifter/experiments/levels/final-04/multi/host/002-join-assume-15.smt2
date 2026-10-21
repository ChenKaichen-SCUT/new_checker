; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x41 ((_ extract 0 0) p0-join-read-11)))
(let (($x97 (= ?x41 (_ bv0 1))))
(let (($x95 (= (not (and (distinct (_ bv0 1) ?x41) true)) $x97)))
(not $x95)))))
(check-sat)
