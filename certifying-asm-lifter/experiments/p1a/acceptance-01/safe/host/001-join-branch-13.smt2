; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x55 ((_ extract 1 1) p0-join-read-11)))
(let (($x33 (= ?x55 (_ bv0 1))))
(let (($x23 (= (not (and (distinct (_ bv0 1) ?x55) true)) $x33)))
(not $x23)))))
(check-sat)
