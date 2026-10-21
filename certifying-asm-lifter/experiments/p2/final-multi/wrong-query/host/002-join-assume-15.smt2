; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x34 ((_ extract 0 0) p0-join-read-11)))
(let (($x23 (= ?x34 (_ bv0 1))))
(let (($x33 (= (not (and (distinct (_ bv0 1) ?x34) true)) $x23)))
(not $x33)))))
(check-sat)
