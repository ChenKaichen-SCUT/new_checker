; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8009 ((_ extract 1 1) p0-join-read-23)))
(let (($x3190 (= ?x8009 (_ bv0 1))))
(let (($x101 (= (not (and (distinct (_ bv0 1) ?x8009) true)) $x3190)))
(not $x101)))))
(check-sat)
