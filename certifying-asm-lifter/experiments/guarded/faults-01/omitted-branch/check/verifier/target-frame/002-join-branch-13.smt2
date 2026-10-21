; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7045 ((_ extract 1 1) p0-join-read-11)))
(let (($x147 (= ?x7045 (_ bv0 1))))
(let (($x2510 (= (not (and (distinct (_ bv0 1) ?x7045) true)) $x147)))
(not $x2510)))))
(check-sat)
