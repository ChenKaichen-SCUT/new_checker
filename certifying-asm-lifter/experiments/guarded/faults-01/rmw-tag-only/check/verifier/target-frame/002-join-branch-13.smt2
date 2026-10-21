; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3231 ((_ extract 1 1) p0-join-read-11)))
(let (($x8174 (= ?x3231 (_ bv0 1))))
(let (($x3352 (= (not (and (distinct (_ bv0 1) ?x3231) true)) $x8174)))
(not $x3352)))))
(check-sat)
