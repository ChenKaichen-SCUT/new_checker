; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x70 ((_ extract 0 0) p0-join-read-11)))
(let (($x52 (= ?x70 (_ bv0 1))))
(let (($x59 (= (not (and (distinct (_ bv0 1) ?x70) true)) $x52)))
(not $x59)))))
(check-sat)
