; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x816 ((_ extract 1 1) p0-join-read-11)))
(let (($x1084 (= ?x816 (_ bv0 1))))
(let (($x2400 (= (not (and (distinct (_ bv0 1) ?x816) true)) $x1084)))
(not $x2400)))))
(check-sat)
