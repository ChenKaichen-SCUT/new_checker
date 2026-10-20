; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x42 ((_ extract 0 0) p0-join-read-23)))
(let (($x35 (= ?x42 (_ bv0 1))))
(let (($x23 (= (not (and (distinct (_ bv0 1) ?x42) true)) $x35)))
(not $x23)))))
(check-sat)
