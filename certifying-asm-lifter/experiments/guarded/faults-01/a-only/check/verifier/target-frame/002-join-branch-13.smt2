; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1386 ((_ extract 1 1) p0-join-read-11)))
(let (($x103 (= ?x1386 (_ bv0 1))))
(let (($x2012 (= (not (and (distinct (_ bv0 1) ?x1386) true)) $x103)))
(not $x2012)))))
(check-sat)
