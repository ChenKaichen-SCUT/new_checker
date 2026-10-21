; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3421 ((_ extract 0 0) p0-join-read-11)))
(let (($x6210 (= ?x3421 (_ bv0 1))))
(let (($x5 (= (not (and (distinct (_ bv0 1) ?x3421) true)) $x6210)))
(not $x5)))))
(check-sat)
