; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8380 ((_ extract 0 0) p0-join-read-11)))
(let (($x5532 (= ?x8380 (_ bv0 1))))
(let (($x6117 (= (not (and (distinct (_ bv0 1) ?x8380) true)) $x5532)))
(not $x6117)))))
(check-sat)
