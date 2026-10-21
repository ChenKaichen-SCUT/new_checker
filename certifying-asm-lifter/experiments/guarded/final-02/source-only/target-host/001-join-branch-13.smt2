; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5775 ((_ extract 1 1) p0-join-read-11)))
(let (($x1552 (= ?x5775 (_ bv0 1))))
(let (($x5076 (= (not (and (distinct (_ bv0 1) ?x5775) true)) $x1552)))
(not $x5076)))))
(check-sat)
