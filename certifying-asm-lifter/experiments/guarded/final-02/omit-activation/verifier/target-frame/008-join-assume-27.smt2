; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1155 ((_ extract 0 0) p0-join-read-23)))
(let (($x2069 (= ?x1155 (_ bv0 1))))
(let (($x6657 (= (not (and (distinct (_ bv0 1) ?x1155) true)) $x2069)))
(not $x6657)))))
(check-sat)
