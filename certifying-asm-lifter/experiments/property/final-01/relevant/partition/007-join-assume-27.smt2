; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x67 ((_ extract 0 0) p0-join-read-23)))
(let (($x26 (= ?x67 (_ bv0 1))))
(let (($x78 (= (not (and (distinct (_ bv0 1) ?x67) true)) $x26)))
(not $x78)))))
(check-sat)
