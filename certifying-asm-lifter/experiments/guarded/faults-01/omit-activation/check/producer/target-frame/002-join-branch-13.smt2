; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x457 ((_ extract 1 1) p0-join-read-11)))
(let (($x464 (= ?x457 (_ bv0 1))))
(let (($x1608 (= (not (and (distinct (_ bv0 1) ?x457) true)) $x464)))
(not $x1608)))))
(check-sat)
