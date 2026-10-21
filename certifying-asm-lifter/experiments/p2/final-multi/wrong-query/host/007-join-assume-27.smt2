; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x40 ((_ extract 0 0) p0-join-read-23)))
(let (($x67 (= ?x40 (_ bv0 1))))
(let (($x54 (= (not (and (distinct (_ bv0 1) ?x40) true)) $x67)))
(not $x54)))))
(check-sat)
