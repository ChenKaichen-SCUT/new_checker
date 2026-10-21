; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x104 ((_ extract 0 0) p0-join-read-11)))
(let (($x95 (= ?x104 (_ bv0 1))))
(let (($x112 (= (not (and (distinct (_ bv0 1) ?x104) true)) $x95)))
(not $x112)))))
(check-sat)
