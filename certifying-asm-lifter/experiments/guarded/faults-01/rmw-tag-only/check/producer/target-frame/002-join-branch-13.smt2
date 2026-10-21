; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1617 ((_ extract 1 1) p0-join-read-11)))
(let (($x6951 (= ?x1617 (_ bv0 1))))
(let (($x3231 (= (not (and (distinct (_ bv0 1) ?x1617) true)) $x6951)))
(not $x3231)))))
(check-sat)
