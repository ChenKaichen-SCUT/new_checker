; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3428 ((_ extract 0 0) p0-join-read-11)))
(let (($x756 (= ?x3428 (_ bv0 1))))
(let (($x1672 (= (not (and (distinct (_ bv0 1) ?x3428) true)) $x756)))
(not $x1672)))))
(check-sat)
