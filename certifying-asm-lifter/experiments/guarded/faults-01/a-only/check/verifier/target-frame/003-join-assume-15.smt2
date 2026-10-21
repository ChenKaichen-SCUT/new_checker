; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1281 ((_ extract 0 0) p0-join-read-11)))
(let (($x2033 (= ?x1281 (_ bv0 1))))
(let (($x224 (= (not (and (distinct (_ bv0 1) ?x1281) true)) $x2033)))
(not $x224)))))
(check-sat)
