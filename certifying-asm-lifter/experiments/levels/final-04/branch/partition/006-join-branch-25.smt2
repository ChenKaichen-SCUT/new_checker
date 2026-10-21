; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x90 ((_ extract 1 1) p0-join-read-23)))
(let (($x119 (= ?x90 (_ bv0 1))))
(let (($x98 (= (not (and (distinct (_ bv0 1) ?x90) true)) $x119)))
(not $x98)))))
(check-sat)
