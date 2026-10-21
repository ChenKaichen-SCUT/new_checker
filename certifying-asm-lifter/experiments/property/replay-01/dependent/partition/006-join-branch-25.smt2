; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x333 ((_ extract 1 1) p0-join-read-23)))
(let (($x458 (= ?x333 (_ bv0 1))))
(let (($x440 (= (not (and (distinct (_ bv0 1) ?x333) true)) $x458)))
(not $x440)))))
(check-sat)
