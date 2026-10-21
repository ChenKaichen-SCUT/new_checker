; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1907 ((_ extract 0 0) p0-join-read-11)))
(let (($x5540 (= ?x1907 (_ bv0 1))))
(let (($x5692 (= (not (and (distinct (_ bv0 1) ?x1907) true)) $x5540)))
(not $x5692)))))
(check-sat)
