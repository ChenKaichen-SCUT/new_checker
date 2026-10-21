; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5688 ((_ extract 1 1) p0-join-read-11)))
(let (($x166 (= ?x5688 (_ bv0 1))))
(let (($x6456 (= (not (and (distinct (_ bv0 1) ?x5688) true)) $x166)))
(not $x6456)))))
(check-sat)
