; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x16 ((_ extract 1 1) p0-join-read-11)))
(let (($x55 (= ?x16 (_ bv0 1))))
(let (($x35 (= (not (and (distinct (_ bv0 1) ?x16) true)) $x55)))
(not $x35)))))
(check-sat)
