; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6961 ((_ extract 0 0) p0-join-read-23)))
(let (($x370 (= ?x6961 (_ bv0 1))))
(let (($x8741 (= (not (and (distinct (_ bv0 1) ?x6961) true)) $x370)))
(not $x8741)))))
(check-sat)
