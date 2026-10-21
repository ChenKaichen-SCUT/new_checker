; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4928 ((_ extract 0 0) p0-join-read-23)))
(let (($x2371 (= ?x4928 (_ bv0 1))))
(let (($x38 (= (not (and (distinct (_ bv0 1) ?x4928) true)) $x2371)))
(not $x38)))))
(check-sat)
