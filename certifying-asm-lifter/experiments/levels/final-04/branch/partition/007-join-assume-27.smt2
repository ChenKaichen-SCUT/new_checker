; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x106 ((_ extract 0 0) p0-join-read-23)))
(let (($x109 (= ?x106 (_ bv0 1))))
(let (($x70 (= (not (and (distinct (_ bv0 1) ?x106) true)) $x109)))
(not $x70)))))
(check-sat)
