; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4404 ((_ extract 1 1) p0-join-read-23)))
(let (($x4188 (= ?x4404 (_ bv0 1))))
(let (($x117 (= (not (and (distinct (_ bv0 1) ?x4404) true)) $x4188)))
(not $x117)))))
(check-sat)
