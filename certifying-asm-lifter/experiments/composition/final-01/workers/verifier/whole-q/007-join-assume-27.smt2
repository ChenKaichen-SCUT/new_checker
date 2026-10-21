; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x65 ((_ extract 0 0) p0-join-read-23)))
(let (($x42 (= ?x65 (_ bv0 1))))
(let (($x38 (= (not (and (distinct (_ bv0 1) ?x65) true)) $x42)))
(not $x38)))))
(check-sat)
