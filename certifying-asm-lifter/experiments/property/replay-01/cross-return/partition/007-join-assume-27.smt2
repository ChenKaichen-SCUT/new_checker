; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2029 ((_ extract 0 0) p0-join-read-23)))
(let (($x1755 (= ?x2029 (_ bv0 1))))
(let (($x1700 (= (not (and (distinct (_ bv0 1) ?x2029) true)) $x1755)))
(not $x1700)))))
(check-sat)
