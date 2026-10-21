; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x81 ((_ extract 0 0) p0-join-read-23)))
(let (($x93 (= ?x81 (_ bv0 1))))
(let (($x78 (= (not (and (distinct (_ bv0 1) ?x81) true)) $x93)))
(not $x78)))))
(check-sat)
