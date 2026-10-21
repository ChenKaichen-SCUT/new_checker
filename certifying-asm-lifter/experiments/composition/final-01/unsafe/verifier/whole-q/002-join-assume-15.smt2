; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x43 ((_ extract 0 0) p0-join-read-11)))
(let (($x26 (= ?x43 (_ bv0 1))))
(let (($x59 (= (not (and (distinct (_ bv0 1) ?x43) true)) $x26)))
(not $x59)))))
(check-sat)
