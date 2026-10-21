; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x740 ((_ extract 1 1) p0-join-read-23)))
(let (($x737 (= ?x740 (_ bv0 1))))
(let (($x1468 (= (not (and (distinct (_ bv0 1) ?x740) true)) $x737)))
(not $x1468)))))
(check-sat)
