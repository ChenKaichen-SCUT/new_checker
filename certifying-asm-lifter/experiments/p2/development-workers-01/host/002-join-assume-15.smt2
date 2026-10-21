; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x55 ((_ extract 0 0) p0-join-read-11)))
(let (($x10 (= ?x55 (_ bv0 1))))
(let (($x52 (= (not (and (distinct (_ bv0 1) ?x55) true)) $x10)))
(not $x52)))))
(check-sat)
