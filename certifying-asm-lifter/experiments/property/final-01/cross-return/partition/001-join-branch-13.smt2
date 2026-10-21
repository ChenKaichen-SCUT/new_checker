; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x144 ((_ extract 1 1) p0-join-read-11)))
(let (($x147 (= ?x144 (_ bv0 1))))
(let (($x145 (= (not (and (distinct (_ bv0 1) ?x144) true)) $x147)))
(not $x145)))))
(check-sat)
