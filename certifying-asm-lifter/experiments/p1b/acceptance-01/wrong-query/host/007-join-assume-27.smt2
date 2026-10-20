; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x29 ((_ extract 0 0) p0-join-read-23)))
(let (($x35 (= ?x29 (_ bv0 1))))
(let (($x56 (= (not (and (distinct (_ bv0 1) ?x29) true)) $x35)))
(not $x56)))))
(check-sat)
