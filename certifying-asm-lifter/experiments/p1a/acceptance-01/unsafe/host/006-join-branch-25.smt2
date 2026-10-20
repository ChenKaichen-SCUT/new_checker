; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x20 ((_ extract 1 1) p0-join-read-23)))
(let (($x38 (= ?x20 (_ bv0 1))))
(let (($x54 (= (not (and (distinct (_ bv0 1) ?x20) true)) $x38)))
(not $x54)))))
(check-sat)
