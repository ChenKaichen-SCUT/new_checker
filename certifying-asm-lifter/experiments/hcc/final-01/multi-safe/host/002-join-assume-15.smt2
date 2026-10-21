; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x53 ((_ extract 0 0) p0-join-read-11)))
(let (($x23 (= ?x53 (_ bv0 1))))
(let (($x27 (= (not (and (distinct (_ bv0 1) ?x53) true)) $x23)))
(not $x27)))))
(check-sat)
