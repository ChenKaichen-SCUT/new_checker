; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3214 ((_ extract 0 0) p0-join-read-23)))
(let (($x197 (= ?x3214 (_ bv0 1))))
(let (($x217 (= (not (and (distinct (_ bv0 1) ?x3214) true)) $x197)))
(not $x217)))))
(check-sat)
