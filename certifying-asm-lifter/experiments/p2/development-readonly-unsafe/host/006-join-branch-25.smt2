; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x17 ((_ extract 1 1) p0-join-read-23)))
(let (($x19 (= ?x17 (_ bv0 1))))
(let (($x44 (= (not (and (distinct (_ bv0 1) ?x17) true)) $x19)))
(not $x44)))))
(check-sat)
