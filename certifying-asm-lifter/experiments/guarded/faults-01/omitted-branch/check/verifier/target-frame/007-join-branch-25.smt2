; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x275 ((_ extract 1 1) p0-join-read-23)))
(let (($x464 (= ?x275 (_ bv0 1))))
(let (($x7462 (= (not (and (distinct (_ bv0 1) ?x275) true)) $x464)))
(not $x7462)))))
(check-sat)
