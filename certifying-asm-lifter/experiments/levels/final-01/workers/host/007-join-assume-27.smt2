; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x14 ((_ extract 0 0) p0-join-read-23)))
(let (($x44 (= ?x14 (_ bv0 1))))
(let (($x46 (= (not (and (distinct (_ bv0 1) ?x14) true)) $x44)))
(not $x46)))))
(check-sat)
