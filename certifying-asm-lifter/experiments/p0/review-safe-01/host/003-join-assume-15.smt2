; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x36 ((_ extract 0 0) p0-join-read-11)))
(let (($x37 (= ?x36 (_ bv0 1))))
(let (($x22 (= (not (and (distinct (_ bv0 1) ?x36) true)) $x37)))
(not $x22)))))
(check-sat)
