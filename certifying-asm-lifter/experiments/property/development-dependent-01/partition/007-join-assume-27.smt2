; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x10 ((_ extract 0 0) p0-join-read-23)))
(let (($x71 (= ?x10 (_ bv0 1))))
(let (($x88 (= (not (and (distinct (_ bv0 1) ?x10) true)) $x71)))
(not $x88)))))
(check-sat)
