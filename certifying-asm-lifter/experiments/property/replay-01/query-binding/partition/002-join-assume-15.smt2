; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2666 ((_ extract 0 0) p0-join-read-11)))
(let (($x409 (= ?x2666 (_ bv0 1))))
(let (($x2524 (= (not (and (distinct (_ bv0 1) ?x2666) true)) $x409)))
(not $x2524)))))
(check-sat)
