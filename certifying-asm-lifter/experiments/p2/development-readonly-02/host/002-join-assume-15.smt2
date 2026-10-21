; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x24 ((_ extract 0 0) p0-join-read-11)))
(let (($x43 (= ?x24 (_ bv0 1))))
(let (($x50 (= (not (and (distinct (_ bv0 1) ?x24) true)) $x43)))
(not $x50)))))
(check-sat)
