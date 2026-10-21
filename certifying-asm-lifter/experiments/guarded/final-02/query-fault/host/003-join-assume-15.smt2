; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1053 ((_ extract 0 0) p0-join-read-11)))
(let (($x5555 (= ?x1053 (_ bv0 1))))
(let (($x6401 (= (not (and (distinct (_ bv0 1) ?x1053) true)) $x5555)))
(not $x6401)))))
(check-sat)
