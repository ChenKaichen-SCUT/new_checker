; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x67 ((_ extract 1 1) p0-join-read-23)))
(let (($x71 (= ?x67 (_ bv0 1))))
(let (($x33 (= (not (and (distinct (_ bv0 1) ?x67) true)) $x71)))
(not $x33)))))
(check-sat)
