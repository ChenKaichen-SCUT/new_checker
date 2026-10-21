; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x138 ((_ extract 1 1) p0-join-read-23)))
(let (($x8958 (= ?x138 (_ bv0 1))))
(let (($x134 (= (not (and (distinct (_ bv0 1) ?x138) true)) $x8958)))
(not $x134)))))
(check-sat)
