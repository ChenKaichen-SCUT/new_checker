; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x87 ((_ extract 0 0) p0-join-read-11)))
(let (($x56 (= ?x87 (_ bv0 1))))
(let (($x110 (= (not (and (distinct (_ bv0 1) ?x87) true)) $x56)))
(not $x110)))))
(check-sat)
