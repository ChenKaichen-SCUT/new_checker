; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x584 ((_ extract 0 0) p0-join-read-23)))
(let (($x416 (= ?x584 (_ bv0 1))))
(let (($x384 (= (not (and (distinct (_ bv0 1) ?x584) true)) $x416)))
(not $x384)))))
(check-sat)
