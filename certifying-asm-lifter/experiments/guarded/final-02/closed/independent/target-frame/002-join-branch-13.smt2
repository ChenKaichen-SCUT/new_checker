; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6637 ((_ extract 1 1) p0-join-read-11)))
(let (($x6944 (= ?x6637 (_ bv0 1))))
(let (($x5076 (= (not (and (distinct (_ bv0 1) ?x6637) true)) $x6944)))
(not $x5076)))))
(check-sat)
