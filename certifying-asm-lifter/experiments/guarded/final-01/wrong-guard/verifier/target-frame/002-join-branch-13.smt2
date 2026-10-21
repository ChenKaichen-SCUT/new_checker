; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2802 ((_ extract 1 1) p0-join-read-11)))
(let (($x31 (= ?x2802 (_ bv0 1))))
(let (($x127 (= (not (and (distinct (_ bv0 1) ?x2802) true)) $x31)))
(not $x127)))))
(check-sat)
