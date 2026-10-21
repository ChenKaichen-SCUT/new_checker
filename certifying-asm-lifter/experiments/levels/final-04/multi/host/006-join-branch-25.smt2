; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x76 ((_ extract 1 1) p0-join-read-23)))
(let (($x61 (= ?x76 (_ bv0 1))))
(let (($x108 (= (not (and (distinct (_ bv0 1) ?x76) true)) $x61)))
(not $x108)))))
(check-sat)
