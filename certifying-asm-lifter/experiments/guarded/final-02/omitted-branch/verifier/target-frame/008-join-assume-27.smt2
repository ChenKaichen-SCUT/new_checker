; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1248 ((_ extract 0 0) p0-join-read-23)))
(let (($x1610 (= ?x1248 (_ bv0 1))))
(let (($x4311 (= (not (and (distinct (_ bv0 1) ?x1248) true)) $x1610)))
(not $x4311)))))
(check-sat)
