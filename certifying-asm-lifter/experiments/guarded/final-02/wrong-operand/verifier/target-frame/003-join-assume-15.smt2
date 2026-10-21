; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3763 ((_ extract 0 0) p0-join-read-11)))
(let (($x3394 (= ?x3763 (_ bv0 1))))
(let (($x254 (= (not (and (distinct (_ bv0 1) ?x3763) true)) $x3394)))
(not $x254)))))
(check-sat)
