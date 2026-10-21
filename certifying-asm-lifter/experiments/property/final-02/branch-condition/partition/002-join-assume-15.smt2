; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x121 ((_ extract 0 0) p0-join-read-11)))
(let (($x120 (= ?x121 (_ bv0 1))))
(let (($x132 (= (not (and (distinct (_ bv0 1) ?x121) true)) $x120)))
(not $x132)))))
(check-sat)
