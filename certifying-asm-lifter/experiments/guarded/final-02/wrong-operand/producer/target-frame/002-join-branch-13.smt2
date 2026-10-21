; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1305 ((_ extract 1 1) p0-join-read-11)))
(let (($x1248 (= ?x1305 (_ bv0 1))))
(let (($x120 (= (not (and (distinct (_ bv0 1) ?x1305) true)) $x1248)))
(not $x120)))))
(check-sat)
