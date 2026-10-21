; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x52 ((_ extract 0 0) p0-join-read-11)))
(let (($x68 (= ?x52 (_ bv0 1))))
(let (($x69 (= (not (and (distinct (_ bv0 1) ?x52) true)) $x68)))
(not $x69)))))
(check-sat)
