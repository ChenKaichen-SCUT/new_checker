; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x10 ((_ extract 1 1) p0-join-read-11)))
(let (($x79 (= ?x10 (_ bv0 1))))
(let (($x42 (= (not (and (distinct (_ bv0 1) ?x10) true)) $x79)))
(not $x42)))))
(check-sat)
