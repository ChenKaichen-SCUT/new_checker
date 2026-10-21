; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x10 ((_ extract 1 1) p0-join-read-11)))
(let (($x499 (= ?x10 (_ bv0 1))))
(let (($x60 (= (not (and (distinct (_ bv0 1) ?x10) true)) $x499)))
(not $x60)))))
(check-sat)
