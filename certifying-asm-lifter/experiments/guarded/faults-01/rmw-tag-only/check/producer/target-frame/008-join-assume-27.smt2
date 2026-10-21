; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8932 ((_ extract 0 0) p0-join-read-23)))
(let (($x260 (= ?x8932 (_ bv0 1))))
(let (($x818 (= (not (and (distinct (_ bv0 1) ?x8932) true)) $x260)))
(not $x818)))))
(check-sat)
