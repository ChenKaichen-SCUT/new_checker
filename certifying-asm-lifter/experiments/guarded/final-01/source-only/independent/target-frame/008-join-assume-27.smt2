; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2011 ((_ extract 0 0) p0-join-read-23)))
(let (($x5212 (= ?x2011 (_ bv0 1))))
(let (($x2080 (= (not (and (distinct (_ bv0 1) ?x2011) true)) $x5212)))
(not $x2080)))))
(check-sat)
