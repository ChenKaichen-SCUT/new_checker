; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x71 ((_ extract 0 0) p0-join-read-23)))
(let (($x61 (= ?x71 (_ bv0 1))))
(let (($x75 (= (not (and (distinct (_ bv0 1) ?x71) true)) $x61)))
(not $x75)))))
(check-sat)
