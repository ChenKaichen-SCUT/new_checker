; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x67 ((_ extract 0 0) p0-join-read-11)))
(let (($x11 (= ?x67 (_ bv0 1))))
(let (($x74 (= (not (and (distinct (_ bv0 1) ?x67) true)) $x11)))
(not $x74)))))
(check-sat)
