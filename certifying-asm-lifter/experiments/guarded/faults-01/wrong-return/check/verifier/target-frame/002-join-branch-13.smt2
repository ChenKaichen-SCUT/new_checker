; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7447 ((_ extract 1 1) p0-join-read-11)))
(let (($x128 (= ?x7447 (_ bv0 1))))
(let (($x109 (= (not (and (distinct (_ bv0 1) ?x7447) true)) $x128)))
(not $x109)))))
(check-sat)
