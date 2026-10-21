; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x131 ((_ extract 0 0) p0-join-read-11)))
(let (($x132 (= ?x131 (_ bv0 1))))
(let (($x134 (= (not (and (distinct (_ bv0 1) ?x131) true)) $x132)))
(not $x134)))))
(check-sat)
