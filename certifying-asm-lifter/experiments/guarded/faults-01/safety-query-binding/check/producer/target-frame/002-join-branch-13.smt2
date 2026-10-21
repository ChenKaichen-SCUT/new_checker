; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2064 ((_ extract 1 1) p0-join-read-11)))
(let (($x44 (= ?x2064 (_ bv0 1))))
(let (($x7523 (= (not (and (distinct (_ bv0 1) ?x2064) true)) $x44)))
(not $x7523)))))
(check-sat)
