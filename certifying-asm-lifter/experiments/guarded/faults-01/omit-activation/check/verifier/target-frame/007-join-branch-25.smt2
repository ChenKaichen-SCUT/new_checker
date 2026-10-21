; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7447 ((_ extract 1 1) p0-join-read-23)))
(let (($x7935 (= ?x7447 (_ bv0 1))))
(let (($x28 (= (not (and (distinct (_ bv0 1) ?x7447) true)) $x7935)))
(not $x28)))))
(check-sat)
