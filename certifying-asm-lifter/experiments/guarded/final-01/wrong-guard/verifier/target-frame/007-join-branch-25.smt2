; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6961 ((_ extract 1 1) p0-join-read-23)))
(let (($x203 (= ?x6961 (_ bv0 1))))
(let (($x63 (= (not (and (distinct (_ bv0 1) ?x6961) true)) $x203)))
(not $x63)))))
(check-sat)
