; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x52 ((_ extract 1 1) p0-join-read-11)))
(let (($x55 (= ?x52 (_ bv0 1))))
(let (($x36 (= (not (and (distinct (_ bv0 1) ?x52) true)) $x55)))
(not $x36)))))
(check-sat)
