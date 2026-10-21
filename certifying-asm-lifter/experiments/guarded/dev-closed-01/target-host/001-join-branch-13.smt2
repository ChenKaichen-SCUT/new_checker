; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x42 ((_ extract 1 1) p0-join-read-11)))
(let (($x73 (= ?x42 (_ bv0 1))))
(let (($x135 (= (not (and (distinct (_ bv0 1) ?x42) true)) $x73)))
(not $x135)))))
(check-sat)
