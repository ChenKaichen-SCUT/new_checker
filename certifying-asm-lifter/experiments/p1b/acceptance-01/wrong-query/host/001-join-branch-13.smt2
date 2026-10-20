; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x61 ((_ extract 1 1) p0-join-read-11)))
(let (($x41 (= ?x61 (_ bv0 1))))
(let (($x40 (= (not (and (distinct (_ bv0 1) ?x61) true)) $x41)))
(not $x40)))))
(check-sat)
