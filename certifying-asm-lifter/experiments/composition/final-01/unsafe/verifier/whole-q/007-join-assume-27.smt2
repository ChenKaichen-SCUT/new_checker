; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x69 ((_ extract 0 0) p0-join-read-23)))
(let (($x52 (= ?x69 (_ bv0 1))))
(let (($x20 (= (not (and (distinct (_ bv0 1) ?x69) true)) $x52)))
(not $x20)))))
(check-sat)
