; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x27 ((_ extract 0 0) p0-join-read-11)))
(let (($x67 (= ?x27 (_ bv0 1))))
(let (($x52 (= (not (and (distinct (_ bv0 1) ?x27) true)) $x67)))
(not $x52)))))
(check-sat)
