; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x30 ((_ extract 0 0) p0-join-read-23)))
(let (($x50 (= ?x30 (_ bv0 1))))
(let (($x78 (= (not (and (distinct (_ bv0 1) ?x30) true)) $x50)))
(not $x78)))))
(check-sat)
