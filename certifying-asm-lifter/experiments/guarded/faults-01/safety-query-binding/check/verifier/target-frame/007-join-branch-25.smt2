; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x44 ((_ extract 1 1) p0-join-read-23)))
(let (($x7590 (= ?x44 (_ bv0 1))))
(let (($x51 (= (not (and (distinct (_ bv0 1) ?x44) true)) $x7590)))
(not $x51)))))
(check-sat)
