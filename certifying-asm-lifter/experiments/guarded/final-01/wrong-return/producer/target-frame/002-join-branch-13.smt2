; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1305 ((_ extract 1 1) p0-join-read-11)))
(let (($x5538 (= ?x1305 (_ bv0 1))))
(let (($x88 (= (not (and (distinct (_ bv0 1) ?x1305) true)) $x5538)))
(not $x88)))))
(check-sat)
