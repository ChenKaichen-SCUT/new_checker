; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3736 ((_ extract 0 0) p0-join-read-11)))
(let (($x1547 (= ?x3736 (_ bv0 1))))
(let (($x1750 (= (not (and (distinct (_ bv0 1) ?x3736) true)) $x1547)))
(not $x1750)))))
(check-sat)
