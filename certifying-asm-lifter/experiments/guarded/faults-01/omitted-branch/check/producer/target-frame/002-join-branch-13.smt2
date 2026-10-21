; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7824 ((_ extract 1 1) p0-join-read-11)))
(let (($x52 (= ?x7824 (_ bv0 1))))
(let (($x44 (= (not (and (distinct (_ bv0 1) ?x7824) true)) $x52)))
(not $x44)))))
(check-sat)
