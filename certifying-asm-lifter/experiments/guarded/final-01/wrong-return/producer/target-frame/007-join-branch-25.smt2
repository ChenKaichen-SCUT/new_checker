; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5 ((_ extract 1 1) p0-join-read-23)))
(let (($x1354 (= ?x5 (_ bv0 1))))
(let (($x24 (= (not (and (distinct (_ bv0 1) ?x5) true)) $x1354)))
(not $x24)))))
(check-sat)
