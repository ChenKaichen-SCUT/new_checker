; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x62 ((_ extract 1 1) p0-join-read-11)))
(let (($x24 (= ?x62 (_ bv0 1))))
(let (($x14 (= (not (and (distinct (_ bv0 1) ?x62) true)) $x24)))
(not $x14)))))
(check-sat)
