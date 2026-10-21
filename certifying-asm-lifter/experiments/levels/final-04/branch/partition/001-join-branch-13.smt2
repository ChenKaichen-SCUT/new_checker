; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x71 ((_ extract 1 1) p0-join-read-11)))
(let (($x62 (= ?x71 (_ bv0 1))))
(let (($x59 (= (not (and (distinct (_ bv0 1) ?x71) true)) $x62)))
(not $x59)))))
(check-sat)
