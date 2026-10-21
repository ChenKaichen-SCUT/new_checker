; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6637 ((_ extract 0 0) p0-join-read-11)))
(let (($x619 (= ?x6637 (_ bv0 1))))
(let (($x6311 (= (not (and (distinct (_ bv0 1) ?x6637) true)) $x619)))
(not $x6311)))))
(check-sat)
