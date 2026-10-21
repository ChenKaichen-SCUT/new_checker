; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x55 ((_ extract 0 0) p0-join-read-23)))
(let (($x25 (= ?x55 (_ bv0 1))))
(let (($x31 (= (not (and (distinct (_ bv0 1) ?x55) true)) $x25)))
(not $x31)))))
(check-sat)
