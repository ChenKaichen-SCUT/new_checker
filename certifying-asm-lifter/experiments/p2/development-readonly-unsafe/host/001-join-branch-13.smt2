; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x56 ((_ extract 1 1) p0-join-read-11)))
(let (($x41 (= ?x56 (_ bv0 1))))
(let (($x53 (= (not (and (distinct (_ bv0 1) ?x56) true)) $x41)))
(not $x53)))))
(check-sat)
