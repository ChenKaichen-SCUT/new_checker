; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x117 ((_ extract 0 0) p0-join-read-23)))
(let (($x4289 (= ?x117 (_ bv0 1))))
(let (($x8703 (= (not (and (distinct (_ bv0 1) ?x117) true)) $x4289)))
(not $x8703)))))
(check-sat)
