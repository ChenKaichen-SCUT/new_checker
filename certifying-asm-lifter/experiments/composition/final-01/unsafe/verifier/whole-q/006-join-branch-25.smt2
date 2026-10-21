; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x32 ((_ extract 1 1) p0-join-read-23)))
(let (($x61 (= ?x32 (_ bv0 1))))
(let (($x17 (= (not (and (distinct (_ bv0 1) ?x32) true)) $x61)))
(not $x17)))))
(check-sat)
