; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x16 ((_ extract 1 1) p0-join-read-23)))
(let (($x32 (= ?x16 (_ bv0 1))))
(let (($x33 (= (not (and (distinct (_ bv0 1) ?x16) true)) $x32)))
(not $x33)))))
(check-sat)
