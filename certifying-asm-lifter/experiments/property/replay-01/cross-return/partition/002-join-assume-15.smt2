; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x411 ((_ extract 0 0) p0-join-read-11)))
(let (($x408 (= ?x411 (_ bv0 1))))
(let (($x730 (= (not (and (distinct (_ bv0 1) ?x411) true)) $x408)))
(not $x730)))))
(check-sat)
