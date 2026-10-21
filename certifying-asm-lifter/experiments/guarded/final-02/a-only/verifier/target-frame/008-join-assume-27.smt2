; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5443 ((_ extract 0 0) p0-join-read-23)))
(let (($x1357 (= ?x5443 (_ bv0 1))))
(let (($x6453 (= (not (and (distinct (_ bv0 1) ?x5443) true)) $x1357)))
(not $x6453)))))
(check-sat)
