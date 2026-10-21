; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x76 ((_ extract 1 1) p0-join-read-11)))
(let (($x79 (= ?x76 (_ bv0 1))))
(let (($x77 (= (not (and (distinct (_ bv0 1) ?x76) true)) $x79)))
(not $x77)))))
(check-sat)
