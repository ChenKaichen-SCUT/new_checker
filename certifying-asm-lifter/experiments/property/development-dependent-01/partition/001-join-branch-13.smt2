; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x89 ((_ extract 1 1) p0-join-read-11)))
(let (($x92 (= ?x89 (_ bv0 1))))
(let (($x90 (= (not (and (distinct (_ bv0 1) ?x89) true)) $x92)))
(not $x90)))))
(check-sat)
