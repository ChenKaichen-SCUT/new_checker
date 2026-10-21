; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x124 ((_ extract 0 0) p0-join-read-23)))
(let (($x121 (= ?x124 (_ bv0 1))))
(let (($x143 (= (not (and (distinct (_ bv0 1) ?x124) true)) $x121)))
(not $x143)))))
(check-sat)
