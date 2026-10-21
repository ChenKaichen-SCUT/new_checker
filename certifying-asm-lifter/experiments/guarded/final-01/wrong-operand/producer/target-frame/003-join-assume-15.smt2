; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5049 ((_ extract 0 0) p0-join-read-11)))
(let (($x5538 (= ?x5049 (_ bv0 1))))
(let (($x166 (= (not (and (distinct (_ bv0 1) ?x5049) true)) $x5538)))
(not $x166)))))
(check-sat)
