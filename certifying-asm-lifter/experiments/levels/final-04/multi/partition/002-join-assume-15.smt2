; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x79 ((_ extract 0 0) p0-join-read-11)))
(let (($x92 (= ?x79 (_ bv0 1))))
(let (($x101 (= (not (and (distinct (_ bv0 1) ?x79) true)) $x92)))
(not $x101)))))
(check-sat)
