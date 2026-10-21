; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7697 ((_ extract 1 1) p0-join-read-11)))
(let (($x88 (= ?x7697 (_ bv0 1))))
(let (($x24 (= (not (and (distinct (_ bv0 1) ?x7697) true)) $x88)))
(not $x24)))))
(check-sat)
