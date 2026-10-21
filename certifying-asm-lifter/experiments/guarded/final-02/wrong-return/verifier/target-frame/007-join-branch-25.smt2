; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x92 ((_ extract 1 1) p0-join-read-23)))
(let (($x106 (= ?x92 (_ bv0 1))))
(let (($x254 (= (not (and (distinct (_ bv0 1) ?x92) true)) $x106)))
(not $x254)))))
(check-sat)
