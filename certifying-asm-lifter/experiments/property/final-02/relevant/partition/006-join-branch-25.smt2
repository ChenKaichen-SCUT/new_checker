; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x13 ((_ extract 1 1) p0-join-read-23)))
(let (($x21 (= ?x13 (_ bv0 1))))
(let (($x65 (= (not (and (distinct (_ bv0 1) ?x13) true)) $x21)))
(not $x65)))))
(check-sat)
