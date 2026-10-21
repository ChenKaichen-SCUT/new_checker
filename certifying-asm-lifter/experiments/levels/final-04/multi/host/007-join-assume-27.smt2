; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x83 ((_ extract 0 0) p0-join-read-23)))
(let (($x101 (= ?x83 (_ bv0 1))))
(let (($x56 (= (not (and (distinct (_ bv0 1) ?x83) true)) $x101)))
(not $x56)))))
(check-sat)
