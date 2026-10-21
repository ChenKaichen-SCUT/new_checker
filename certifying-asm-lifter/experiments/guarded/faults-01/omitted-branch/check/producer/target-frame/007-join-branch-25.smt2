; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6 ((_ extract 1 1) p0-join-read-23)))
(let (($x275 (= ?x6 (_ bv0 1))))
(let (($x87 (= (not (and (distinct (_ bv0 1) ?x6) true)) $x275)))
(not $x87)))))
(check-sat)
