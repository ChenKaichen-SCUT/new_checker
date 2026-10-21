; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7523 ((_ extract 1 1) p0-join-read-11)))
(let (($x3231 (= ?x7523 (_ bv0 1))))
(let (($x28 (= (not (and (distinct (_ bv0 1) ?x7523) true)) $x3231)))
(not $x28)))))
(check-sat)
