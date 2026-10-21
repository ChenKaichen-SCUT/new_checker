; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x42 ((_ extract 1 1) p0-join-read-23)))
(let (($x20 (= ?x42 (_ bv0 1))))
(let (($x37 (= (not (and (distinct (_ bv0 1) ?x42) true)) $x20)))
(not $x37)))))
(check-sat)
