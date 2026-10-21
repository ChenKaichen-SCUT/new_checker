; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x23 ((_ extract 1 1) p0-join-read-23)))
(let (($x71 (= ?x23 (_ bv0 1))))
(let (($x62 (= (not (and (distinct (_ bv0 1) ?x23) true)) $x71)))
(not $x62)))))
(check-sat)
