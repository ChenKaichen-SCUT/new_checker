; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x46 ((_ extract 0 0) p0-join-read-11)))
(let (($x32 (= ?x46 (_ bv0 1))))
(let (($x56 (= (not (and (distinct (_ bv0 1) ?x46) true)) $x32)))
(not $x56)))))
(check-sat)
