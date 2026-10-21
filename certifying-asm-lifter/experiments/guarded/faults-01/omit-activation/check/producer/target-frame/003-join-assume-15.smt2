; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6215 ((_ extract 0 0) p0-join-read-11)))
(let (($x2324 (= ?x6215 (_ bv0 1))))
(let (($x2602 (= (not (and (distinct (_ bv0 1) ?x6215) true)) $x2324)))
(not $x2602)))))
(check-sat)
