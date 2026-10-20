; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x29 ((_ extract 0 0) p0-join-read-11)))
(let (($x39 (= ?x29 (_ bv0 1))))
(let (($x15 (= (not (and (distinct (_ bv0 1) ?x29) true)) $x39)))
(not $x15)))))
(check-sat)
