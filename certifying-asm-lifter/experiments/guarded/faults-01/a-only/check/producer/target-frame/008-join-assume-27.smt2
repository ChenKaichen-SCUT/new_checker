; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x4522 ((_ extract 0 0) p0-join-read-23)))
(let (($x6303 (= ?x4522 (_ bv0 1))))
(let (($x30 (= (not (and (distinct (_ bv0 1) ?x4522) true)) $x6303)))
(not $x30)))))
(check-sat)
