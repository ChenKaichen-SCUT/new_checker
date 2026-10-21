; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6767 ((_ extract 1 1) p0-join-read-23)))
(let (($x2584 (= ?x6767 (_ bv0 1))))
(let (($x8071 (= (not (and (distinct (_ bv0 1) ?x6767) true)) $x2584)))
(not $x8071)))))
(check-sat)
