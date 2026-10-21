; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3209 ((_ extract 0 0) p0-join-read-23)))
(let (($x7134 (= ?x3209 (_ bv0 1))))
(let (($x1853 (= (not (and (distinct (_ bv0 1) ?x3209) true)) $x7134)))
(not $x1853)))))
(check-sat)
