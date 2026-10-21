; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3389 ((_ extract 1 1) p0-join-read-11)))
(let (($x6849 (= ?x3389 (_ bv0 1))))
(let (($x7888 (= (not (and (distinct (_ bv0 1) ?x3389) true)) $x6849)))
(not $x7888)))))
(check-sat)
