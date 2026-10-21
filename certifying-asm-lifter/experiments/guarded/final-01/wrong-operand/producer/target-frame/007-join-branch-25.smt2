; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2472 ((_ extract 1 1) p0-join-read-23)))
(let (($x103 (= ?x2472 (_ bv0 1))))
(let (($x178 (= (not (and (distinct (_ bv0 1) ?x2472) true)) $x103)))
(not $x178)))))
(check-sat)
