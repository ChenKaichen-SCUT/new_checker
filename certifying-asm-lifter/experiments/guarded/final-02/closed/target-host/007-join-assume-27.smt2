; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x19 ((_ extract 0 0) p0-join-read-23)))
(let (($x6153 (= ?x19 (_ bv0 1))))
(let (($x7823 (= (not (and (distinct (_ bv0 1) ?x19) true)) $x6153)))
(not $x7823)))))
(check-sat)
