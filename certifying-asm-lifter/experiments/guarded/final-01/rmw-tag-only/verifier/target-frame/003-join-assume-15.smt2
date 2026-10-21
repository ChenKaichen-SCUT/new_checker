; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x371 ((_ extract 0 0) p0-join-read-11)))
(let (($x2906 (= ?x371 (_ bv0 1))))
(let (($x7628 (= (not (and (distinct (_ bv0 1) ?x371) true)) $x2906)))
(not $x7628)))))
(check-sat)
