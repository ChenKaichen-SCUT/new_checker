; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1672 ((_ extract 0 0) p0-join-read-11)))
(let (($x8289 (= ?x1672 (_ bv0 1))))
(let (($x6961 (= (not (and (distinct (_ bv0 1) ?x1672) true)) $x8289)))
(not $x6961)))))
(check-sat)
