; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x59 ((_ extract 0 0) p0-join-read-11)))
(let (($x67 (= ?x59 (_ bv0 1))))
(let (($x38 (= (not (and (distinct (_ bv0 1) ?x59) true)) $x67)))
(not $x38)))))
(check-sat)
