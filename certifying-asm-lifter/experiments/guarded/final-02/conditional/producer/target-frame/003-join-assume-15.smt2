; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x138 ((_ extract 0 0) p0-join-read-11)))
(let (($x17 (= ?x138 (_ bv0 1))))
(let (($x217 (= (not (and (distinct (_ bv0 1) ?x138) true)) $x17)))
(not $x217)))))
(check-sat)
