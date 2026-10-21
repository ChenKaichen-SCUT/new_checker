; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x9 ((_ extract 1 1) p0-join-read-11)))
(let (($x55 (= ?x9 (_ bv0 1))))
(let (($x57 (= (not (and (distinct (_ bv0 1) ?x9) true)) $x55)))
(not $x57)))))
(check-sat)
