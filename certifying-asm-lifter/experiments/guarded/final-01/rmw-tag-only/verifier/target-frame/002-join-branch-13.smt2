; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6179 ((_ extract 1 1) p0-join-read-11)))
(let (($x3716 (= ?x6179 (_ bv0 1))))
(let (($x138 (= (not (and (distinct (_ bv0 1) ?x6179) true)) $x3716)))
(not $x138)))))
(check-sat)
