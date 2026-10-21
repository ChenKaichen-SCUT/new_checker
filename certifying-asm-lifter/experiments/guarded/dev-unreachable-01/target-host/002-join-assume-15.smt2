; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3248 ((_ extract 0 0) p0-join-read-11)))
(let (($x5282 (= ?x3248 (_ bv0 1))))
(let (($x3754 (= (not (and (distinct (_ bv0 1) ?x3248) true)) $x5282)))
(not $x3754)))))
(check-sat)
