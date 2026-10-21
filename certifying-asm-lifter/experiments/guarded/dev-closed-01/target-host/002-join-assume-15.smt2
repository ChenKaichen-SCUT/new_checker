; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x44 ((_ extract 0 0) p0-join-read-11)))
(let (($x35 (= ?x44 (_ bv0 1))))
(let (($x11 (= (not (and (distinct (_ bv0 1) ?x44) true)) $x35)))
(not $x11)))))
(check-sat)
