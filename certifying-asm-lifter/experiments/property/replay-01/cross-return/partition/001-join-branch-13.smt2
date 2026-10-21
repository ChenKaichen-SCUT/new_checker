; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2854 ((_ extract 1 1) p0-join-read-11)))
(let (($x977 (= ?x2854 (_ bv0 1))))
(let (($x1086 (= (not (and (distinct (_ bv0 1) ?x2854) true)) $x977)))
(not $x1086)))))
(check-sat)
