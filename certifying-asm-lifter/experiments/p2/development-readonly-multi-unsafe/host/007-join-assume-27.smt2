; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x210 ((_ extract 0 0) p0-join-read-23)))
(let (($x173 (= ?x210 (_ bv0 1))))
(let (($x1184 (= (not (and (distinct (_ bv0 1) ?x210) true)) $x173)))
(not $x1184)))))
(check-sat)
