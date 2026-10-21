; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1610 ((_ extract 1 1) p0-join-read-23)))
(let (($x5443 (= ?x1610 (_ bv0 1))))
(let (($x3325 (= (not (and (distinct (_ bv0 1) ?x1610) true)) $x5443)))
(not $x3325)))))
(check-sat)
