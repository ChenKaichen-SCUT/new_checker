; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x74 ((_ extract 1 1) p0-join-read-23)))
(let (($x62 (= ?x74 (_ bv0 1))))
(let (($x29 (= (not (and (distinct (_ bv0 1) ?x74) true)) $x62)))
(not $x29)))))
(check-sat)
