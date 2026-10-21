; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x73 ((_ extract 1 1) p0-join-read-11)))
(let (($x83 (= ?x73 (_ bv0 1))))
(let (($x1386 (= (not (and (distinct (_ bv0 1) ?x73) true)) $x83)))
(not $x1386)))))
(check-sat)
