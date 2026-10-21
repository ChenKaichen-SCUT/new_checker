; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x163 ((_ extract 0 0) p0-join-read-11)))
(let (($x2497 (= ?x163 (_ bv0 1))))
(let (($x127 (= (not (and (distinct (_ bv0 1) ?x163) true)) $x2497)))
(not $x127)))))
(check-sat)
