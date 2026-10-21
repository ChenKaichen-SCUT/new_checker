; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x62 ((_ extract 0 0) p0-join-read-23)))
(let (($x3172 (= ?x62 (_ bv0 1))))
(let (($x51 (= (not (and (distinct (_ bv0 1) ?x62) true)) $x3172)))
(not $x51)))))
(check-sat)
