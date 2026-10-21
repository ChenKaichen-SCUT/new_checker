; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x65 ((_ extract 1 1) p0-join-read-11)))
(let (($x77 (= ?x65 (_ bv0 1))))
(let (($x13 (= (not (and (distinct (_ bv0 1) ?x65) true)) $x77)))
(not $x13)))))
(check-sat)
