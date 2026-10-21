; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x20 ((_ extract 0 0) p0-join-read-23)))
(let (($x52 (= ?x20 (_ bv0 1))))
(let (($x37 (= (not (and (distinct (_ bv0 1) ?x20) true)) $x52)))
(not $x37)))))
(check-sat)
