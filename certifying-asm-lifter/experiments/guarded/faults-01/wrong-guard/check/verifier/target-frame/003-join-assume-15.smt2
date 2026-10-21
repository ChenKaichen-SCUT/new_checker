; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5511 ((_ extract 0 0) p0-join-read-11)))
(let (($x722 (= ?x5511 (_ bv0 1))))
(let (($x68 (= (not (and (distinct (_ bv0 1) ?x5511) true)) $x722)))
(not $x68)))))
(check-sat)
