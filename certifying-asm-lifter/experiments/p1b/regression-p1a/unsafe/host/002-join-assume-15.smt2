; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x35 ((_ extract 0 0) p0-join-read-11)))
(let (($x28 (= ?x35 (_ bv0 1))))
(let (($x15 (= (not (and (distinct (_ bv0 1) ?x35) true)) $x28)))
(not $x15)))))
(check-sat)
