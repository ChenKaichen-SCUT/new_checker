; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x756 ((_ extract 1 1) p0-join-read-11)))
(let (($x5443 (= ?x756 (_ bv0 1))))
(let (($x6117 (= (not (and (distinct (_ bv0 1) ?x756) true)) $x5443)))
(not $x6117)))))
(check-sat)
