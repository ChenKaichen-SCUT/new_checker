; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x77 ((_ extract 0 0) p0-join-read-11)))
(let (($x88 (= ?x77 (_ bv0 1))))
(let (($x106 (= (not (and (distinct (_ bv0 1) ?x77) true)) $x88)))
(not $x106)))))
(check-sat)
