; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5994 ((_ extract 1 1) p0-join-read-11)))
(let (($x1721 (= ?x5994 (_ bv0 1))))
(let (($x6179 (= (not (and (distinct (_ bv0 1) ?x5994) true)) $x1721)))
(not $x6179)))))
(check-sat)
