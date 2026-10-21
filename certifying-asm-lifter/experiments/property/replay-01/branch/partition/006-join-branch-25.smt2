; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x306 ((_ extract 1 1) p0-join-read-23)))
(let (($x461 (= ?x306 (_ bv0 1))))
(let (($x459 (= (not (and (distinct (_ bv0 1) ?x306) true)) $x461)))
(not $x459)))))
(check-sat)
