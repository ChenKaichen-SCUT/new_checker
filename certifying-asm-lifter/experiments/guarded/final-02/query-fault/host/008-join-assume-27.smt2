; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6106 ((_ extract 0 0) p0-join-read-23)))
(let (($x1594 (= ?x6106 (_ bv0 1))))
(let (($x3853 (= (not (and (distinct (_ bv0 1) ?x6106) true)) $x1594)))
(not $x3853)))))
(check-sat)
