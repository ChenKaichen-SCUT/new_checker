; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7860 ((_ extract 1 1) p0-join-read-23)))
(let (($x4159 (= ?x7860 (_ bv0 1))))
(let (($x106 (= (not (and (distinct (_ bv0 1) ?x7860) true)) $x4159)))
(not $x106)))))
(check-sat)
