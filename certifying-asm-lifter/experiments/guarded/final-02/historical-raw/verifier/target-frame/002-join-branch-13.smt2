; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1238 ((_ extract 1 1) p0-join-read-11)))
(let (($x3297 (= ?x1238 (_ bv0 1))))
(let (($x31 (= (not (and (distinct (_ bv0 1) ?x1238) true)) $x3297)))
(not $x31)))))
(check-sat)
