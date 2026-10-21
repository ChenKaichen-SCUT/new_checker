; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1281 ((_ extract 0 0) p0-join-read-23)))
(let (($x115 (= ?x1281 (_ bv0 1))))
(let (($x3759 (= (not (and (distinct (_ bv0 1) ?x1281) true)) $x115)))
(not $x3759)))))
(check-sat)
