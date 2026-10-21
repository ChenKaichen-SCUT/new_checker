; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1049 ((_ extract 0 0) p0-join-read-11)))
(let (($x5960 (= ?x1049 (_ bv0 1))))
(let (($x147 (= (not (and (distinct (_ bv0 1) ?x1049) true)) $x5960)))
(not $x147)))))
(check-sat)
