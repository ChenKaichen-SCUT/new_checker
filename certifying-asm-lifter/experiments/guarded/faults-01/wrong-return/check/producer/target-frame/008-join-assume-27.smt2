; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6721 ((_ extract 0 0) p0-join-read-23)))
(let (($x2280 (= ?x6721 (_ bv0 1))))
(let (($x111 (= (not (and (distinct (_ bv0 1) ?x6721) true)) $x2280)))
(not $x111)))))
(check-sat)
