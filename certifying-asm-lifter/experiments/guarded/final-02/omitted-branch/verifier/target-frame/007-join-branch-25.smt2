; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8958 ((_ extract 1 1) p0-join-read-23)))
(let (($x5460 (= ?x8958 (_ bv0 1))))
(let (($x5681 (= (not (and (distinct (_ bv0 1) ?x8958) true)) $x5460)))
(not $x5681)))))
(check-sat)
