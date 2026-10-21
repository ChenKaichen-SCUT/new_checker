; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x145 ((_ extract 0 0) p0-join-read-23)))
(let (($x110 (= ?x145 (_ bv0 1))))
(let (($x112 (= (not (and (distinct (_ bv0 1) ?x145) true)) $x110)))
(not $x112)))))
(check-sat)
