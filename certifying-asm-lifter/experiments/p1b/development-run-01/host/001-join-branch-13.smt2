; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x53 ((_ extract 1 1) p0-join-read-11)))
(let (($x36 (= ?x53 (_ bv0 1))))
(let (($x17 (= (not (and (distinct (_ bv0 1) ?x53) true)) $x36)))
(not $x17)))))
(check-sat)
