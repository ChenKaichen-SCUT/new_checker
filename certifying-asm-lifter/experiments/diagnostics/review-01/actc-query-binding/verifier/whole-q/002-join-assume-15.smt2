; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x62 ((_ extract 0 0) p0-join-read-11)))
(let (($x30 (= ?x62 (_ bv0 1))))
(let (($x49 (= (not (and (distinct (_ bv0 1) ?x62) true)) $x30)))
(not $x49)))))
(check-sat)
