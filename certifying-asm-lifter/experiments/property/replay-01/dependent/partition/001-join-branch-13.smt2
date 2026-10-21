; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x337 ((_ extract 1 1) p0-join-read-11)))
(let (($x380 (= ?x337 (_ bv0 1))))
(let (($x289 (= (not (and (distinct (_ bv0 1) ?x337) true)) $x380)))
(not $x289)))))
(check-sat)
