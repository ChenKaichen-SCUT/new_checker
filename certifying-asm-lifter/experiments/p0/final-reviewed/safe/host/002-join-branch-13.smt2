; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x23 ((_ extract 1 1) p0-join-read-11)))
(let (($x43 (= ?x23 (_ bv0 1))))
(let (($x24 (= (not (and (distinct (_ bv0 1) ?x23) true)) $x43)))
(not $x24)))))
(check-sat)
