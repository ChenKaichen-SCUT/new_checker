; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2892 ((_ extract 0 0) p0-join-read-11)))
(let (($x2477 (= ?x2892 (_ bv0 1))))
(let (($x96 (= (not (and (distinct (_ bv0 1) ?x2892) true)) $x2477)))
(not $x96)))))
(check-sat)
