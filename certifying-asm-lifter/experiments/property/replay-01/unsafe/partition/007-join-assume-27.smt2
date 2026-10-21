; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x160 ((_ extract 0 0) p0-join-read-23)))
(let (($x145 (= ?x160 (_ bv0 1))))
(let (($x163 (= (not (and (distinct (_ bv0 1) ?x160) true)) $x145)))
(not $x163)))))
(check-sat)
