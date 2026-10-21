; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x55 ((_ extract 1 1) p0-join-read-11)))
(let (($x77 (= ?x55 (_ bv0 1))))
(let (($x10 (= (not (and (distinct (_ bv0 1) ?x55) true)) $x77)))
(not $x10)))))
(check-sat)
