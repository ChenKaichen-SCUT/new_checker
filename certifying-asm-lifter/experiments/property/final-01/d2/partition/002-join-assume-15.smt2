; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x10 ((_ extract 0 0) p0-join-read-11)))
(let (($x73 (= ?x10 (_ bv0 1))))
(let (($x7 (= (not (and (distinct (_ bv0 1) ?x10) true)) $x73)))
(not $x7)))))
(check-sat)
