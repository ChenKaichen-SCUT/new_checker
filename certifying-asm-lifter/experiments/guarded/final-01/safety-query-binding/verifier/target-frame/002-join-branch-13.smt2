; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7888 ((_ extract 1 1) p0-join-read-11)))
(let (($x1621 (= ?x7888 (_ bv0 1))))
(let (($x3023 (= (not (and (distinct (_ bv0 1) ?x7888) true)) $x1621)))
(not $x3023)))))
(check-sat)
