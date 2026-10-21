; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5958 ((_ extract 1 1) p0-join-read-23)))
(let (($x3391 (= ?x5958 (_ bv0 1))))
(let (($x108 (= (not (and (distinct (_ bv0 1) ?x5958) true)) $x3391)))
(not $x108)))))
(check-sat)
